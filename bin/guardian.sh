#! /bin/bash

if [ -z "$1" ]
then
	echo "No Ghosts Found. Decomissioning..."
	exit 1
fi

if [ -n "$1" ]
then
TARGET1="$1"

if pgrep -x "$TARGET1" >> /dev/null
then
	echo "Ghost Found. Engaging.."
	killall "$TARGET1"
	echo "Ghost Terminated on $(date)." | tee -a ~/glog
	fi

if [ -n "$2" ]
then
TARGET2="$2"

if pgrep -x "$TARGET2" >> /dev/null
then
	echo "Second Ghost Found. Engaging."
	killall "$TARGET2"
	echo "Second Ghost Terminated on $(date)." | tee -a ~/glog
	echo "gaurdian.sh complete."
	fi
fi
fi
