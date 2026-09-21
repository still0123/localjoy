$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
$frontend = Join-Path $projectRoot 'frontend'
$nginxPid = Join-Path $frontend 'logs\nginx.pid'
if (Test-Path -LiteralPath $nginxPid) {
    Push-Location $frontend
    try { & .\nginx.exe -s stop } finally { Pop-Location }
    for ($attempt = 0; $attempt -lt 20; $attempt++) {
        if (!(Test-Path -LiteralPath $nginxPid)) { break }
        Start-Sleep -Milliseconds 200
    }
}
$backendPidFile = Join-Path $projectRoot 'runtime\backend.pid'
if (Test-Path -LiteralPath $backendPidFile) {
    $backendPid = [int](Get-Content -LiteralPath $backendPidFile)
    $process = Get-CimInstance Win32_Process -Filter "ProcessId = $backendPid" -ErrorAction SilentlyContinue
    if ($null -ne $process) {
        if ($process.Name -ne 'java.exe' -or $process.CommandLine -notlike '*lexiang-0.0.1-SNAPSHOT.jar*') {
            throw 'Process identity mismatch; no backend process was stopped.'
        }
        Stop-Process -Id $backendPid
    }
    Remove-Item -LiteralPath $backendPidFile
}
Write-Output 'Lexiang stopped. Shared MySQL and Redis services remain available.'
