# Lab Session Log — osTicket Configuration
**Date:** 2026-06-15
**Track:** X (AD Day 14)

---

## Objective
Configure osTicket for end-to-end ticket workflow —
departments, SLA plans, help topics, agents, users.

---

## Steps Completed
1. Created 3 departments: IT Support, HR, Finance
2. Created 3 SLA plans:
   - Sev-A: 1 hour, 24/7
   - Sev-B: 4 hours, 24/7
   - Sev-C: 8 hours, Business Hours
3. Created 5 help topics under IT Support:
   Password Reset, Account Unlock, New User Setup,
   Software Issue, Network Problem
4. Created agent jsmith — IT Support department
5. Created end user Jane Doe — jdoe@forgelocal.org
   (forge.local not accepted — using forgelocal.org)

---

## What I Learned
- osTicket separates agents (staff who resolve tickets)
  from users (people who submit tickets)
- SLA plans define response time expectations —
  Sev-A is critical, Sev-C is low priority
- Help topics route tickets to the correct department
  automatically
- Departments mirror the AD OU structure —
  IT, HR, Finance

---

## Next Session
AD Day 15 — first end-to-end ticket workflow.
Jane Doe submits password reset → jsmith picks it up
→ resolves in AD → closes ticket in osTicket.
