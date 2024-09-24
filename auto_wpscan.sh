#!/bin/bash
# A script for auto wpscan

printf '\n########################################################################\n'
printf '##                      WordPress Auto Scan                           ##\n'
printf '##                     Leighton-0    (Jan 2023)                       ##\n'
printf '########################################################################\n\n'

# original script from Github

set -x

wpscan --update
read -p $'${RED} file path to targets: ${NORMAL}' wl_pass
	# -p prompt asks for a file name for the list of sites - names this site wl_pass

wl_pass="${wl_pass}"
	# creates a variable called wp_pass

wl_pass=wp-links_cut

count_pass=$(wc -l $wl_pass | cut -d " " -f1)
	# counts the number of lines in wp_pass file

for fn in `cat $wl_pass`; do
wpscan --url $fn  --no-banner --no-update --wp-version-all >> result_test
done

printf "Done please look in result"
