# Lab Session Log — Department Structure & User Management
---

## Objective
Build department OU structure, create 4 domain users,
create department security groups, assign all users

---

## Steps Completed
1. Created department sub-OUs inside _Forge/Users:
   HR, Finance, IT
2. Created 4 domain users in correct OUs:
   - jdoe (John Doe) → HR
   - mwilliams (Mary Williams) → Finance
   - rjohnson (Rachel Johnson) → IT
   - tsmith (Tom Smith) → HR
3. Moved existing user jsmith from Users root → IT OU
4. Created 3 security groups in _Forge/Groups:
   - HR_Users, Finance_Users, IT_Admins
5. Assigned all 5 users to correct groups:
   - IT_Admins: jsmith, rjohnson
   - HR_Users: jdoe, tsmith
   - Finance_Users: mwilliams
6. Deleted redundant "IT_Users" group (replaced by IT_admins)

---

## What Broke / Went Wrong
- Created OUs inside Groups OU instead of Security Groups —
  OUs have no Members tab, cannot hold group memberships
  (fix: enabled Advanced Features under View, unchecked
  accidental deletion protection, deleted OUs, recreated
  as proper Security Groups)
- Access denied when deleting OUs —
  (cause: accidental deletion protection enabled by default
  fix: View → Advanced Features → Properties → Object tab
  → uncheck Protect object from accidental deletion)
- Deleting IT_Users removed all group memberships —
  users still exist in OUs, memberships simply reassigned
  to new groups

---

## What I Learned
- OUs are containers for organization and Group Policy
  Security Groups control permissions and resource access
  — different jobs, often confused
- Accidental deletion protection exists because deleting
  an OU removes everything inside it — users, computers,
  groups, policies — not easily reversible in production
- Deleting a group never deletes the users inside it —
  users live in OUs, group membership is just an assignment
- Least privilege — users only get access what their
  department needs, enforced through group membership

---

## Next Session
account lockout simulation
jsmith enters wrong password on WS01 until locked
Unlock from DC01, reset password, log as real ticket
