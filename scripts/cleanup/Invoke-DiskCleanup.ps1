<#
.SYNOPSIS
    Cleans temporary files.

.DESCRIPTION
    Deletes files older than X days from temp directories.

.EXAMPLE
    .\Invoke-DiskCleanup.ps1 -Days 30
#>

[CmdletBinding()]
param (
    [int]$Days = 30
)

$paths = @("$env:TEMP", "C:\Windows\Temp")

foreach ($path in $paths) {
    Get-ChildItem $path -Recurse -ErrorAction SilentlyContinue |
        Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$Days) } |
        Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
}

Write-Host "Disk cleanup completed."
