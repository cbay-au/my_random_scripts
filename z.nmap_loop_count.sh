


printf "${BLUE}\n########################################################################${NORMAL}\n"
printf "${BLUE}##                     NMAP Count Loop Progress                       ##${NORMAL}\n"
printf "${BLUE}##                     Leighton-0    (In Progress 2023)                       ##${NORMAL}"
printf "${BLUE}\n########################################################################${NORMAL}\n"

# the nmap functions will be typically reading from an IP file (-iL) of many targets.
# script to count how far through this file of targets the nmap function has got.
# the OP will be 'completred x of Y




d=`date +"%y%m%d"`

read -p $'\e[1;92m File path for targets: \e[0m' wl_pass

count_pass=$(wc -l $wl_pass | cut -d " " -f1)



for i in $( eval echo {0..$count_pass} )
do
 
for fn in `cat $wl_pass`; do

resultsnmap.230202.gnmap | grep grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' ips.txt


 printf "Loop number %-1d of %-.3d  \n" $i  $count_pass  "$(wc -l <"$file")"