<#
.SYNOPSIS
    Audits NTFS permissions.

.EXAMPLE
    .\Get-PermissionAudit.ps1 -Path "C:\Sensitive"
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$Path
)

if (-not (Test-Path $Path)) {
    Write-Error "Path not found."
    exit 1
}

(Get-Acl $Path).Access |
    Select-Object IdentityReference, FileSystemRights, AccessControlType
