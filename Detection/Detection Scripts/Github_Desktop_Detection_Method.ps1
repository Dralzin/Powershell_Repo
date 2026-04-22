function InstallChk {
    param (
        [Parameter(Mandatory)]$AppVersion
    )

    $64BitPath = 'C:\Program Files (x86)\GitHubDesktop\GitHubDesktop.exe'

    If(([String](Get-Item -Path $64BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})){
        Write-Host "Installed"
    }
}
 InstallChk -AppVersion 'X.X.X'