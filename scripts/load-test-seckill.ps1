param(
    [string]$BaseUrl = "http://127.0.0.1:8081",
    [int]$UserCount = 30,
    [int]$Concurrency = 10,
    [int]$Stock = 10,
    [int]$ShopId = 1,
    [long]$PhoneStart = 13600001000,
    [string]$RedisContainer = "my-redis",
    [string]$RedisPassword = $env:REDIS_PASSWORD,
    [Nullable[long]]$VoucherId = $null
)

$ErrorActionPreference = "Stop"

function Invoke-JsonPost {
    param(
        [string]$Url,
        [object]$Body = $null,
        [string]$Token = $null
    )

    $headers = @{}
    if ($Token) {
        $headers["authorization"] = $Token
    }

    if ($null -eq $Body) {
        return Invoke-RestMethod -Uri $Url -Method Post -Headers $headers -ContentType "application/json"
    }

    $json = $Body | ConvertTo-Json -Depth 6 -Compress
    return Invoke-RestMethod -Uri $Url -Method Post -Headers $headers -ContentType "application/json" -Body $json
}

function Set-LoginCode {
    param(
        [string]$Phone
    )

    $key = "login:code:$Phone"
    $previousRedisAuth = $env:REDISCLI_AUTH
    try {
        $env:REDISCLI_AUTH = $RedisPassword
        docker exec -e REDISCLI_AUTH $RedisContainer redis-cli SETEX $key 120 123456 | Out-Null
        if ($LASTEXITCODE -ne 0) { throw 'Could not create the load-test verification code.' }
    } finally { $env:REDISCLI_AUTH = $previousRedisAuth }
}

function New-SeckillVoucher {
    $now = Get-Date
    $body = @{
        shopId      = $ShopId
        title       = "压测秒杀券-$($now.ToString('MMddHHmmss'))"
        subTitle    = "PowerShell 压测"
        rules       = "压测专用"
        payValue    = 1000
        actualValue = 1200
        type        = 1
        stock       = $Stock
        beginTime   = $now.AddMinutes(-1).ToString("s")
        endTime     = $now.AddHours(2).ToString("s")
    }
    $result = Invoke-JsonPost -Url "$BaseUrl/voucher/seckill" -Body $body
    if (-not $result.success) {
        throw "创建秒杀券失败: $($result.errorMsg)"
    }
    return [long]$result.data
}

function Login-Users {
    $tokens = New-Object System.Collections.Generic.List[string]
    for ($i = 0; $i -lt $UserCount; $i++) {
        $phone = [string]($PhoneStart + $i)
        Set-LoginCode -Phone $phone
        $result = Invoke-JsonPost -Url "$BaseUrl/user/login" -Body @{
            phone = $phone
            code  = "123456"
        }
        if (-not $result.success) {
            throw "登录失败, phone=$phone, error=$($result.errorMsg)"
        }
        $tokens.Add([string]$result.data)
    }
    return $tokens
}

function Invoke-SeckillBatch {
    param(
        [System.Collections.Generic.List[string]]$Tokens,
        [long]$TargetVoucherId
    )

    $jobs = @()
    foreach ($token in $Tokens) {
        $jobs += Start-Job -ScriptBlock {
            param($url, $authToken)
            $started = Get-Date
            try {
                $result = Invoke-RestMethod -Uri $url -Method Post -Headers @{ authorization = $authToken } -ContentType "application/json"
                [pscustomobject]@{
                    Success = [bool]$result.success
                    Error   = if ($result.success) { "SUCCESS" } else { [string]$result.errorMsg }
                    Ms      = [int]((Get-Date) - $started).TotalMilliseconds
                }
            } catch {
                [pscustomobject]@{
                    Success = $false
                    Error   = "TRANSPORT_ERROR"
                    Ms      = [int]((Get-Date) - $started).TotalMilliseconds
                }
            }
        } -ArgumentList "$BaseUrl/voucher-order/seckill/$TargetVoucherId", $token
    }

    Wait-Job -Job $jobs | Out-Null
    $results = $jobs | Receive-Job
    $jobs | Remove-Job -Force | Out-Null
    return $results
}

if ($Concurrency -le 0 -or $UserCount -le 0 -or $Stock -le 0) {
    throw "UserCount、Concurrency、Stock 必须大于 0"
}

if ($Concurrency -gt $UserCount) {
    $Concurrency = $UserCount
}

$voucher = if ($VoucherId) { [long]$VoucherId } else { New-SeckillVoucher }
$tokens = Login-Users

$allResults = New-Object System.Collections.Generic.List[object]
$wallStart = Get-Date

for ($offset = 0; $offset -lt $tokens.Count; $offset += $Concurrency) {
    $count = [Math]::Min($Concurrency, $tokens.Count - $offset)
    $batchTokens = New-Object System.Collections.Generic.List[string]
    for ($j = 0; $j -lt $count; $j++) {
        $batchTokens.Add($tokens[$offset + $j])
    }
    $batchResults = Invoke-SeckillBatch -Tokens $batchTokens -TargetVoucherId $voucher
    foreach ($item in $batchResults) {
        $allResults.Add($item)
    }
}

$elapsedMs = [int]((Get-Date) - $wallStart).TotalMilliseconds
$successCount = @($allResults | Where-Object { $_.Success }).Count
$failureCount = @($allResults | Where-Object { -not $_.Success -and $_.Error -ne "TRANSPORT_ERROR" }).Count
$transportFailCount = @($allResults | Where-Object { $_.Error -eq "TRANSPORT_ERROR" }).Count
$latencies = @($allResults | ForEach-Object { [int]$_.Ms } | Sort-Object)

function Get-PercentileValue {
    param(
        [int[]]$Numbers,
        [double]$Percentile
    )

    if ($Numbers.Count -eq 0) {
        return 0
    }
    $index = [Math]::Ceiling($Numbers.Count * $Percentile) - 1
    if ($index -lt 0) { $index = 0 }
    if ($index -ge $Numbers.Count) { $index = $Numbers.Count - 1 }
    return $Numbers[$index]
}

$avgLatency = if ($latencies.Count -eq 0) { 0 } else { [Math]::Round((($latencies | Measure-Object -Average).Average), 2) }
$qps = if ($elapsedMs -eq 0) { 0 } else { [Math]::Round(($allResults.Count * 1000.0 / $elapsedMs), 2) }
$grouped = $allResults | Group-Object Error | Sort-Object Name

Write-Host ""
Write-Host "========== 秒杀压测结果 =========="
Write-Host "baseUrl        : $BaseUrl"
Write-Host "voucherId      : $voucher"
Write-Host "userCount      : $UserCount"
Write-Host "concurrency    : $Concurrency"
Write-Host "stock          : $Stock"
Write-Host "elapsedMs      : $elapsedMs"
Write-Host "throughputQps  : $qps"
Write-Host "success        : $successCount"
Write-Host "businessFail   : $failureCount"
Write-Host "transportFail  : $transportFailCount"
Write-Host "avgLatencyMs   : $avgLatency"
Write-Host "p50LatencyMs   : $(Get-PercentileValue -Numbers $latencies -Percentile 0.50)"
Write-Host "p90LatencyMs   : $(Get-PercentileValue -Numbers $latencies -Percentile 0.90)"
Write-Host "p99LatencyMs   : $(Get-PercentileValue -Numbers $latencies -Percentile 0.99)"
Write-Host "businessStats  :"
foreach ($group in $grouped) {
    Write-Host "  $($group.Name) = $($group.Count)"
}
Write-Host "=================================="
Write-Host ""
