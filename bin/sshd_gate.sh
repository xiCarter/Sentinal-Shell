#!/bin/bash
# sshd_gate.sh
# Purpose: Self-healing monitor for sshd.service
# Logging: structured lined that work with jounractl -t
# Runs via systemd timer every 30-60s

# Config Section
SSHD_LOG="/home/sensei/SSHD_LOG"
TAG="sshd_gate"


# Helper Functions
log_event() {
	local status="$1"
	local message="$2"
	local timestamp=$(date '+%Y-%m-%d %H:%M:%S') 
	echo "'$timestamp' | '$TAG' | '$status' | '$message'" | tee -a "$SSHD_LOG"
	logger -t "$TAG" "'$STATUS' - '$message'"
}

# Main Logic Gate
if [ "$(systemctl is-active sshd)" = "active" ] && ss -lpn | grep -q ':22'; then
	log_event "HEALTHY" "sshd is active and listening on port 22"
	echo "sshd_gate_status=healthy"
 else
	echo "sshd_gate_status=failed...RESTARTING"
 	log_event "RESTARTING" "sshd was inactive or not listening - initiating restart"
	sudo systemctl daemon-reload 
	sudo systemctl restart sshd	
sleep 3
	if [ "$(systemctl is-active sshd)" = "active" ] && ss -ltpn | grep -q ':22.*sshd'; then
		log_event "SUCCESS" "restart completed successfully"
		echo "sshd_gate_status=restarted"
 		exit 1
	else
		log_event "FAILURE" "restart attmepted - sshd still inactive"
		echo "sshd_gate_status=failed"
		exit 2
	fi
echo "sshd_gate_status=failed"
fi

