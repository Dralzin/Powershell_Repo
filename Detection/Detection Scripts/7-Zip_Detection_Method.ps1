Function InstallChk {

    param (
        [Parameter(Mandatory)]$AppVersion
    )

    $32BitPath = "$Env:ProgramFiles\7-Zip\7zFM.exe"
    $64BitPath = "${Env:ProgramFiles(x86)}\7-Zip\7zFM.exe"

    If([String](Get-Item -Path $32BitPath,$64BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion){
    Write-Host "Installed"
    }
}
InstallChk -AppVersion "24.08"