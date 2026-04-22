Function QualysChk {
    param (
        [Parameter(Mandatory)]$AppVersion
    )
    
    $fPath = "$($env:ProgramFiles)\Qualys\QualysAgent\QualysAgent.exe"


    If((Get-Item -Path $fPath).VersionInfo.FileVersion -ge $AppVersion) {
        Write-Host "Installed"
    }
}
QualysChk '6.1.0.29'