Function InstallChk {
    param (
        [Parameter(Mandatory)]$AppVersion #Parameter for storing App Version
    )

    # Define the paths to check for the Calabrio One Desktop executable
    $64BitPath = 'C:\Program Files\Calabrio One\Desktop\active\bin\DCC.exe'
    $32BitPath = 'C:\Program Files (x86)\Calabrio One\Desktop\active\bin\DCC.exe'

    # Check if the executable exists in either path and compare its version to the specified AppVersion
    If([String](Get-Item -Path $64BitPath,$32BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion){
        Write-Host "Installed"
    }
}

#Replace "XX.X.XX.X" with the version of Calabrio One Desktop you want to check for
InstallChk -AppVersion 'XX.X.XX.X'