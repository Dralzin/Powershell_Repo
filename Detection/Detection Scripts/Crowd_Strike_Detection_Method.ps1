function InstallDetect {
    param (
        [Parameter(Mandatory)]$AppVersion #Parameter for storing App Version
    )

    # Define the path to check for the CrowdStrike Falcon Sensor executable
    $fPath = "$env:ProgramFiles\CrowdStrike\CSFalconService.exe"

    # Check if the executable exists and compare its version to the specified AppVersion
    If(((Get-Item -Path $fPath).VersionInfo.FileVersion -ge $AppVersion)) {
        Write-Host "Installed"
    }
}

#Replace "X.XX.XXXXXX" with the version of CrowdStrike Falcon Sensor you want to check for
InstallDetect -AppVersion 'X.XX.XXXXXX' 