Function InstallChk {

    param (
        [Parameter(Mandatory)]$AppVersion #Parameter for storing App Version
    )

    # Define the paths to check for the 7-Zip File Manager executable
    $32BitPath = "$Env:ProgramFiles\7-Zip\7zFM.exe"
    $64BitPath = "${Env:ProgramFiles(x86)}\7-Zip\7zFM.exe"

    # Check if the executable exists in either path and compare its version to the specified AppVersion
    If([String](Get-Item -Path $32BitPath,$64BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion){
        Write-Host "Installed"
    }
}

#Replace "XX.XX" with the version of 7-Zip you want to check for
InstallChk -AppVersion "XX.XX"