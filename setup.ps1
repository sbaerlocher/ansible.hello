# ============================================================
# Powershell-Script: Ansible preparation script for Windows 
# Autor: Simon Bärlocher
# ============================================================

$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:TEMP\ConfigureRemotingForAnsible.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell -noprofile -command "&{ start-process powershell -ArgumentList '-ExecutionPolicy Bypass -noprofile -Command "$file -EnableCredSSP"' -verb RunAs}"

Invoke-Elevated -ScriptBlock {
    Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
    New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force
    Set-Service -Name sshd -Startuptype 'Automatic'
    Start-Service sshd
    Restart-Service sshd }