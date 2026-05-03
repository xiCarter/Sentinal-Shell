# RHEL-Systems-Automation
Technical logs, environment configurations, and administrative utilities for Red Hat Enterprise Linux.

## Technical Stack
* **Host:** macOS (Virtualization Layer)
* **Guest:** Red Hat Enterprise Linux (RHEL)
* **Shell:** Bash 
* **VCS:** Git / GitHub

## Engineering Log

### [2026-05-03] Forensic Debugging & Infrastructure Sync
* **Execution Tracing:** Utilized `sudo bash -x` to perform a granular trace of script execution. This allowed for exact identification of logic breaks and permission bottlenecks by outputting every command and variable expansion in real-time.
* **Path & Binary Auditing:** Leveraged `which` to validate binary locations for `neofetch`. Resolved execution failures by mapping the absolute path and auditing the `$PATH` environment variable.
* **Remote Origin Reconfiguration:** Re-synced the local development environment with the GitHub remote following a namespace change. Updated the `origin` URL via `git remote set-url` to preserve local state.
* **Logic Note:** Direct execution tracing (`bash -x`) is the preferred method for resolving "silent" failures. It eliminates guesswork by exposing the exact point of failure within the shell's logic.
