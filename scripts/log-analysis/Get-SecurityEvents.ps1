<#
.SYNOPSIS
    Retrieves recent Windows Security events.

.DESCRIPTION
    Filters security log entries by Event ID and time window.

.EXAMPLE
    .\Get-SecurityEvents.ps1 -Hours 24
#>

[CmdletBinding()]
param (
    [int]$Hours = 24
)

$startTime = (Get-Date).AddHours(-$Hours)

Get-WinEvent -FilterHashtable @{
    LogName   = 'Security'
    StartTime = $startTime
} | Select-Object TimeCreated, Id, LevelDisplayName, Message
Write-Host "Security events retrieved successfully."