$AppPath = "${Env:ProgramFiles(x86)}\Lenovo\System Update\tvsu.exe"

# The following code checks to make sure the application is installed
# at the assigned version.
If([String](Get-Item -Path $AppPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion){

 Write-Host "Installed"
}