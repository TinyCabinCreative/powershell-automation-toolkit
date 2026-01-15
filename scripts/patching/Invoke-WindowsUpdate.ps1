<#
.SYNOPSIS
    Checks for available Windows Updates.

.DESCRIPTION
    Uses Windows Update API (read-only).

.EXAMPLE
    .\Invoke-WindowsUpdate.ps1
#>

[CmdletBinding()]
param ()

$session = New-Object -ComObject Microsoft.Update.Session
$searcher = $session.CreateUpdateSearcher()
$result = $searcher.Search("IsInstalled=0")

$result.Updates | Select-Object Title, IsDownloaded
