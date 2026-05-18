#!/bin/bash
# chronyd_gate.sh
# Purpose: Self-Healing System Time
# Runs via systemd timer - no logging, only prompts on failure

# CONFIG
PROMPT_MESSAGE="TIME SYNC IS DISABLED - RESTARTING"

# HEALTH CHECK
if timedatectl show --property=NTP | grep -q "NTP=yes" && \
	systemctl is-active chronyd > /dev/null 2>&1; then
	exit 0
else
	echo "=== CHRONYD GATE ALERT ==="
	echo "$PROMPT_MESSAGE"
	echo "Current Status"
	timedatectl
	echo "=========================="
	echo "RESTARTING"
	sudo systemctl daemon-reload
	sudo systemctl restart chronyd.service
	sudo systemctl enable chronyd.service
	sudo timedatectl set-ntp true
	sleep 3
		if timedatectl show --property=NTP | grep -q "NTP=yes" && \
		systemctl is-active chronyd > /dev/null 2>&1; then
			echo "=== CHRONYD GATE RESTORED ==="
			exit 0
		else
			echo "=== CHRONYD GATE FAILED TO RESTART ==="
			exit 2
		fi
fi
