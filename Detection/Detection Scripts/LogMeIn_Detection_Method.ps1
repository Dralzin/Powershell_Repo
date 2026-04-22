function DetectZScaler {
    param (
        [Parameter(Mandatory)]$AppVersion,
        [Parameter(Mandatory)]$AppName
    )

    $fPath = "C:\Program Files (x86)\GoTo Resolve Unattended\*\GoToResolveCustomerAttendedApp.exe"
    $regPath = 'HKLM:\SOFTWARE\WOW6432Node\ING Packages'

    
    If(((Get-Item -Path $fPath).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})) {
        Write-Host "Installed"
    }
}
DetectZScaler '1.31.1.908' 'LogMeInResolveCustomerAttendedApp'