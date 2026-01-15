# Validation.psm1
# Common safety and validation checks

function Assert-PathExists {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path $Path)) {
        throw "Validation failed: Path does not exist -> $Path"
    }
}

function Assert-Administrator {
    [CmdletBinding()]
    param ()

    $isAdmin = ([Security.Principal.WindowsPrincipal] `
        [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

    if (-not $isAdmin) {
        throw "Validation failed: Administrator privileges are required."
    }
}

Export-ModuleMember -Function Assert-PathExists, Assert-Administrator
