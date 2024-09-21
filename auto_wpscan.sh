#!/bin/bash
# A script for auto wpscan

printf '\n########################################################################\n'
printf '##                      WordPress Auto Scan                           ##\n'
printf '##                     Leighton-0    (Jan 2023)                       ##\n'
printf '########################################################################\n\n'

# original script from Github

wpscan --update
read -p $'\e[1;92m file path to targets: \e[0m' wl_pass
	# -p prompt asks for a file name for the list of sites - names this site wl_pass

wl_pass="${wl_pass}"
	# creates a variable called wp_pass

wl_pass=wp-links_cut

count_pass=$(wc -l $wl_pass | cut -d " " -f1)
	# counts the number of lines in wp_pass file

for fn in `cat $wl_pass`; do
wpscan --url $fn  --no-banner --no-update --wp-version-all >> result_test
done

print "Done please look in result"
