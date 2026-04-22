Function InstallChk {

    param (
        [Parameter(Mandatory)]$AppVersion
    )
    $64BitPath = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
    $32BitPath = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
    If([String](Get-Item -Path $64BitPath,$32BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion){
     Write-Host "Installed"
    }
}
InstallChk -AppVersion '122.0.6261.94'