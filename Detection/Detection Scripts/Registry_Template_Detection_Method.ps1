Function InstallChk {

    param (
        [Parameter(Mandatory)]$AppVersion #Parameter for storing App Version
    )

    # Define the registry paths to check for the installed version of Application
    $RegPath1 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{}'
    $RegPath2 = 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{}'
    
    # Check if the DisplayVersion value in either registry path is greater than or equal to the specified AppVersion
    If([Version](Get-ItemPropertyValue -Path $RegPath1,$RegPath2 -Name DisplayVersion -ea SilentlyContinue) -ge $AppVersion) {
        Write-Host "Installed"
    }
}

#Replace "XX.XXX.XXXXX" with the version of the application that you want to check for
InstallChk -AppVersion 'XX.XXX.XXXXX'