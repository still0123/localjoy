param(
    [string]$BaseUrl = "http://127.0.0.1:8081",
    [int]$UserCount = 100,
    [int]$Stock = 50,
    [int]$ShopId = 1,
    [long]$PhoneStart = 13600001000,
    [string]$RedisContainer = "my-redis",
    [string]$RedisPassword = $env:REDIS_PASSWORD,
    [Nullable[long]]$VoucherId = $null,
    [string]$OutDir = ".\jmeter\data"
)

$ErrorActionPreference = "Stop"

function Invoke-JsonPost {
    param(
        [string]$Url,
        [object]$Body
    )

    $json = $Body | ConvertTo-Json -Depth 6 -Compress
    return Invoke-RestMethod -Uri $Url -Method Post -ContentType "application/json" -Body $json
}

function Set-LoginCode {
    param([string]$Phone)

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
        title       = "JMeter压测券-$($now.ToString('MMddHHmmss'))"
        subTitle    = "JMeter load test"
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

if (-not (Test-Path $OutDir)) {
    New-Item -ItemType Directory -Path $OutDir -Force | Out-Null
}

$targetVoucherId = if ($VoucherId) { [long]$VoucherId } else { New-SeckillVoucher }
$csvPath = Join-Path $OutDir "tokens.csv"
$metaPath = Join-Path $OutDir "run.properties"

"token" | Set-Content -Path $csvPath -Encoding UTF8

for ($i = 0; $i -lt $UserCount; $i++) {
    $phone = [string]($PhoneStart + $i)
    Set-LoginCode -Phone $phone
    $loginResult = Invoke-JsonPost -Url "$BaseUrl/user/login" -Body @{
        phone = $phone
        code  = "123456"
    }
    if (-not $loginResult.success) {
        throw "登录失败, phone=$phone, error=$($loginResult.errorMsg)"
    }
    [System.IO.File]::AppendAllText((Resolve-Path $csvPath).Path, ([string]$loginResult.data + [Environment]::NewLine), [System.Text.Encoding]::UTF8)
}

@(
    "baseUrl=$BaseUrl"
    "voucherId=$targetVoucherId"
    "userCount=$UserCount"
    "stock=$Stock"
    "csvPath=$((Resolve-Path $csvPath).Path)"
) | Set-Content -Path $metaPath -Encoding UTF8

Write-Host "voucherId=$targetVoucherId"
Write-Host "csvPath=$((Resolve-Path $csvPath).Path)"
Write-Host "metaPath=$((Resolve-Path $metaPath).Path)"
