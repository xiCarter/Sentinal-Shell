#!/bin/bash

# This script tests the Layers of the OSI model in the order a connection is likely to fail.


# is IP routable ?

echo " === DHCP CHECK === "

if ip addr | grep -q "169.254"
	then 
		echo "DHCP FAILED"
	else
	       	echo "IP ROUTABLE"
fi

echo "            "
exit 0 

# is the gateway reachable ?

echo " === GATEWAY CHECK === "

GW=$(ip route | grep "default" | awk '{print $3}')

if ping -c 1 -q "$GW" > /dev/null 2>&1
	then
    		echo "GATEWAY REACHABLE"
	else
    		echo "GATEWAY UNREACHABLE"
fi

echo "            "
