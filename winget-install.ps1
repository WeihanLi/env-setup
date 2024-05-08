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

Write-Host "Setting up Git ..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
# user config
git config --global user.name "Weihan Li"
git config --global user.email "weihanli@outlook.com"
# alias config
git config --global alias.co "checkout"
git config --global alias.cob "checkout -b"
git config --global alias.br "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
git config --global alias.c "commit"
git config --global alias.cm "commit -m"
git config --global alias.cam "commit -am"
git config --global alias.pnv "push --no-verify"
git config --global alias.m "merge"
git config --global alias.s "status -s"
git config --global alias.st "status"
git config --global alias.la "!git config -l | grep alias | cut -c 7-"
git config --global alias.last 'log -1 HEAD'

# configure git proxy to use v2ray proxy for github if necessary
# git config --global http.https://github.com.proxy http://127.0.0.1:10809

Write-Host "Setting up dotnet for Windows..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
[Environment]::SetEnvironmentVariable("DOTNET_PRINT_TELEMETRY_MESSAGE", "false", "Machine")
[Environment]::SetEnvironmentVariable("DOTNET_CLI_TELEMETRY_OPTOUT", "1", "Machine")
dotnet tool update --global dotnet-execute --prerelease
dotnet tool update --global dotnet-httpie
dotnet tool update --global dotnet-outdated-tool
dotnet tool update --global dotnet-ef

# openlens configure
# install extensions, File => Extensions
#   @alebcay/openlens-node-pod-menu
#   @ottimis/lens-version-update

# install fonts
# JetBrains Mono # https://github.com/JetBrains/JetBrainsMono/releases
