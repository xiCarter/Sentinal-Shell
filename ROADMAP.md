# 🛤 The Roadmap

Learning Linux from scratch using the Book "The Linux Command Line" by William Shotts as a guideline. This roadmap was designed to put that knowledge to practical use.

## 🛠 Month 1: Foundations
**Objective:** Master the filesystem hierarchy and network layer to achieve total system transparency.

| Day | Goal | Purpose/Intention | Expectancy |
| :--- | :--- | :--- | :--- |
| **11** | **Forensic find** | Identify security risks. | Pinpoint exact vulnerabilities (777 permissions) in `/etc`. |
| **12** | **Search Logic** | Scale discovery. | Script returns a live list of every file modified in the last hour. |
| **13** | **Adversity Lab** | Handle edge cases. | Master escapes/quotes by deleting files with illegal characters. |
| **14** | **Stress Test** | Network Integrity. | Zero-guesswork map of the local gateway and active subnet IPs. |
| **15** | **Modernity: systemd** | Mastery of Services. | Differentiate between a running PID and a persistent Unit. |
| **16** | **Journal Audit** | Centralized logging. | Extract exact error strings from the last boot cycle via `journalctl`. |
| **17** | **The Service Lab** | Persistence. | Transition from running "scripts" to managing "System Units." |
| **18** | **find -exec** | Actionable search. | Mass manipulation: Find and move files in a single command string. |
| **19** | **Logic Gate II** | Failure Handling. | Build the first "Self-Healing" logic (Service auto-restart). |
| **20** | **Adversity Lab** | The Simulated Crash. | Diagnose a system failure using only standard system logs. |
| **21** | **Stress Test** | The Sweep. | Absolute fluency in search and redirection without using Google. |
| **22** | **tar Mastery** | Data integrity. | Bundle `/etc` while preserving original ownership and permissions. |
| **23** | **The Big Three** | Performance tuning. | Benchmarking `gzip`, `bzip2`, and `xz` for storage efficiency. |
| **24** | **Regex Anchors** | Precision filtering. | Zero false positives when searching config files for service names. |
| **25** | **Pattern Matching** | Forensic Extraction. | Extract every unique IPv4 address from `/var/log/messages`. |
| **26** | **The Archivist** | Automation. | A production-ready tool that bundles/timestamps daily changes. |
| **27** | **Adversity Lab** | The Corrupt Archive. | Troubleshoot and recover data from partially corrupted extracts. |
| **28** | **Stress Test** | The Data Pipeline. | Parse a log, isolate error IPs, and blacklist them in a single pipe. |

---

## 🔍 Month 2: Patterns & Data Surgery
**Objective:** Transform raw system noise into actionable security intelligence.

| Day | Goal | Purpose/Intention | Expectancy |
| :--- | :--- | :--- | :--- |
| **29** | **Precision tar** | Selective recovery. | Extract one file from a multi-GB archive without full unzipping. |
| **30** | **High Compression** | Storage Ops. | Handling massive datasets with multi-threaded `xz` tooling. |
| **31** | **Piping Mastery** | Efficiency. | Bypass intermediate steps using `find` into `tar -T`. |
| **32** | **rsync Theory** | Sync Operations. | Understanding delta-transfers for server-to-server sync. |
| **33** | **Remote Mock** | Infrastructure. | Mastery of the syntax for moving data across a network via `scp`. |
| **34** | **Versioned Backups** | Data Retention. | Implementing automated rotation (keep last 7 days) logic. |
| **35** | **Adversity Lab** | Recovery Speed. | Restore a critical config from backup after a simulated wipe. |
| **36** | **Regex Wildcards** | Complex matching. | Flexibility in parsing inconsistent date/time formats in logs. |
| **37** | **Regex Groups** | Multi-matching. | Mastering "OR" logic to search for multiple error codes at once. |
| **38** | **Security Audit** | Threat Hunting. | Identify brute-force attempts per IP from `/var/log/secure`. |
| **39** | **Pattern Validation** | Data Integrity. | Ensure script input matches strict 24hr timestamp standards. |
| **40** | **Script Expansion** | Hardened Input. | Implement Regex validation to reject "bad input" symbols. |
| **41** | **Adversity Lab** | The Log Bomb. | Isolate 5 specific error types from a 100k-line log file instantly. |
| **42** | **Stress Test** | Live Monitoring. | Situational awareness of live system activity via `tail -f \| grep`. |
| **43** | **Field Extraction** | Data Isolate. | Stripping noise to find the "useful" columns in system files. |
| **44** | **Data Merging** | Reporting. | Combine separate data streams into a single narrative report. |
| **45** | **sed Foundations** | In-place editing. | Non-interactive file editing for remote automation. |
| **46** | **The Report Lab** | Intelligence. | Identify "Top 10" system anomalies via `sort` and `uniq -c`. |
| **47** | **Script Integration** | Daily Telemetry. | Build an automation that provides a formatted "Admin Dashboard." |
| **48** | **Adversity Lab** | Pathing Errors. | Handle delimiters and escape characters in complex data surgery. |
| **49** | **Adversity Lab** | The Ghost Entry. | Clean system configs of duplicate entries via CLI tools. |
| **50** | **sort Algorithms** | Optimization. | Finding "Resource Hogs" with mathematical accuracy. |
| **51** | **uniq Counting** | Pattern Density. | Isolating systemic errors and redundant log noise. |
| **52** | **fmt/pr** | Layout Mastery. | Professional presentation of raw terminal data for reports. |
| **53** | **Dashboard Lab** | Live Operations. | Building a real-time "NOC" display for system telemetry. |
| **54** | **Refactor Session** | Code Quality. | Remove redundant pipes to improve script performance. |
| **55** | **Adversity Lab** | The Data Surgeon. | Clean a raw, messy CSV and convert it to a readable text table. |
| **56** | **Stress Test** | The Analyst Exam. | Parse a log, find the leak, and generate a final report. |

---

## 🏗 Month 3: Modular Engineering
**Objective:** Transition from writing commands to architecting robust, modular software.

| Day | Goal | Purpose/Intention | Expectancy |
| :--- | :--- | :--- | :--- |
| **57** | **Script Anatomy** | Standards. | Professional, readable, and standardized headers/Shebangs. |
| **58** | **Variable Scope** | Safety. | Prevent "variable bleeding" via `local` and `readonly`. |
| **59** | **Exit Status** | Diagnostic Logic. | Scripts that "know" how to react when a command fails. |
| **60** | **Modern tests** | Integrity. | Building unbreakable "Gates" in your code via `[[ ]]`. |
| **61** | **Dependency Check**| Reliability. | Ensure code only runs in a verified system environment. |
| **62** | **Adversity Lab** | The Empty Variable. | Handle "null" data gracefully to prevent script crashes. |
| **63** | **Stress Test** | The Gatekeeper. | Write a script that checks for 5 specific system requirements. |
| **64** | **Workflows** | Planning. | Thinking through the "Safety First" mindset of user management. |
| **65** | **Quoting Mastery** | Bug-proofing. | Code that works in the "Messy" real world (spaces/symbols). |
| **66** | **Absolute Pathing** | Portability. | Moving away from "Hardcoded" paths to dynamic logic. |
| **67** | **Redirection II** | Output Control. | Separate `stdout` and `stderr` into distinct "Black Box" logs. |
| **68** | **The Onboarder** | Automation. | One-touch automated user and environment management. |
| **69** | **Adversity Lab** | The Hidden File. | Mastering globbing and dot-file handling in scripts. |
| **70** | **Adversity Lab** | The Logic Leak. | Resolve a script that is firing both branches of an `if` block. |
| **71** | **Functions I** | Abstraction. | Reducing code bloat and improving global readability. |
| **72** | **Arguments** | Dynamic Input. | Building functions that are flexible and powerful via `$@`. |
| **73** | **local Scope** | Encapsulation. | Memory isolation and clean modular coding practices. |
| **74** | **Modular Lab** | Library Building. | Professional modular script architecture via `source`. |
| **75** | **Integration** | The Refactor. | Upgrade `setup_env.sh` into a function-based library. |
| **76** | **Adversity Lab** | The Missing Function. | Troubleshooting modular sourcing and execution order. |
| **77** | **Stress Test** | The Modular Suite. | Managing complex, multi-part automation via a master script. |
| **78** | **if/elif/else** | Branching. | Conditional intelligence based on time of day or system load. |
| **79** | **Advanced Tests** | Time Logic. | High-precision synchronization logic using `-nt`. |
| **80** | **Logic Shorthand** | Elegance. | Writing "Pro" level, concise Bash code via `&&` and `\|\|`. |
| **81** | **EUID Check** | Security Gate. | Protecting the system from unauthorized execution. |
| **82** | **The Monitor** | Resource Logic. | Proactive monitoring and alerting for disk thresholds. |
| **83** | **Adversity Lab** | The Permission Trap. | Fix a script that is failing to execute due to umask issues. |
| **84** | **Stress Test** | The Decision Engine. | Script that audits a failure and chooses a fix automatically. |

---

## ⚡ Month 4: Automation & Scale
**Objective:** Engineer autonomous, interactive, and indestructible system software.

| Day | Goal | Purpose/Intention | Expectancy |
| :--- | :--- | :--- | :--- |
| **85** | **read Mastery** | UX. | User-friendly, flexible terminal tools with default inputs. |
| **86** | **Input Sanitize** | Security. | Protecting automation from "Bad Input" injection. |
| **87** | **The select Menu** | Navigation. | Professional UI for administrative operations. |
| **88** | **Assistant Tool** | Accessibility. | Making complex commands easy for non-expert users. |
| **89** | **UI Expansion** | Polish. | A unified "Command Center" interface for the suite. |
| **90** | **Adversity Lab** | The Infinite Prompt. | Mastering loop control and "escape" conditions. |
| **91** | **Stress Test** | The Interactive Build. | High-speed development of interactive configuration software. |
| **92** | **while Loops** | Persistence. | Automation that "waits" and reacts to system states. |
| **93** | **until Loops** | Thresholds. | Event-driven automation logic. |
| **94** | **break/continue** | Granular Control. | High-precision data processing within large loops. |
| **95** | **Backgrounding** | Multitasking. | Simultaneous execution of multiple admin tasks. |
| **96** | **The Watcher** | Real-time Ops. | Creating your own persistent "Monitoring Service." |
| **97** | **Adversity Lab** | The Zombie Process. | Mastering process management and signal handling. |
| **98** | **Adversity Lab** | The Batch Processor. | High-volume, automated filesystem management. |
| **99** | **Tracing (-x)** | Debugging. | Total visibility into the "Brain" of your code. |
| **100** | **The Pitfall List** | Code Review. | Reaching the "Clean Code" standard for enterprise review. |
| **101** | **Unit Testing** | Reliability. | Professional software verification techniques. |
| **102** | **Adversity Lab** | The Repairman. | Expert-level diagnostic and repair of corrupted scripts. |
| **103** | **Optimization** | Performance. | Tuning code for speed and resource efficiency. |
| **104** | **Adversity Lab** | The Logic Bomb II. | Emergency system rescue and stabilization from a bad loop. |
| **105** | **Stress Test** | The Debugger Exam. | Fix 3 distinct scripts with 3 different error types in 60 mins. |
| **106** | **case Logic** | Elegance. | The "Final Form" of clean, readable terminal UI. |
| **107** | **Capstone: Plan** | Architecture. | Planning the "Masterwork" system audit tool. |
| **108** | **FSA: The Audit** | Engineering. | The data engine of your final project. |
| **109** | **FSA: The Security** | Hardening. | Making the capstone "Production-Ready." |
| **110** | **FSA: The UI** | Aesthetics. | Delivering high-impact, professional visual data. |
| **111** | **Final Delivery** | Graduation. | README reflects a finished, world-class portfolio. |
| **112** | **The Engineer** | Mastery. | **Run the full suite. You are an Engineer.** |
