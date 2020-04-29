# ============================================================
# Powershell-Script: Ansible preparation script for Windows 
# Autor: Simon Bärlocher
# ============================================================

$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:TEMP\ConfigureRemotingForAnsible.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell -noprofile -command "&{ start-process powershell -ArgumentList '-ExecutionPolicy Bypass -noprofile -Command "$file -EnableCredSSP"' -verb RunAs}"
