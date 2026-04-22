Function InstallChk {

    param (
        [Parameter(Mandatory)]$AppVersion #Parameter for storing App Version
    )

    # Define the paths to check for the Firefox executable
    $64BitPath = 'C:\Program Files\Mozilla Firefox\firefox.exe'
    $32BitPath = 'C:\Program Files (x86)\Mozilla Firefox\firefox.exe'

    # Check if the executable exists in either path and compare its version to the specified AppVersion
    If([String](Get-Item -Path $64BitPath,$32BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion){
        Write-Host "Installed"
    }
}

#Replace "XXX.X.X" with the version of Firefox you want to check for
InstallChk -AppVersion 'XXX.X.X'
