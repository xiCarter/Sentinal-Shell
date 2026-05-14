#!/bin/bash
#Purpose: Monitor the systems pulse via probing for date and uptime; providing an exact window to correlate with other logs.
PULSE_LOG="/home/sensei/Projects/bin/pulse.log"

while [ true ]; do
	echo "$(date)" >> "$PULSE_LOG"
	echo "$(uptime)" >> "$PULSE_LOG"
	sleep 30
done
