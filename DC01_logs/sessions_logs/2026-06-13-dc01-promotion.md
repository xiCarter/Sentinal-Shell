AD Day 11 — Shared Folder + NTFS Permissions

Steps:
1. Created C:\IT_Share on DC01
2. Shared via Advanced Sharing — IT_Admins Full Control
3. NTFS Security tab — IT_Admins Full Control only
4. Tested rjohnson (IT_Admins) — accessed \\DC01\IT_Share 
   successfully
5. Tested jdoe (HR_Users) — "You do not have permission"

Key Concepts:
- Share permissions = network gate (Sharing tab)
- NTFS permissions = disk gate (Security tab)
- Windows evaluates both per user — most restrictive wins
- IT_Admins clears both gates — access granted
- HR_Users fails NTFS gate — access denied
- Users don't browse shares — IT maps drives via GPO
- Sharing a drive ≠ sharing folders inside it
