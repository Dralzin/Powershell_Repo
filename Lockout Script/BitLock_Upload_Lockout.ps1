Function BitLockerLockout {
    $BLV = Get-BitLockerVolume -MountPoint $env:SystemDrive
    $KeyProtectorID=""
    foreach($keyProtector in $BLV.KeyProtector){
        if($keyProtector.KeyProtectorType -eq "RecoveryPassword"){
            $KeyProtectorID=$keyProtector.KeyProtectorId
            break;
        }
    }
    
    $result = BackupToAAD-BitLockerKeyProtector -MountPoint "$($env:SystemDrive)" -KeyProtectorId $KeyProtectorID
    start-process -Wait "cmd.exe" "/c manage-bde -fr c:"
    start-process -Wait "cmd.exe" "/c manage-bde -fr c:"
    start-process -Wait "cmd.exe" "/c shutdown -t 0 -r"

}
BitLockerLockout