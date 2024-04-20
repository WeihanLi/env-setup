# use winget mirror if necessary
# winget source remove winget
# winget source add winget https://mirrors.ustc.edu.cn/winget-source

$Apps = @(
    "Git.Git", 
    "TortoiseGit.TortoiseGit",
    "Microsoft.PowerShell",
    "7zip.7zip",
    "agalwood.Motrix",
    "appmakes.Typora",
    "Google.Chrome.EXE",
    "Microsoft.DotNet.SDK.8",
    "Microsoft.DotNet.SDK.Preview",
    "OpenJS.NodeJS",
    "Docker.DockerDesktop",
    "Tencent.WeChat",
    "VideoLAN.VLC",
    "Nikse.SubtitleEdit",
    "OBSProject.OBSStudio",
    "Gyan.FFmpeg"
)

foreach ($app in $Apps) {
    winget install $app
}

# vscode install with context menu option
winget install Microsoft.VisualStudioCode --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'


Write-Host "Setting up Git for Windows..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
git config --global user.email "weihanli@outlook.com"
git config --global user.name "Weihan Li"
# configure git proxy to use v2ray proxy for github if necessary
# git config --global http.https://github.com.proxy http://127.0.0.1:10809

Write-Host "Setting up dotnet for Windows..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
[Environment]::SetEnvironmentVariable("DOTNET_PRINT_TELEMETRY_MESSAGE", "false", "Machine")
[Environment]::SetEnvironmentVariable("DOTNET_CLI_TELEMETRY_OPTOUT", "1", "Machine")
dotnet tool update --global dotnet-execute --prerelease
dotnet tool update --global dotnet-ef
dotnet tool update --global dotnet-httpie
