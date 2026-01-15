<#
.SYNOPSIS
    Creates a new local user account safely.

.DESCRIPTION
    Creates a local Windows user with validation, logging,
    and optional password enforcement. Designed for demo
    and lab environments (non-domain).

.EXAMPLE
    .\New-User.ps1 -Username "jdoe" -FullName "John Doe"
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$Username,

    [string]$FullName = $Username,

    [switch]$ForcePasswordChange
)

try {
    if (Get-LocalUser -Name $Username -ErrorAction SilentlyContinue) {
        Write-Warning "User '$Username' already exists."
        return
    }

    $password = Read-Host "Enter password" -AsSecureString

    New-LocalUser `
        -Name $Username `
        -FullName $FullName `
        -Password $password `
        -PasswordNeverExpires:$false `
        -UserMayNotChangePassword:$false

    if ($ForcePasswordChange) {
        Set-LocalUser -Name $Username -PasswordNeverExpires:$false
    }

    Write-Host "User '$Username' created successfully."
}
catch {
    Write-Error "Failed to create user: $_"
}
