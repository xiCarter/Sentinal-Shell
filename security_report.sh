#!/bin/bash

LOG=$1

echo "=== Security Report $(date) ==="
echo "				"
echo "--- CRITICAL EVENTS ---"
grep "CRIT" "$LOG" | sort | uniq -c | sort -rn | awk '{print $1, $2, $3, $4, $5, $6, $7}'
	echo "				"

echo "--- WARNINGS ---"
	grep "WARN" "$LOG" | sort
	echo "				"

echo "--- INFO EVENTS ---"
	grep "INFO" "$LOG" | sort | uniq -c | sort -rn | awk '{print $1, $3}'
	echo "				"

echo "=== End of Security Report ==="
