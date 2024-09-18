#!/bin/bash
# ref https://www.linkedin.com/pulse/day-2-learn-bash-write-script-encrypt-filefolder-hasan-mahmud-
echo "enter the password"
read -s password

openssl enc -aes-256-cbc -d -in ~/mycode/repos/My_Random_Scripts/.env.enc -out ~/mycode/.env -k $password
	if [ -e ~/mycode/.env ]; then
		printf ".env file installed successfully\n"
	else
		printf " .env file failed to decrypted successfully\n"
	fi
. ~/.bashrc >/dev/null 2>&1	# runs script silently
printf "${RED}this should be in red to prove .env is working${NORMAL}\n"
