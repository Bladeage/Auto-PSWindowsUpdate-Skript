# PowerShell Script to start and download the automated install of the PowerShell Module "PSWindowsUpdate"

# Start the Windows Update process via the PowerShell module
Get-WindowsUpdate -Install -AcceptAll -AutoReboot

# Script to delete this Script
Remove-Item -Path "$env:LOCALAPPDATA\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Script.ps1" -Force
