function InstallChk {
    param (
        [Parameter(Mandatory)]$AppVersion #Parameter for storing App Version
    )

    # Define the path to check for the GitHub Desktop executable
    $64BitPath = 'C:\Program Files (x86)\GitHubDesktop\GitHubDesktop.exe'

    # Check if the executable exists in the path and compare its version to the specified AppVersion
    If(([String](Get-Item -Path $64BitPath -ErrorAction SilentlyContinue).VersionInfo.FileVersion -ge $AppVersion) -and (Get-ChildItem -Path $regPath | Get-ItemProperty | Where-Object { $_.ApplicationName -eq $AppName})){
        Write-Host "Installed"
    }
}
#Replace "X.X.X" with the version of GitHub Desktop you want to check for
 InstallChk -AppVersion 'X.X.X'