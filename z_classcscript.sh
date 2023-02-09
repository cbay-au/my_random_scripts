 #!/bin/bash

# converts cidr to Ip => not sure of the detail!!

#nmap -sL -n -iL ip_blocks_CIDR_russia-1all -oN z_1
#awk '{print $5}' z_1 > z_2
for (( i=192; i <= 233; i++ )); do
grep -xE "($i)(\.[0-9]{1,3}){3}" z_2 >> z_3
done
