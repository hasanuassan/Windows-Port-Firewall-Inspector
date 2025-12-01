# Windows-Port-Firewall-Inspector
Check open ports and Windows Firewall rules on a Windows machine using a single PowerShell script.

# Network & Firewall Info – PowerShell Script
Simple PowerShell script to quickly check:
1. **Listening TCP ports (open ports)** on the local machine  
2. **Windows Firewall profile status** (Domain / Private / Public)  
3. **Inbound Windows Firewall rules that allow traffic**

This is useful for:
- Basic troubleshooting
- Security checks
- Understanding what services are exposed on a Windows machine
  
# Requirements
- Windows 10 / 11 or Windows Server (with PowerShell)
- Run PowerShell *as Administrator* for best results
- Windows Firewall cmdlets available (`Get-NetTCPConnection`, `Get-NetFirewallRule`, etc.)

# Files
- Network-Firewall-Info.ps1` – Main script

# How to Use
1. *Clone or download this repository*
   powershell
   git clone https://github.com/<your-username>/<your-repo-name>.git
   cd <your-repo-name>
2.Open PowerShell as Administrator
Press Start
Type PowerShell
Right-click Windows PowerShell → Run as administrator
3.Run the script
.\Network-Firewall-Info.ps1
