function DetectZScaler {
    param (
        [Parameter(Mandatory)]$AppVersion,
        [Parameter(Mandatory)]$AppName
    )

    $fPath = "$env:ProgramFiles\Zscaler\ZSATray\ZSATray.exe"
    $regPath = 'HKLM:\SOFTWARE\WOW6432Node\ING Packages'

    
    If(((Get-Item -Path $fPath).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})) {
        Write-Host "Installed"
    }
}
DetectZScaler '4.7.0.223' 'ZscalerClientConnector'