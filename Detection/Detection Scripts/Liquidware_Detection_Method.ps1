Function LiquidwareDetect {
    param (
        [Parameter(Mandatory)]$AppVersion,
        [Parameter(Mandatory)]$AppName
    )

    $64BitPath = 'C:\Program Files\Liquidware\Connector ID\idcontrol.exe'
    $regPath = 'HKLM:\SOFTWARE\WOW6432Node\ING Packages'

    If(([String](Get-Item -Path $64BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})){
        Write-Host "Installed"
    }
}
LiquidwareDetect '6.7.0-14' 'Liquidware'