# Lab Session Log — osTicket Ticket Workflow
**Date:** 2026-06-17
**Track:** X (AD Day 15)

---

## Objective
Complete first end-to-end ticket workflow in osTicket —
user submits ticket, agent resolves in AD, closes ticket.

---

## Steps Completed
1. Opened SSH tunnel to access osTicket via browser
2. Configured ticket settings — verified portal access
   enabled, help topics active, SLA plans in place
3. Attempted ticket creation via portal as Jane Doe —
   access denied
4. Attempted ticket creation as xflowers_admin — 
   contact admin error
5. Attempted ticket creation as jsmith — access denied
6. Adjusted jsmith role to Supreme Admin — still blocked

---

## What Broke / Went Wrong
- Portal ticket submission returning access denied
  despite registration not being required
- Agent ticket creation blocked for both admin
  and agent accounts — permissions misconfigured
  during initial setup
- Root cause not yet identified — troubleshoot
  role and department assignments tomorrow

---

## What I Learned
- osTicket separates portal access (end users)
  from agent panel access (staff)
- Role assignments in osTicket control what
  agents can and cannot do — misconfigured roles
  block ticket creation entirely
- In real environments most tickets are created
  by agents on behalf of users who call in —
  not always through a self-service portal

---

## Next Session
AD Day 16 — fix osTicket permissions, complete
end-to-end ticket workflow. Jane Doe password reset
ticket from creation to resolution.
