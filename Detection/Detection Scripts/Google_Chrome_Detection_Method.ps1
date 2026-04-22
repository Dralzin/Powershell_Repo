Function InstallChk {

    param (
        [Parameter(Mandatory)]$AppVersion #Parameter for storing App Version
    )

    # Define the paths to check for the Google Chrome executable
    $64BitPath = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
    $32BitPath = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'

    # Check if the executable exists in either path and compare its version to the specified AppVersion
    If([String](Get-Item -Path $64BitPath,$32BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion){
        Write-Host "Installed"
    }
}

#Replace "XXX.X.XXXX.XX" with the version of Google Chrome you want to check for
InstallChk -AppVersion 'XXX.X.XXXX.XX'