# Lab Session Log — osTicket Installation on RHEL
**Date:** 2026-06-14
**Track:** X (AD Day 13)

---

## Objective
Deploy osTicket ticketing system on RHEL VM using
a LAMP stack — Linux, Apache, MariaDB, PHP.

---

## Steps Completed
1. Installed LAMP stack — httpd, mariadb-server, PHP 8.2
   and required PHP extensions via dnf
2. Started and enabled httpd and mariadb services
3. Secured MariaDB with mysql_secure_installation
4. Created osticket database and user in MariaDB
5. Downloaded osTicket v1.17.5, extracted to
   /var/www/html/osticket/
6. Set Apache ownership and file permissions
7. Configured Apache VirtualHost for osTicket
8. Opened firewall port 80 via firewall-cmd
9. Fixed SELinux blocking Apache write access
   with setsebool and restorecon
10. Upgraded PHP from 8.0 to 8.2 via dnf module
    switch-to
11. Used SSH tunnel from Mac to access VM web
    interface — ssh -L 8080:localhost:80
12. Installed elinks text browser to bypass tunnel
    timeout issues during installation
13. Completed osTicket web installer via elinks
14. Locked ost-config.php and removed setup directory
15. Confirmed access to Staff Control Panel at
    http://localhost/scp

---

## What Broke / Went Wrong
- php-imap not available in RHEL 9 repos — removed
  from install command, not required for core function
- PHP 8.0 incompatible with osTicket v1.18.1 —
  upgraded to PHP 8.2 via dnf module switch-to
- SSH tunnel dropping during long install POST request
  — bypassed using elinks text browser on VM directly
- SELinux blocking Apache from writing ost-config.php
  even with correct file permissions —
  fixed with setsebool -P httpd_unified 1
  and restorecon -Rv
- osticket database user password mismatch causing
  install failure — reset via ALTER USER in MariaDB
- osTicket installer rejecting admin username —
  resolved by using xflowers_admin instead of
  matching email prefix

---

## What I Learned
- LAMP stack: Linux + Apache + MariaDB + PHP —
  the foundation most web applications run on
- Apache serves web pages, MariaDB stores data,
  PHP runs the application logic
- SELinux operates independently of file permissions —
  a file can be chmod 666 and still be blocked
  by SELinux security context
- SSH tunneling: forwarding local port through SSH
  to access remote services securely without
  opening firewall ports
- SQL commands require semicolons — missing one
  causes MariaDB to wait for continuation
- Database users have their own passwords separate
  from system users — access denied means wrong
  credentials not wrong permissions

---

## Next Session
AD Day 14 — Configure osTicket:
- Create departments (IT, HR, Finance)
- Set SLA plans (Sev-A 1hr, Sev-B 4hr, Sev-C 8hr)
- Configure help topics (Password Reset, Account
  Unlock, New User, Software, Network)
