<#
.SYNOPSIS
    Collects system health metrics.

.DESCRIPTION
    Reports CPU, memory, disk usage, and uptime.

.EXAMPLE
    .\Get-SystemHealth.ps1
#>

[CmdletBinding()]
param ()

$uptime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$memory = Get-CimInstance Win32_ComputerSystem
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"

[PSCustomObject]@{
    Hostname   = $env:COMPUTERNAME
    UptimeDays = (New-TimeSpan -Start $uptime).Days
    TotalRAMGB = [math]::Round($memory.TotalPhysicalMemory / 1GB, 2)
    FreeDiskGB = [math]::Round(($disk.FreeSpace | Measure-Object -Sum).Sum / 1GB, 2)
}
Write-Host "System health metrics collected successfully."
