Function InstallChk {
    param (
        [Parameter(Mandatory)]$AppVersion
    )

    $64BitPath = 'C:\Program Files\Microsoft VS Code\Code.exe'
    $32BitPath = 'C:\Program Files (x86)\Microsoft VS Code\Code.exe'

    If([String](Get-Item -Path $64BitPath,$32BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion){
        Write-Host "Installed"
    }
}
InstallChk -AppVersion '1.74.2'