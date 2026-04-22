param(
    [Parameter(Mandatory = $true)]
    [string]$AppName,

    [Parameter(Mandatory = $true)]
    [string]$MinimumVersion,

    [string]$RegistryNamePattern,
    [string]$ExecutablePath64,
    [string]$ExecutablePath32
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Convert-ToVersion {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Value
    )

    $raw = $Value.Trim()
    if ([string]::IsNullOrWhiteSpace($raw)) {
        return $null
    }

    $clean = ($raw -split '[^0-9\.]')[0]
    if ([string]::IsNullOrWhiteSpace($clean)) {
        return $null
    }

    try {
        return [version]$clean
    }
    catch {
        return $null
    }
}

function Get-InstalledRegistryVersion {
    param(
        [Parameter(Mandatory = $true)]
        [string]$NamePattern
    )

    $paths = @(
        'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
    )

    $candidates = foreach ($path in $paths) {
        Get-ItemProperty -Path $path -ErrorAction SilentlyContinue |
            Where-Object { $_.DisplayName -and $_.DisplayName -like "*$NamePattern*" } |
            Select-Object DisplayName, DisplayVersion
    }

    $versions = foreach ($item in $candidates) {
        $ver = Convert-ToVersion -Value ([string]$item.DisplayVersion)
        if ($null -ne $ver) {
            [PSCustomObject]@{
                Source      = "Registry: $($item.DisplayName)"
                FoundString = [string]$item.DisplayVersion
                Found       = $ver
            }
        }
    }

    return $versions | Sort-Object Found -Descending | Select-Object -First 1
}

function Get-InstalledExeVersion {
    param(
        [string[]]$Paths
    )

    foreach ($path in $Paths) {
        if ([string]::IsNullOrWhiteSpace($path)) {
            continue
        }

        if (Test-Path -Path $path) {
            $fileVersion = (Get-Item -Path $path).VersionInfo.FileVersion
            $ver = Convert-ToVersion -Value ([string]$fileVersion)
            if ($null -ne $ver) {
                return [PSCustomObject]@{
                    Source      = "File: $path"
                    FoundString = [string]$fileVersion
                    Found       = $ver
                }
            }
        }
    }

    return $null
}

try {
    $required = Convert-ToVersion -Value $MinimumVersion
    if ($null -eq $required) {
        Write-Host "MinimumVersion '$MinimumVersion' is not a valid version."
        exit 1
    }

    if ([string]::IsNullOrWhiteSpace($RegistryNamePattern)) {
        $RegistryNamePattern = $AppName
    }

    $detected = Get-InstalledRegistryVersion -NamePattern $RegistryNamePattern

    if ($null -eq $detected) {
        $detected = Get-InstalledExeVersion -Paths @($ExecutablePath64, $ExecutablePath32)
    }

    if ($null -eq $detected) {
        Write-Host "Not detected: $AppName"
        exit 1
    }

    if ($detected.Found -ge $required) {
        Write-Host "Installed: $AppName | Found $($detected.FoundString) | Required $MinimumVersion | $($detected.Source)"
        exit 0
    }

    Write-Host "Version too low: $AppName | Found $($detected.FoundString) | Required $MinimumVersion | $($detected.Source)"
    exit 1
}
catch {
    Write-Host "Detection failed: $($_.Exception.Message)"
    exit 1
}
