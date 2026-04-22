$AppVersion = '6.2.6.49050'
$64BitPath = 'C:\Program Files\Zoom\bin\Zoom.exe'
$32BitPath = 'C:\Program Files (x86)\Zoom\bin\Zoom.exe'
If([String](Get-Item -Path $64BitPath,$32BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersionRaw -ge $AppVersion){
Write-Host "Installed"
Exit 0
}
else {
Exit 1
}