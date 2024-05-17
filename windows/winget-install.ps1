# use winget mirror if necessary
# winget source remove winget
# winget source add winget https://mirrors.ustc.edu.cn/winget-source
# reset source
# winget source reset --force

$wingetPackagesJson = Get-Content .\winget-packages.json
$wingetPackages = $wingetPackagesJson | ConvertFrom-Json

$apps = $wingetPackages.apps

foreach ($app in $apps) {
    Write-Output "winget install $app"
    winget install $app --accept-package-agreements --accept-source-agreements --silent --disable-interactivity
}

$appsWithOverride = $wingetPackages.appsWithOverride

foreach ($app in $appsWithOverride) {
    $appId = $app.id
    $appOverride = $app.override
    Write-Output "winget install $appId --override '$appOverride'"
    winget install $appId --override '$appOverride'
}

# install PowerShell modules
# support ConvertTo-Base64/ConvertFrom-Base64
Install-Module Microsoft.PowerShell.TextUtility

# https://ohmyposh.dev/docs/installation/fonts
# install fonts for posh
oh-my-posh font install Hack --user
# posh recommended font => Meslo LGM NF
# oh-my-posh font install Meslo --user

Write-Host "Setting up PowerShell profile..." -ForegroundColor Green
$psProfile = Get-Content ..\shared\pwsh-profile.ps1
Add-Content -Path $PROFILE -Value @psProfile
Write-Host "PowerShell profile configured" -ForegroundColor Green
Get-Content -Path $PROFILE

# openlens configure
# install extensions, File => Extensions
#   @alebcay/openlens-node-pod-menu
#   @ottimis/lens-version-update

# install fonts
# JetBrains Mono # https://github.com/JetBrains/JetBrainsMono/releases

Write-Output "Git config"
Copy-Item ../shared/.gitconfig ~/.gitconfig
