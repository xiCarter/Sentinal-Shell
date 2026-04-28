#!/bin/bash
#This script takes variables and appends them to a file, removing repition.

TARGET="pracfile"
BLUE="\033[0;34m"

if grep -q "PURPLE" "$TARGET"; then
	#what happens if it's already there
	echo -e ${BLUE}"Already Completed"
else
cat <<'EOF' > $TARGET

# colors
PURPLE="\033[0;35m"
BLUE="\033[0;34m"
RED="\033[0.31m"
GREY="\033[0.37m" 

# layouts
PS1="${GREY}\u ${PURPLE}(\@) ${GREY} @\h: ${GREY}\W $GREY\$: "    

EOF
fi
