TICKET #001
Date: 2026-06-08
Caller: John Smith (jsmith)

Issue: User unable to log into workstation WS01
	Account locked after multiple failed password attempts
Priority: High - user cannot work

Steps Taken:
	1. Verified account lockout in Active Directory Users and Computers - account showed locked
	2. Reset password to temporary: Password1!
	3. Unlocked Account
	4. Advised user to log in and change password immediately


Event Log Evidence:
Event ID 4740 — User Account Locked Out
Account: FORGE\jsmith
Source Machine: WS01
Timestamp: 6/8/2026 9:46:33 AM
Logged on: DC01.forge.local


Resolution: Account unlocked, temporary password issued
Status: Resolved
Time to Resolve: 4 minutes
