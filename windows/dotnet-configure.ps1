Write-Host "Setting up dotnet for Windows..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
[Environment]::SetEnvironmentVariable("DOTNET_PRINT_TELEMETRY_MESSAGE", "false", "Machine")
[Environment]::SetEnvironmentVariable("DOTNET_CLI_TELEMETRY_OPTOUT", "1", "Machine")

$dotnetToolsJson = Get-Content ..\shared\dotnet-tools.json
$dotnetTools = $dotnetToolsJson | ConvertFrom-Json
foreach ($tool in $dotnetTools) {
    Write-Output "dotnet tool update --global $tool"
    dotnet tool update --global $tool
}