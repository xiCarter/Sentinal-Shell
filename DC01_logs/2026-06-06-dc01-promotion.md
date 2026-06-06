# Lab Session Log — WS01 Domain Join
---

## Objective
Join Windows 11 VM (WS01) to forge.local domain

---

## Steps Completed
1. Created security group IT_Users in _Forge/Groups
2. Added jsmith to IT_Users
3. Set static IP 192.168.56.20 on WS01
4. Disabled IPv6 DNS via ncpa.cpl
5. Renamed WS01 (was DC01 — hostname conflict)
6. Joined WS01 to forge.local as FORGE\Administrator
7. Confirmed domain auth: whoami = forge\administrator
8. Confirmed DC01 authenticated login: logonserver = \\DC01

---

## What Broke / Went Wrong
- WS01 had no IPv4 — APIPA address 169.254.194.85
  (cause: IP conflict, both machines set to 192.168.56.10)
- nslookup hitting IPv6 DNS first, not DC01
  (fix: disabled IPv6 via ncpa.cpl, forced IPv4 DNS only)
- Domain join failing with "cannot join" error
  (cause: WS01 hostname was DC01 — conflict with existing
  domain controller registration)
- %logonserver% failed in PowerShell
  (fix: used $env:LOGONSERVER — PowerShell uses different
  variable syntax than CMD)

---

## What I Learned
- APIPA 169.254.x.x means Windows couldn't claim its IP —
  usually an IP conflict or no DHCP
- Windows queries DNS servers in order listed — IPv6 DNS
  was listed first and had no record of forge.local
- Two machines cannot share a hostname on a domain —
  DC01 was already registered so WS01 was rejected
- CMD and PowerShell use different variable syntax:
  CMD uses %variable%, PowerShell uses $env:VARIABLE
- Subnetting: 255.255.255.0 means first 3 octets must
  match — all 192.168.56.x devices are on same LAN
- The gateway belongs to the virtual switch UTM creates —
  acts as both switch (internal) and router (external)

---
## Next Session
Log in as jsmith on WS01 — prove standard user
domain authentication works across machines
