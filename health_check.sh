#!/bin/bash

# This script tests the Layers of the OSI model in the order a connection is likely to fail.


# is IP routable ?

echo "                    "
echo " === DHCP CHECK === "

if ip addr | grep -q "169.254"
	then 
		echo "DHCP FAILED"
		exit 1
	else
	       	echo "IP ROUTABLE"
fi
echo "            " 


# is the gateway reachable ?

echo " === GATEWAY CHECK === "

GW=$(ip route | grep "default" | awk '{print $3}')

if ping -c 1 -q "$GW" > /dev/null 2>&1
	then
    		echo "GATEWAY REACHABLE"
	else
    		echo "GATEWAY UNREACHABLE"
fi
echo "       "


# is the internet reachable ?

echo "=== INTERNET CHECK ==="

if ping -c 1 -q "8.8.8.8" > /dev/null 2>&1
	then
		echo "INTERNET REACHABLE"
	else
		echo "INTERNET UNREACHABLE"
fi
echo "     "


# is DNS running ?

DIGDNS=$(dig +short google.com)
echo "=== DNS CHECK ==="

if [ -n "$DIGDNS" ]
	then 
		echo "DNS RUNNING"
	else
		echo "DNS DOWN"
fi 
echo "     "

# are ports listening ?

echo "=== SERVICE CHECK ==="
	ss -tuln | awk 'NR>1 {print $2, $5}'
echo "    "

