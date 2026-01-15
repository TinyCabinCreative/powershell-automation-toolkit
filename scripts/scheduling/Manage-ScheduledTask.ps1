<#
.SYNOPSIS
    Creates a scheduled task.

.EXAMPLE
    .\Manage-ScheduledTask.ps1 -TaskName "DailyHealthCheck" -ScriptPath "C:\Scripts\Get-SystemHealth.ps1"
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$TaskName,

    [Parameter(Mandatory)]
    [string]$ScriptPath
)

$action = New-ScheduledTaskAction `
    -Execute "powershell.exe" `
    -Argument "-NoProfile -File `"$ScriptPath`""

$trigger = New-ScheduledTaskTrigger -Daily -At 3am

Register-ScheduledTask `
    -TaskName $TaskName `
    -Action $action `
    -Trigger $trigger `
    -Force
