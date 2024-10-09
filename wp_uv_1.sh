#!/bin/bash -   
#title          :wp_uv_1.sh
#description    :Wraps wp_uv_2.pl in a loop reading from a list file
#author         :leighton-0
#date           :20241002
#version        :0      
#usage          :./wp_uv_1.sh
#notes          :needs wp_uv_2.pl in same directory       
#bash_version   :5.2.15(1)-release
#============================================================================
# TO DO
# 1. Clean up
# 2. create a elapse time O/P  DONE
# 3. append a date to the file name  DONE
# 4. Save results to ~/zresults/ --> file target & results have to be 
# entered manually atm.

#          README
# This script is a wrapper around  perl script wp_uv_1.pl. This .pl script
# has to be in the same path as this .sh script.
# Original perl script is:-  https://github.com/joker25000/WP_Enum
# The shell wrapper allows the input of multiple targets from a txt file
# When run using ./wp_uv_1.sh you will be prompted for a target file path TO DO
#


#!/bin/bash
SECONDS=0
d=$(date +"%y%m%d")
# rm results.{d}
#read -p "${RED} file path to targets: ${NORMAL}" wl_pass
        # -p prompt asks for a file name for the list of sites - names this site wl_pass

#wl_pass=${wl_pass}
        # creates a variable called wp_pass

wl_pass=~/ztargets/wp_websites.csv-ab_1.1         # enter manually
results=~/zresults/uv_wp_websites.csv-ab_1.1.${d}	# enter manually

#count_pass=$(wc -l $wl_pass | cut -d " " -f1)
        # counts the number of lines in wp_pass file
printf "\n${BLUE}===========================================${NORMAL}\n" >> ${results}
printf "${RED} Results from file:  ${wl_pass}${NORMAL}\n"  >> ${results}
printf "${RED}       Run on date: ${d}\n" >> ${results}
printf "${BLUE}===========================================${NORMAL}\n\n" >> ${results}
for fn in `cat ${wl_pass}`; do
perl wp_uv_1.pl -u $fn >> ${results}
#perl wp_1.pl -u https://circleview.app > temp_perl


#wpscan --url $fn  --no-banner --no-update --wp-version-all >> result_test
done

printf "Done please look in result"
    ELAPSED="Elapsed: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"
    printf "\n${CYAN}Finished - Runtime = ${ELAPSED}${NORMAL}\n"



# Produces an output as
#[+] https://tabnext.asia
#[-]+---++---==[-]No User Found
#[-]+---++---==[-] No Version Found

# usefull extras
# tail -f results.{d}	#  shows progress of results
# grep -B
