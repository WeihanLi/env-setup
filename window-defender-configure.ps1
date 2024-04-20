Write-Host "Add exclusions from Windows Defender..." -ForegroundColor Green

$exclusions = (
  "$env:USERPROFILE\source\repos"
  "$env:USERPROFILE\.nuget"
  "$env:USERPROFILE\.vscode"
  "$env:USERPROFILE\.dotnet"
  "$env:USERPROFILE\.ssh"
  "$env:USERPROFILE\.kube"
  "$env:USERPROFILE\.ollama"
  "$env:APPDATA\npm"
  "$env:SystemDrive\projects"
  "$env:SystemDrive\documents"
)

foreach ($item in $exclusions) {
  Add-MpPreference -ExclusionPath $item
}
