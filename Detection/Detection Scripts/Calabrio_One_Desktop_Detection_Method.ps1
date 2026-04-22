Function InstallChk {
    param (
        [Parameter(Mandatory)]$AppVersion
    )

    $64BitPath = 'C:\Program Files\Calabrio One\Desktop\active\bin\DCC.exe'
    $32BitPath = 'C:\Program Files (x86)\Calabrio One\Desktop\active\bin\DCC.exe'

    If([String](Get-Item -Path $64BitPath,$32BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion){
        Write-Host "Installed"
    }
}
InstallChk '22.8.31.3'