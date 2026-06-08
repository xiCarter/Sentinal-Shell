TICKET #002
Date: 2026-06-09

Caller: HR Department
Issue: Employee termination — Mary Williams (mwilliams)
       Immediate access revocation required
Priority: High — security risk if access remains active

Steps Taken:
1. Removed mwilliams from Finance_Users security group
2. Disabled mwilliams account in Active Directory
   Users and Computers
3. Remotely ended active WS01 session
4. Verified login attempt — confirmed "Your account
   has been disabled. Please see your system
   administrator" message on WS01
5. Moved mwilliams account to Disabled OU for
   30-day retention before permanent deletion

Resolution: All domain access revoked. Account disabled
            and quarantined in Disabled OU. No active
            sessions remaining.

Authorized by: HR Department
Retention period: 30 days before deletion review
Status: Resolved
Time to resolve: 8 minutes
