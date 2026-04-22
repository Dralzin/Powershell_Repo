function InstallChk {
    param (
        [Parameter(Mandatory)]$AppVersion
    )

    $64BitPath = 'C:\Program Files (x86)\GitHubDesktop\GitHubDesktop.exe'
    $regPath = 'HKLM:\SOFTWARE\WOW6432Node\ING Packages'

    If(([String](Get-Item -Path $64BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})){
        Write-Host "Installed"
    }
}
 InstallChk -AppVersion '2.8.1' 