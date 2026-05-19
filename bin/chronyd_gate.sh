#!/bin/bash
# chronyd_gate.sh
# Purpose: Self-Healing System Time
# Runs via systemd timer - no logging, only prompts on failure

# CONFIG
PROMPT_MESSAGE="TIME SYNC IS DISABLED - RESTARTING"

# Helper Functions
healthcheck () {
	if timedatectl show --property=NTP | grep -q "NTP=yes" && \
	systemctl is-active chronyd > /dev/null 2>&1; then
	echo "=== CHRONYD GATE RESTORED ===" | tee /dev/console
	exit 0
else
	echo "=== CHRONYD GATE FAILED TO RESTORE ===" | tee /dev/console
	exit 2
	fi
}

# HEALTH CHECK
if timedatectl show --property=NTP | grep -q "NTP=yes" && \
	systemctl is-active chronyd > /dev/null 2>&1; then
	exit 0
else
	echo "=== CHRONYD GATE ALERT ===" | tee /dev/console
	echo "$PROMPT_MESSAGE" | tee /dev/console
	echo "Current Status" | tee /dev/console
	timedatectl
	echo "==========================" | tee /dev/console
	echo "RESTARTING" | tee /dev/console
	sudo systemctl daemon-reload
	sudo chronyc makestep
	sudo systemctl restart chronyd.service
	sudo systemctl enable chronyd.service
	sudo timedatectl set-ntp true
	sleep 10
	healthcheck 
fi
