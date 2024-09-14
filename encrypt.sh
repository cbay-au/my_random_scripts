#!/bin/bash

echo "enter the password"
read -s password

openssl enc -aes-256-cbc -salt -in ~/mycode/.env -out ~/mycode/repos/my_random_scripts/.env.enc -k $password

echo "File encrypted successfully"
