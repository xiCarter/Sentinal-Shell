## Technical Stack
* **Host:** macOS (Virtualization Layer)
* **Guest:** Red Hat Enterprise Linux (RHEL)
* **Shell:** Bash 
* **VCS:** Git / GitHub

## Log

[2026-05-03]
   * Learned to trace syntax errors and output (`bash -x`). Has become my preferred method for resolving "silent" failures. It eliminates guesswork.
   * Resolved execution failures by mapping the absolute path (`bash -x`) and auditing the `$PATH` environment variable. Leveraged `which` instead of `if` when scripting the download verfication for `$1`. 
   * Re-synced the local development environment with the GitHub remote following a namespace change. Updated the `origin` URL via `git remote set-url` to preserve local state.
