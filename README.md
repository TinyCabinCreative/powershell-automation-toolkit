A collection of PowerShell Automation scripts and Cmd's for terminal hygiene and PS wizardry.

**1. User Management**
**New-User.ps1**
Shows:

Input validation

Secure password handling

Idempotency (won’t recreate users)

**2. Software Install / Removal**
**Install-Software.ps1**
Shows:

Silent installs

Version detection

Exit code handling

**3. System Health Monitor**
**Get-SystemHealth.ps1**
Shows:

WMI / CIM usage

Custom objects

Export to CSV/JSON

**4. Log Analysis**
**Get-SecurityEvents.ps1**
Shows:

Event ID filtering

Time window analysis

Security awareness

**5. Automated Backup**
**Invoke-Backup.ps1**
Shows:

Robocopy usage

Incremental backups

Retention logic

**6. Patch Management**
**Invoke-WindowsUpdate.ps1**
Shows:

Update discovery

Safe reboot handling

Compliance reporting

**7. Service Control**
**Manage-Service.ps1**
Shows:

Health checks

Auto-restart logic

Timeout handling

**8. Disk Cleanup**
**Invoke-DiskCleanup.ps1**
Shows:

Retention policies

Size calculation

Safety checks

**9. Permission Auditing**
**Get-PermissionAudit.ps1**
Shows:

ACL inspection

Risk detection

Least privilege awareness

**10. Scheduled Task Management**
**Manage-ScheduledTask.ps1**
Shows:

Task creation

Triggers

Secure credential use

**Refactored Code**

Shared modules are used to centralize logging and validation logic, ensuring consistent behavior, safer execution, and easier maintenance across all automation scripts.
