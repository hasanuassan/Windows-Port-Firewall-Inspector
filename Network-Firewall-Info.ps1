<# 
    Network-Firewall-Info.ps1
    Shows:
      1) Listening TCP ports and owning processes
      2) Windows Firewall profile status
      3) Inbound firewall rules that allow traffic
#>

Write-Host "========================================="
Write-Host "   NETWORK & FIREWALL INFORMATION"
Write-Host "=========================================`n"

# -------------------------------
# 1) LISTENING PORTS (OPEN PORTS)
# -------------------------------
Write-Host "=== LISTENING TCP PORTS ===`n"

try {
    Get-NetTCPConnection -State Listen |
        Select-Object LocalAddress, LocalPort, OwningProcess,
            @{Name='ProcessName';Expression={ (Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue).ProcessName }} |
        Sort-Object LocalPort |
        Format-Table -AutoSize
}
catch {
    Write-Warning "Get-NetTCPConnection not available. Falling back to netstat..."
    netstat -ano | Select-String "LISTENING"
}

Write-Host "`n`n"

# -------------------------------
# 2) FIREWALL PROFILE STATUS
# -------------------------------
Write-Host "=== WINDOWS FIREWALL PROFILES ===`n"

Get-NetFirewallProfile |
    Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction |
    Format-Table -AutoSize

Write-Host "`n`n"

# -------------------------------
# 3) INBOUND FIREWALL ALLOW RULES
# -------------------------------
Write-Host "=== INBOUND FIREWALL RULES (ALLOW) ===`n"

Get-NetFirewallRule -Direction Inbound -Action Allow |
    Select-Object DisplayName, Enabled, Profile,
        @{Name='Port';Expression={
            (Get-NetFirewallPortFilter -AssociatedNetFirewallRule $_ -ErrorAction SilentlyContinue).LocalPort
        }} |
    Format-Table -AutoSize
