## Technical Stack
* **Host:** macOS (Virtualization Layer)
* **Guest:** Red Hat Enterprise Linux (RHEL)
* **Shell:** Bash 
* **VCS:** Git / GitHub

## Log

[2026-05-03]
   * Learned to trace syntax errors and output (`bash -x`). Has become my preferred method for resolving "silent" failures. It eliminates guesswork.
   * Resolved execution failures by mapping the absolute path (`bash -x`) and auditing the `$PATH` environment variable. Leveraged `which` instead of `if` when scripting the download           verfication for `$1`.
   * Re-synced the local development environment with the GitHub remote following a namespace change. Updated the `origin` URL via `git remote set-url` to preserve local state.

[2026-05-05]
    * Practiced moving data between machines via sftp. Migrated bash backups from the RHEL VM to MacOS.
    * Diagnosed shell compatibility issues after my Linux configuration caused parse errors on macOS. Learned that Zsh does not support specific Bash features such as shopt. Learning           environmental boundaries & translation between their languages.
    * Improved efficiency by integrating sudo into an alias (`setup`) inside of setup_env.sh in order to reduce directory hopping and key strokes while working.
