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
# 2. create a elapse time O/P
# 3. append a date to the file name
# 4. Save results to ~/zresults/

#!/bin/bash
d=`date +"%y%m%d"`
# rm results.{d}
read -p $'${RED} file path to targets: ${NORMAL}' wl_pass
        # -p prompt asks for a file name for the list of sites - names this site wl_pass

#wl_pass="${wl_pass}"
        # creates a variable called wp_pass

#wl_pass=~/mycode/WP_Enum/wpts_m

#count_pass=$(wc -l $wl_pass | cut -d " " -f1)
        # counts the number of lines in wp_pass file

for fn in `cat $wl_pass`; do
perl wp_1.pl -u $fn >> ~/results.{d}
#perl wp_1.pl -u https://circleview.app > temp_perl


#wpscan --url $fn  --no-banner --no-update --wp-version-all >> result_test
done

printf "Done please look in result"

# Produces an output as
#[+] https://tabnext.asia
#[-]+---++---==[-]No User Found
#[-]+---++---==[-] No Version Found

# usefull extras
# tail -f results.{d}	#  shows progress of results
# grep -B
