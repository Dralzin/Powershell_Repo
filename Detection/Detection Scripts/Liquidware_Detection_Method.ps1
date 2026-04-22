InstallChk  {
    param (
        [Parameter(Mandatory)]$AppVersion #Parameter for storing App Version
    )

    # Define the registry path to check for the application
    $64BitPath = 'C:\Program Files\Liquidware\Connector ID\idcontrol.exe'

    # Define the registry path to check for the application
    If(([String](Get-Item -Path $64BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})){
        Write-Host "Installed"
    }
}

#Replace "X.X.X-XX" with the version of Liquidware Connector ID you want to check for
InstallChk -AppVersion 'X.X.X-XX' 