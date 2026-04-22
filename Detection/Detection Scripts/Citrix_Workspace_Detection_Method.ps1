Function InstallChk {
    param (
        [Parameter(Mandatory)]$AppVersion
    )
    
    $RegPath1 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FFBC199D-D71B-46CA-A767-D93B8C62E043}'
    $RegPath2 = 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{FFBC199D-D71B-46CA-A767-D93B8C62E043}'
    
    If([Version](Get-ItemPropertyValue -Path $RegPath1,$RegPath2 -Name DisplayVersion -ea SilentlyContinue) -ge $AppVersion) {
        Write-Host "Installed"
    }
}
InsatllChk -AppVersion 'XX.XX.X.XX'
