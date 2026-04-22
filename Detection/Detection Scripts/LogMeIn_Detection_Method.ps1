function InstallChk {
    param (
        [Parameter(Mandatory)]$AppVersion #
    )

    # Define the executable path for LogMeIn Resolve
    $fPath = "C:\Program Files (x86)\GoTo Resolve Unattended\*\GoToResolveCustomerAttendedApp.exe"

    # Check if the executable exists in the path and compare its version to the specified AppVersion, also check for the application name in the registry
    If(((Get-Item -Path $fPath).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})) {
        Write-Host "Installed"
    }
}

#Replace "X.XX.X.XXX" with the version of LogMeIn Resolve you want to check for
InstallChk 'X.XX.X.XXX'