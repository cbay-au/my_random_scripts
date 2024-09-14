#!/bin/bash

echo "enter the password"
read -s password

openssl enc -aes-256-cbc -d -in ~/mycode/repos/my_random_scripts .env.enc -out ~/mycode/.env -k $password

echo "File decrypted successfully"
