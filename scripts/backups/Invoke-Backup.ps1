<#
.SYNOPSIS
    Performs a file backup using Robocopy.

.DESCRIPTION
    Copies files incrementally and preserves permissions.

.EXAMPLE
    .\Invoke-Backup.ps1 -Source "C:\Data" -Destination "D:\Backup"
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$Source,

    [Parameter(Mandatory)]
    [string]$Destination
)

if (-not (Test-Path $Source)) {
    Write-Error "Source path does not exist."
    exit 1
}

robocopy $Source $Destination /MIR /R:2 /W:5 /LOG+:backup.log
