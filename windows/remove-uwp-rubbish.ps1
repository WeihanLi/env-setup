function Remove-UWP {
    param (
        [string]$name
    )

    Write-Host "Removing UWP $name..." -ForegroundColor Yellow
    Get-AppxPackage $name | Remove-AppxPackage | Write-Host "UWP $name removed" -ForegroundColor Green
}

# To list all appx packages:
# Get-AppxPackage | Format-Table -Property Name,Version,PackageFullName

Write-Host "Removing UWP Rubbish..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
$uwpRubbishApps = @(
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.PowerAutomateDesktop"
    "Microsoft.BingWeather"
    "Microsoft.BingNews"
    "king.com.CandyCrushSaga"
    "Microsoft.Messaging"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    "4DF9E0F8.Netflix"
    "Microsoft.GetHelp"
    "Microsoft.People"
    "Microsoft.YourPhone"
    "MicrosoftTeams"
    "Microsoft.Getstarted"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.WindowsMaps"
    "Microsoft.MixedReality.Portal"
    "Microsoft.SkypeApp"
    "Microsoft.OneDriveSync"
)

foreach ($uwp in $uwpRubbishApps) {
    Remove-UWP $uwp
}
