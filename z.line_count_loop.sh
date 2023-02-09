
#!/bin/bash
# A script for monitoring a file growth in line numbers

printf '\n########################################################################\n'
printf '##                 Loop to monitor growth of file                     ##\n'
printf '##                     Leighton-0    (Jan 2023)                       ##\n'
printf '########################################################################\n\n'

# This scrip takes three inputs entered by the user name of the file to be monitored
# the duration forwich you wish to monitor line list growth and the iterval between 
# the scans.
# It can be run using either running bash wc_loop.sh in the CL or changing permissions
# using chmod +x wc_loop.sh and runnning with ./wc_loop.sh
prtintf '\n ########################--TO DO--#####################################\n'
printf '\n\n\n\n\n'
#1.	tidy up OP table



printf "Name of file to monitor\n"
read file

printf "How long to monitor file growth in minutes\n"
read time

printf "Interval between loops\n"
read s

a=$((time * 60))												# works out overall time in seconds
b=$((a / s))													# no of loops

for i in $( eval echo {0..$b} )											# note use of eval echo used in FOR loop containing variable
do
	printf "Loop number %-1d of %-.3d Interval: %10.2d Line Count: %-10.2d \n" $i  $b  $s  $l  "$(wc -l <"$file")"		# -10 = left justified, field width
	sleep $s													# .2 adds padding of 2 called precision modifier
done										# see https://stackoverflow.com/questions/57747767/printf-in-bash-function-add-new-line-to-the-wc-l-results
printf "finished\n"

: << 'COMMENT'
################################################

Example of formatted table layout
#!/bin/bash
seperator=--------------------
seperator=$seperator$seperator
rows="%-15s| %.7d| %3d| %c\n"
TableWidth=37

printf "%-15s| %-7s| %.3s| %s\n" Name ID Age Grades
printf "%.${TableWidth}s\n" "$seperator"
printf "$rows" "Sherlock Holmes" 122 23 A
printf "$rows" "James Bond" 7 27 F
printf "$rows" "Hercules Poirot" 6811 59 G
printf "$rows" "Jane Marple" 1234567 71 C

#==============================================
COMMENT
