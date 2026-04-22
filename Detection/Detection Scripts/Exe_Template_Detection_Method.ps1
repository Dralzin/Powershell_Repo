Function InstallChk {

    param (
        [Parameter(Mandatory)]$AppVersion #Parameter for storing App Version
    )

    # Define the paths to check for the executable
    $32BitPath = "${Env:ProgramFiles(x86)}\"
    $64BitPath = "$Env:ProgramFiles\"

    # Check if the executable exists in either path and compare its version to the specified AppVersion
    If([String](Get-Item -Path $32BitPath,$64BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion){
        Write-Host "Installed"
    }
}

#Replace "XX.XX" with the version of the application to check for.
InstallChk -AppVersion 'XX.XX'