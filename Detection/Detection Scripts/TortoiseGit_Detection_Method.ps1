$AppKeyPath = 'HKLM:\SOFTWARE\Classes\Installer\Products\'
$AppKey = '53D2ED4B4833AB5449C70609D5B46499'
$AppKeyFull = "$($AppKeyPath)$($AppKey)"
If(Test-Path -Path $AppKeyFull) {
    Write-Host "Installed"
}