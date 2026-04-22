function InstallDetect {
    param (
        [Parameter(Mandatory)]$AppVersion
    )

    $fPath = "$env:ProgramFiles\CrowdStrike\CSFalconService.exe"

    
    If(((Get-Item -Path $fPath).VersionInfo.FileVersion -ge $AppVersion)) {
        Write-Host "Installed"
    }
}
InstallDetect -AppVersion 'X.XX.XXXXXX' 