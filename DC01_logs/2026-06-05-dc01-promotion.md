# Lab Session Log — DC01 Domain Controller Promotion
**Phase:** X1 — Build DC01  

---

## Objective
Rename server to DC01, set static IP, install AD DS role, 
promote to domain controller on forge.local

---

## Steps Completed
1. Renamed server from default name to DC01 — rebooted
2. Set static IP 192.168.56.10, subnet 255.255.255.0, 
   gateway 192.168.56.1, DNS 127.0.0.1
3. Installed AD DS role via Add Roles and Features
4. Promoted DC01 to domain controller — forest: forge.local
5. Verified: Roles showing AD DS, DNS — both green
6. Created OU structure: _Forge > Users, Computers, Groups, Admins
7. Created first domain user: John Smith (jsmith)
8. Reset jsmith password — confirmed success dialog
9. Disabled jsmith account — icon shows disabled state
10. Re-enabled jsmith account

---

## What Broke / Went Wrong
- Nothing critical. Dashboard showed Roles: 0 briefly 
  after reboot — resolved after Server Manager refreshed

---

## What I Learned
- DNS points to 127.0.0.1 because DC01 runs its own 
  DNS server — pointing elsewhere breaks the domain
- Static IP is required — dynamic IP would break 
  domain resolution on every reboot
- forge.local is now the authentication authority 
  for the entire domain

---

## Next Session
Open Active Directory Users and Computers — 
create first OU structure and test user account
