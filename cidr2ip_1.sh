

#!/bin/bash    

# COLOR INFORMATION
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
UNDERLINE=$(tput smul)
# To reset the color information such that subsequent text is in the normal terminal color you would append ${NORMAL} to the end like so
# echo "${RED}this is red ${NORMAL}this is normal
# printf "%40s\n" "${blue}This text is blue${normal}"

clear

printf "${BLUE}\n########################################################################${NORMAL}\n"
printf "${BLUE}##                   CIDR TO IP SCRIPT (CIDR2IP)                      ##${NORMAL}\n"
printf "${BLUE}##                     Leighton-0    (Feb 2023)                       ##${NORMAL}"
printf "${BLUE}\n########################################################################${NORMAL}\n"

# This small script converts a file containing  cidr notation ip addresses to 
# ip address. Need to substitute the -iL < IP File> with own and also substitute 
# file.



# ip_blocks_CIDR_russia-aa

nmap -n -sL -iL ip_blocks_CIDR_russia-aa | awk '/Nmap scan report/{print $NF}' > cidr2ip1.txt



#	-sL: List Scan - simply list targets to scan
#	-n: Never do DNS resolution

######################################
COMMENT
