function DetectZScaler {
    param (
        [Parameter(Mandatory)]$AppVersion
    )

    $fPath = "C:\Program Files (x86)\GoTo Resolve Unattended\*\GoToResolveCustomerAttendedApp.exe"

    
    If(((Get-Item -Path $fPath).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})) {
        Write-Host "Installed"
    }
}
DetectZScaler 'X.XX.X.XXX'