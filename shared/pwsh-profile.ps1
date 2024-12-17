# pre-configure
[Console]::OutputEncoding = [Text.Encoding]::UTF8

# homebrew
# $(/opt/homebrew/bin/brew shellenv) | Invoke-Expression
# oh-my-posh init pwsh --config /opt/homebrew/opt/oh-my-posh/themes/cloud-native-azure.omp.json | Invoke-Expression

# oh-my-posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/cloud-native-azure.omp.json" | Invoke-Expression

# import-modules
# support ConvertTo-Base64
Import-Module Microsoft.PowerShell.TextUtility

# module config

Set-PSReadLineOption -PredictionViewStyle ListView

# Custom alias
Set-Alias -Name d -Value dotnet
Set-Alias -Name g -Value git
Set-Alias -Name k -Value kubectl
Set-Alias -Name grep -Value Select-String
