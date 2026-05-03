#!/bin/bash
#Purpose: Automated the standardization of the user environment by injecting custom shell configurations and verifying status of deployment.

TARGET="setup.bak"
GREY="\033[0;37m" 
BLUE="\033[0;34m"
RED="\033[0;31m"

#Verify root priviledges before executing.
if [ "$EUID" -ne 0 ]; then
	echo "Must Run As Root User"
	exit 1
fi

	#Root privilege is verified.
echo -e ${BLUE}"Root Confirmed. Starting Setup..."${GREY}

if grep -q "PURPLE" "$TARGET"; then
	echo -e "Already Completed"
	#Verifying the environment has already been deployed.
else
	#Station 1: Define your environment:
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
fi
	#Station 2:Package Management
	#Purpose: Verify if a package(TOOL) exists in the system prior to downloading it + Verifying Functionality.
	#Download package ONLY if it does not exist currently.
TOOL=$1
if ! command -v ${TOOL} &> /dev/null; then
	echo -e "Initializing Installation For ${TOOL} ..."${GREY} 
	dnf install ${TOOL} -y
	else
		echo -e ${BLUE}"${TOOL} Is Already Configured. Skipping."${GREY}
fi
	#Package Functionality Verification. If Verification Fails, Error Code is Displayed.

if which ${TOOL} --version &> /dev/null; then
	echo -e ${BLUE} "Verification Success. $(${TOOL} --version) is Active."${GREY}
else
	ERROR_CODE=$?
	echo -e "Verification ${RED}Failed ${GREY}For ${TOOL}"
	echo -e "ERROR CODE: ${ERROR_CODE}"
fi
