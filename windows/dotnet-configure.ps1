Write-Host "Setting up dotnet for Windows..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
[Environment]::SetEnvironmentVariable("DOTNET_PRINT_TELEMETRY_MESSAGE", "false", "Machine")
[Environment]::SetEnvironmentVariable("DOTNET_CLI_TELEMETRY_OPTOUT", "1", "Machine")
dotnet tool update --global dotnet-execute --prerelease
dotnet tool update --global dotnet-httpie
dotnet tool update --global dotnet-outdated-tool
dotnet tool update --global dotnet-ef
