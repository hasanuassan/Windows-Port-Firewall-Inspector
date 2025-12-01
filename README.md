# 🔍 Windows-Port-Firewall-Inspector
Check **open ports** and **Windows Firewall rules** on a Windows machine using a **single PowerShell script**.
## 🌐 Network & Firewall Info – PowerShell Script

This script helps you quickly see:
1. **Listening TCP ports (open ports)** on the local machine  
2. **Windows Firewall profile status** (Domain / Private / Public)  
3. **Inbound Windows Firewall rules that allow traffic**
✅ Useful for:
- Basic troubleshooting  
- Security checks  
- Understanding what services are exposed on a Windows machine
- 
## 🧰 Requirements
- Windows 10 / 11 or Windows Server (with PowerShell)
- Run PowerShell **as Administrator** for best results
- Windows Firewall cmdlets available:
  - `Get-NetTCPConnection`
  - `Get-NetFirewallProfile`
  - `Get-NetFirewallRule`
  - `Get-NetFirewallPortFilter`
#📜 PowerShell Script
Save this as: **`Network-Firewall-Info.ps1`**
```powershell
<# 
    Network-Firewall-Info.ps1

2.Open PowerShell as Administrator
Press Start
Type PowerShell
Right-click Windows PowerShell → Run as administrator

3.Run the script
.\Network-Firewall-Info.ps1
