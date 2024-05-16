# use winget mirror if necessary
# winget source remove winget
# winget source add winget https://mirrors.ustc.edu.cn/winget-source

$Apps = @(
    "Git.Git", 
    "TortoiseGit.TortoiseGit",
    "Microsoft.PowerShell",
    "JanDeDobbeleer.OhMyPosh",
    "7zip.7zip",
    "agalwood.Motrix",
    "appmakes.Typora",
    "Google.Chrome.EXE",
    "Microsoft.DotNet.SDK.8",
    "Microsoft.DotNet.SDK.Preview",
    "OpenJS.NodeJS",
    "Tencent.WeChat",
    "VideoLAN.VLC",
    "Nikse.SubtitleEdit",
    "OBSProject.OBSStudio",
    "Gyan.FFmpeg",
    "sysinternals",
    "Ollama.Ollama",
    "Alibaba.DingTalk",
    "Docker.DockerDesktop",
    "Kubernetes.kubectl",
    "Helm.Helm",
    "MuhammedKalkan.OpenLens"
)

foreach ($app in $Apps) {
    winget install $app --accept-package-agreements --accept-source-agreements --silent --disable-interactivity
}

# vscode install with context menu option
winget install Microsoft.VisualStudioCode --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'

# install PowerShell modules
# support ConvertTo-Base64/ConvertFrom-Base64
Install-Module Microsoft.PowerShell.TextUtility

# https://ohmyposh.dev/docs/installation/fonts
# install fonts for posh
oh-my-posh font install Hack --user
# posh recommended font => Meslo LGM NF
# oh-my-posh font install Meslo --user

Write-Host "Setting up PowerShell profile..." -ForegroundColor Green
$psProfile = @"
# pre-configure
[Console]::OutputEncoding = [Text.Encoding]::UTF8
# oh-my-posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/atomic.omp.json" | Invoke-Expression

# import-modules
Import-Module Microsoft.PowerShell.TextUtility

# module config

Set-PSReadLineOption -PredictionViewStyle ListView

# Custom alias
Set-Alias -Name grep -Value Select-String
"@
Add-Content -Path $PROFILE -Value @psProfile
Write-Host "PowerShell profile configured" -ForegroundColor Green
Get-Content -Path $PROFILE

# openlens configure
# install extensions, File => Extensions
#   @alebcay/openlens-node-pod-menu
#   @ottimis/lens-version-update

# install fonts
# JetBrains Mono # https://github.com/JetBrains/JetBrainsMono/releases
