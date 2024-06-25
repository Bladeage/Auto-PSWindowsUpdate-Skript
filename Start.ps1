# PowerShell Script to start and download the automated install of the PowerShell Module "PSWindowsUpdate"

# Install NuGet and Install PSWindowsUpdate Module
Set-ExecutionPolicy -ExecutionPolicy 'RemoteSigned'
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name PSWindowsUpdate -Force
Import-Module PSWindowsUpdate

# Download the continous script to continue the process after reboot
Invoke-WebRequest "https://raw.githubusercontent.com/Bladeage/Auto-PSWindowsUpdate-Skript/main/Start.ps1" -OutFile "$env:LOCALAPPDATA\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

# Start the Windows Update process via the PowerShell module
Get-WindowsUpdate -Install -AcceptAll -AutoReboot