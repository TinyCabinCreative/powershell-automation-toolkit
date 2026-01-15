<#
.SYNOPSIS
    Installs software silently from an installer.

.DESCRIPTION
    Supports MSI or EXE installers with exit code validation.

.EXAMPLE
    .\Install-Software.ps1 -InstallerPath ".\app.msi"
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$InstallerPath
)

if (-not (Test-Path $InstallerPath)) {
    Write-Error "Installer not found."
    exit 1
}

try {
    $process = Start-Process `
        -FilePath $InstallerPath `
        -ArgumentList "/quiet /norestart" `
        -Wait `
        -PassThru

    if ($process.ExitCode -eq 0) {
        Write-Host "Installation completed successfully."
    } else {
        Write-Warning "Installer exited with code $($process.ExitCode)"
    }
}
catch {
    Write-Error "Installation failed: $_"
}
