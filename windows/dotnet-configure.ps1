Write-Host "Setting up dotnet for Windows..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
[Environment]::SetEnvironmentVariable("DOTNET_PRINT_TELEMETRY_MESSAGE", "false", "User")
[Environment]::SetEnvironmentVariable("DOTNET_CLI_TELEMETRY_OPTOUT", "1", "User")

$dotnetToolsJson = Get-Content $PSScriptRoot\..\shared\dotnet-tools.json
$dotnetTools = $dotnetToolsJson | ConvertFrom-Json
Write-Host "Install dotnet tools" -ForegroundColor Green
foreach ($tool in $dotnetTools.tools) {
    Write-Output "dotnet tool update --global $tool"
    dotnet tool update --global $tool
}
