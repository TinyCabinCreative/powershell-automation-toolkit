# Logging.psm1
# Centralized logging utilities

$Script:DefaultLogPath = Join-Path $PSScriptRoot "..\logs"

function Write-Log {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateSet("INFO", "WARN", "ERROR")]
        [string]$Level,

        [Parameter(Mandatory)]
        [string]$Message,

        [string]$LogFile = "automation.log"
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $entry = "[$timestamp] [$Level] $Message"

    # Ensure log directory exists
    if (-not (Test-Path $Script:DefaultLogPath)) {
        New-Item -ItemType Directory -Path $Script:DefaultLogPath -Force | Out-Null
    }

    $logPath = Join-Path $Script:DefaultLogPath $LogFile

    # Write to log file
    Add-Content -Path $logPath -Value $entry

    # Write to console with appropriate stream
    switch ($Level) {
        "INFO"  { Write-Host $entry }
        "WARN"  { Write-Warning $Message }
        "ERROR" { Write-Error $Message }
    }
}

Export-ModuleMember -Function Write-Log
