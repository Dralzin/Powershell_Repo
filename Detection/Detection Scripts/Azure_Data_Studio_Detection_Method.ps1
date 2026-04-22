Function InstallChk {
    param (
        [Parameter(Mandatory)]$AppVersion #Parameter for storing App Version
    )

    # Define the paths to check for the Visual Studio Code executable
    $64BitPath = 'C:\Program Files\Microsoft VS Code\Code.exe'
    $32BitPath = 'C:\Program Files (x86)\Microsoft VS Code\Code.exe'

    # Check if the executable exists in either path and compare its version to the specified AppVersion
    If([String](Get-Item -Path $64BitPath,$32BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion){
        Write-Host "Installed"
    }
}

#Replace "X.XX.X" with the version of Azure Data Studio you want to check for
InstallChk -AppVersion 'X.XX.X'