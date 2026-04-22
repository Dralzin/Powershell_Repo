Function AppCheck {
    $bRes = if((gi "$($env:ProgramFiles)\Remote Desktop\msrdcw.exe" -ea SilentlyContinue).VersionInfo.FileVersionRaw -lt "1.2.5559.0") { $true } else { $false }
    if ($bRes -eq $true) {
        Write-Host "Update"
    } else {
        Write-Host "Up-to-date"
    }
}
AppCheck