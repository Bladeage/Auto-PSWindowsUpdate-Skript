# PowerShell Script to start and download the automated install of the PowerShell Module "PSWindowsUpdate"

# Allow execution of unsigned PS code
Set-ExecutionPolicy -ExecutionPolicy 'RemoteSigned'


# [Old] Install NuGet and Install PSWindowsUpdate Module
#Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
#Install-Module -Name PSWindowsUpdate -Force
#Import-Module PSWindowsUpdate

# [Broken] Download the continous script to continue the process after reboot
#Invoke-WebRequest "https://raw.githubusercontent.com/Bladeage/Auto-PSWindowsUpdate-Skript/main/Start.ps1" -OutFile "$env:LOCALAPPDATA\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

# Prüfen, ob das Modul PSWindowsUpdate installiert ist
if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Write-Output "Das Modul PSWindowsUpdate ist nicht installiert. Installation wird gestartet..."

    # NuGet Provider installieren, falls notwendig
    if (-not (Get-PackageProvider -ListAvailable -Name NuGet)) {
        Write-Output "NuGet Provider wird installiert..."
        Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
    }

    # Modul PSWindowsUpdate installieren
    Write-Output "PSWindowsUpdate Modul wird installiert..."
    Install-Module -Name PSWindowsUpdate -Force

    # Modul importieren
    Write-Output "PSWindowsUpdate Modul wird importiert..."
    Import-Module PSWindowsUpdate
} else {
    Write-Output "Das Modul PSWindowsUpdate ist bereits installiert."
}

# Prüfen, ob das Modul erfolgreich importiert wurde
if (Get-Module -Name PSWindowsUpdate) {
    Write-Output "Das Modul PSWindowsUpdate wurde erfolgreich importiert."
} else {
    Write-Output "Fehler beim Importieren des Moduls PSWindowsUpdate."
}


# Start the Windows Update process via the PowerShell module
Get-WindowsUpdate -Install -AcceptAll -AutoReboot