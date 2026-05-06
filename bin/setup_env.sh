#!/bin/bash
#Purpose: Automated the standardization of the user environment by injecting custom shell configurations and verifying status of deployment.

# Shortcut

HOME="/home/sensei"
TARGET="$HOME/.bashrc_custom"
GREY="\033[0;37m" 
BLUE="\033[0;34m"
RED="\033[0;31m"
MONITOR_LOG="$HOME/MONITOR_LOG"
BACKUPCONFIG="$HOME/bin.bak/bashrc_custom.bak"
HEALTH_REPORT="$HOME/HEALTH_REPORT"
#Verify root priviledges before executing.
if [ "$EUID" -ne 0 ]; then
	echo "Must Run As Root User"
	exit 1
fi

	#Root privilege is verified.
echo -e ${BLUE}"Root Confirmed. Starting Setup..."${GREY}





	# Station 0: Defining Environment
cat <<'EOF' > $TARGET
#Here we are defining our desired prompt layout, as well as any colors we may intergrate into the environment.

# colors
PURPLE="\033[0;35m"
BLUE="\033[0;34m"
RED="\033[0;31m"
GREY="\033[0;37m" 

# layouts
PS1="${GREY}\u ${PURPLE}(\@) ${GREY} @\h: ${GREY}\W $GREY\$: "    
EOF



# --- STATION 1: SYSTEM HEALTH CHECK ---
echo -e "${BLUE}Running System Health Check...${NC}"

# 1. Check Uptime
UPTIME_REPORT=$(uptime -p)

# 2. Check Disk Space
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

# 3. Check Memory
MEM_FREE=$(free -h | awk '/^Mem:/ {print $4}')

# --- LOGGING TO THE MONITOR ---
echo "--- Health Audit: $(date) ---" >> "$HEALTH_REPORT"
echo "Uptime: $UPTIME_REPORT" >> "$HEALTH_REPORT"
echo "Disk Usage (/): $DISK_USAGE" >> "$HEALTH_REPORT"
echo "Available Memory: $MEM_FREE" >> "$HEALTH_REPORT"

# Output to User Screen
echo -e "${GREY}Uptime:${NC} $UPTIME_REPORT"
echo -e "${GREY}Disk Usage:${NC} $DISK_USAGE"
echo -e "${GREY}Free Memory:${NC} $MEM_FREE"


# ----------------------------------------------------------------------------------------------


	#Station 2: Recovery Logic
if [ ! -f "$TARGET" ] && [ -f "$BACKUPCONFIG" ]; then
    echo "Restoring .bashrc_custom from backup..."
    cp "$BACKUPCONFIG" "$TARGET"
    chown sensei:sensei "$TARGET"
fi
	

# ----------------------------------------------------------------------------------------------


	# Station 3: Link the custom file to the main bashre
REAL_BASHRC="$HOME/.bashrc"
HOOK_LINE="source $TARGET"

if ! grep -q "$HOOK_LINE" "$REAL_BASHRC"; then
    echo "Station 3: Linking .bashrc_custom to main bashrc"
    echo "if [ -f $TARGET ]; then $HOOK_LINE; fi" >> "$REAL_BASHRC"
else
	echo -e ${BLUE}"Custom Environment Already Deployed in .bashrc. Skipping."${GREY}
fi


# ----------------------------------------------------------------------------------------------

	
	#Station 4: Data Monitoring
	#Purpose: Monitor what files have been altered in x amount of time.
SENSEI_HOME="/home/sensei/"
MONITOR=$(find "$SENSEI_HOME" -type f -mmin -60 2>/dev/null)
if [ -z "${MONITOR}" ]; then
	echo "No File Alteration Within 60m Ago."
else
	echo "---$(date)---" >> "$MONITOR_LOG"
	echo -e "$MONITOR" >> "$MONITOR_LOG"
echo "Recent File Alterations Found.. Logged in Monitor_Log"
fi


# ----------------------------------------------------------------------------------------------


	#Station 5:Package Management
	#Purpose: Verify if a package(TOOL) exists in the system prior to downloading it + Verifying Functionality.
	#Download package ONLY if it does not exist currently.
TOOL="${1,,}"
if [ -z "$TOOL" ]; then
       exit 1	
else
if ! command -v "${TOOL}" &> /dev/null; then
	echo "Initializing Installation For "${TOOL}" ..."${GREY}
	sudo dnf install "${TOOL}" -y
	else
		echo -e ${BLUE}""${TOOL}" Is Already Configured. Skipping."${GREY}
fi
	#Package Functionality Verification. If Verification Fails, Error Code is Displayed.

if which "${TOOL}" -version &> /dev/null; then
	echo -e "Verification Success. $(${TOOL} --version) is Active."
else
	ERROR_CODE=$?
	echo "Verification ${RED}Failed ${GREY}For "${TOOL}""
	echo -e "ERROR CODE: ${ERROR_CODE}"
fi
fi
