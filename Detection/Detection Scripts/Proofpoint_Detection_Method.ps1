Function LiquidwareDetect {
    param (
        [Parameter(Mandatory)]$AppVersion,
        [Parameter(Mandatory)]$AppName
    )

    $64BitPath = 'C:\Program Files\IT Client Utility\Client Utility\it-agent.exe'
    $regPath = 'HKLM:\SOFTWARE\WOW6432Node\ING Packages'

    If(([String](Get-Item -Path $64BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})){
        Write-Host "Installed"
    }
}
LiquidwareDetect '4.3.2.124' 'ProofpointEndpointDLP(Exp20271019)'