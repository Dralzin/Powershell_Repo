$AppKeyRoot = 'HKLM:\SOFTWARE\Classes\Installer\Products\*'
$AppKey = Get-ChildItem -Path $AppKeyRoot -ErrorAction SilentlyContinue | Get-ItemProperty | Select-Object * | Where-Object {$_.ProductName -like '*TortoiseGit*'}
If($AppKey) {
    Write-Host "Update"
} Else {
    Write-Host "Not Installed"
}