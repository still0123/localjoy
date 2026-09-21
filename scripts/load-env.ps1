$projectRoot = Split-Path $PSScriptRoot -Parent
$environmentPath = Join-Path $projectRoot '.env'
$allowedEnvironmentNames = @('DB_URL','DB_USERNAME','DB_PASSWORD','REDIS_HOST','REDIS_PORT','REDIS_PASSWORD','REDIS_CONTAINER')
if (Test-Path -LiteralPath $environmentPath) {
    foreach ($environmentLine in Get-Content -LiteralPath $environmentPath -Encoding UTF8) {
        if ($environmentLine -match '^\s*(#|$)') { continue }
        $environmentPair = $environmentLine -split '=', 2
        if ($environmentPair.Count -ne 2) { throw 'Invalid entry in .env.' }
        $environmentName = $environmentPair[0].Trim()
        if ($environmentName -notin $allowedEnvironmentNames) { throw ('Unsupported .env setting: ' + $environmentName) }
        [Environment]::SetEnvironmentVariable($environmentName, $environmentPair[1].Trim(), 'Process')
    }
}
