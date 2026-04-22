Function LiquidwareDetect {
    param (
        [Parameter(Mandatory)]$AppVersion
    )

    $64BitPath = 'C:\Program Files\Liquidware\Connector ID\idcontrol.exe'

    If(([String](Get-Item -Path $64BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})){
        Write-Host "Installed"
    }
}
LiquidwareDetect -AppVersion 'X.X.X-XX' 