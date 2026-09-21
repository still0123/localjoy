param([switch]$Rebuild)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'load-env.ps1')
$projectRoot = Split-Path $PSScriptRoot -Parent
$runtime = Join-Path $projectRoot 'runtime'
$frontend = Join-Path $projectRoot 'frontend'
New-Item -ItemType Directory -Force -Path $runtime,(Join-Path $frontend 'logs'),(Join-Path $frontend 'temp') | Out-Null
function Test-LocalPort([int]$Port) {
    $client = New-Object System.Net.Sockets.TcpClient
    try { $connection = $client.ConnectAsync('127.0.0.1', $Port); return ($connection.Wait(1500) -and $client.Connected) }
    catch { return $false } finally { $client.Dispose() }
}
if (!(Test-LocalPort 3306)) { throw 'Start local MySQL on port 3306 first.' }
if (!(Test-LocalPort 6379)) {
    if (Get-Command docker -ErrorAction SilentlyContinue) {
        $redisContainerName = if ($env:REDIS_CONTAINER) { $env:REDIS_CONTAINER } else { 'my-redis' }
        & docker start $redisContainerName
        if ($LASTEXITCODE -ne 0) { throw 'Start Docker Desktop and Redis, then retry.' }
    }
    if (!(Test-LocalPort 6379)) { throw 'Start Redis on port 6379 first.' }
}
if ((Test-LocalPort 8080) -or (Test-LocalPort 8081)) {
    throw 'Port 8080 or 8081 is already in use. If Lexiang is running, open http://127.0.0.1:8080/ .'
}
$jar = Join-Path $projectRoot 'target\lexiang-0.0.1-SNAPSHOT.jar'
if ($Rebuild -or !(Test-Path -LiteralPath $jar)) {
    Push-Location $projectRoot
    try { & mvn -B '-DskipTests' package; if ($LASTEXITCODE -ne 0) { throw 'Maven build failed.' } }
    finally { Pop-Location }
}
Push-Location $frontend
try { & .\nginx.exe -t; if ($LASTEXITCODE -ne 0) { throw 'Nginx configuration check failed.' } }
finally { Pop-Location }
$backend = Start-Process -FilePath (Get-Command java).Source -ArgumentList @('-Dfile.encoding=UTF-8','-jar','target\lexiang-0.0.1-SNAPSHOT.jar') -WorkingDirectory $projectRoot -WindowStyle Hidden -RedirectStandardOutput (Join-Path $runtime 'backend.log') -RedirectStandardError (Join-Path $runtime 'backend.err.log') -PassThru
$backend.Id | Set-Content -LiteralPath (Join-Path $runtime 'backend.pid')
$ready = $false
$frontendStarted = $false
try {
    for ($attempt = 0; $attempt -lt 60; $attempt++) {
        if ($backend.HasExited) { throw 'Backend exited. See runtime/backend.log and backend.err.log.' }
        try {
            $result = Invoke-RestMethod -Uri 'http://127.0.0.1:8081/shop-type/list' -TimeoutSec 2
            if ($result.success) { $ready = $true; break }
        } catch { }
        Start-Sleep -Seconds 1
    }
    if (!$ready) { throw 'Backend startup timed out. See runtime/backend.log.' }
    $shop = Invoke-RestMethod -Uri 'http://127.0.0.1:8081/shop/1' -TimeoutSec 5
    if (!$shop.success) { throw ('Redis/database check failed: ' + $shop.errorMsg) }
    Start-Process -FilePath (Join-Path $frontend 'nginx.exe') -WorkingDirectory $frontend -WindowStyle Hidden | Out-Null
    $frontendStarted = $true
    for ($attempt = 0; $attempt -lt 10; $attempt++) {
        if (Test-LocalPort 8080) { break }
        Start-Sleep -Milliseconds 500
    }
    $frontPageResponse = Invoke-WebRequest -Uri 'http://127.0.0.1:8080/' -UseBasicParsing -TimeoutSec 5
    if ($frontPageResponse.StatusCode -ne 200) { throw 'Frontend health check failed.' }
    Write-Output 'Lexiang is running: http://127.0.0.1:8080/'
    Write-Output ('Backend PID: ' + $backend.Id)
} catch {
    if ($frontendStarted) {
        Push-Location $frontend
        try { & .\nginx.exe -s quit } finally { Pop-Location }
    }
    if (!$backend.HasExited) { Stop-Process -Id $backend.Id -ErrorAction SilentlyContinue }
    Remove-Item -LiteralPath (Join-Path $runtime 'backend.pid') -ErrorAction SilentlyContinue
    throw
}
