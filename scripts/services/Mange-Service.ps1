<#
.SYNOPSIS
    Starts or restarts a Windows service.

.EXAMPLE
    .\Manage-Service.ps1 -ServiceName "Spooler"
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$ServiceName
)

$service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

if (-not $service) {
    Write-Error "Service not found."
    exit 1
}

if ($service.Status -ne 'Running') {
    Start-Service $ServiceName
    Write-Host "Service started."
} else {
    Restart-Service $ServiceName
    Write-Host "Service restarted."
}
Write-Host "Service '$ServiceName' is now running."