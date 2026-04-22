Function InstallChk {
    param (
        [Parameter(Mandatory)]$AppVersion #Parameter for storing App Version
    )
    
    # Define the registry paths to check for the installed version of Citrix Workspace
    $RegPath1 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FFBC199D-D71B-46CA-A767-D93B8C62E043}'
    $RegPath2 = 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{FFBC199D-D71B-46CA-A767-D93B8C62E043}'
    
    # Check if the DisplayVersion value in either registry path is greater than or equal to the specified AppVersion
    If([Version](Get-ItemPropertyValue -Path $RegPath1,$RegPath2 -Name DisplayVersion -ea SilentlyContinue) -ge $AppVersion) {
        Write-Host "Installed"
    }
}

#Replace "XX.XX.X.XX" with the version of Citrix Workspace you want to check for
InsatllChk -AppVersion 'XX.XX.X.XX'
