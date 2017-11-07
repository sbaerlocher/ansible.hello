# ============================================================
# Powershell-Script zur Vorbereitung
# Autor: Simon Bärlocher
# ============================================================

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
	Exit
}

. ./modules/ConfigureRemotingForAnsible.ps1