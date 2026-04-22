Function InstallChk {

    # Define the path to check for the Lenovo System Update executable
    $AppPath = "${Env:ProgramFiles(x86)}\Lenovo\System Update\tvsu.exe"

    #
    If([String](Get-Item -Path $AppPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion){
        Write-Host "Installed"
    }
}

InstallChk