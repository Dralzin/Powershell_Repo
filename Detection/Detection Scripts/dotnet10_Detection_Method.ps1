Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Test-DotNet10Installed {
    # First try dotnet CLI output.
    try {
        $dotnetCmd = Get-Command dotnet -ErrorAction SilentlyContinue
        if ($null -ne $dotnetCmd) {
            $runtimes = & dotnet --list-runtimes 2>$null
            if ($runtimes -match '^Microsoft\.NETCore\.App\s+10\.0(\.|\s)') {
                return $true
            }
        }
    }
    catch {
        # Continue to folder checks if CLI lookup fails.
    }

    # Fallback for SYSTEM context: detect runtime folders directly.
    $runtimePaths = @(
        'C:\Program Files\dotnet\shared\Microsoft.NETCore.App\10.0*',
        'C:\Program Files (x86)\dotnet\shared\Microsoft.NETCore.App\10.0*'
    )

    foreach ($path in $runtimePaths) {
        if (Get-ChildItem -Path $path -Directory -ErrorAction SilentlyContinue) {
            return $true
        }
    }

    return $false
}

if (Test-DotNet10Installed) {
    Write-Host 'Installed'
    exit 0
}

exit 1