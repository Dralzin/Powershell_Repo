function DetectZScaler {
    param (
        [Parameter(Mandatory)]$AppVersion
    )

    $fPath = "$env:ProgramFiles\Zscaler\ZSATray\ZSATray.exe"

    
    If(((Get-Item -Path $fPath).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})) {
        Write-Host "Installed"
    }
}
DetectZScaler -AppVersion 'X.X.X.XXX'