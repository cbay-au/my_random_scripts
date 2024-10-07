#!/bin/bash -       
#title           :mkscript.sh
#description     :This script will make a header for a bash script.
#author		 :leigh
#date            :20240214
#version         :1.0 
#usage		 :bash mkscript.sh
#notes           :Use nano this script.
#bash_version    :4.1.5(1)-release
#==============================================================================

today=$(date +%Y%m%d)
div=======================================

/usr/bin/clear

_select_title(){

    # Get the user input.
    printf "Enter a title: " ; read -r title

    # Remove the spaces from the title if necessary.
    title=${title// /_}

    # Convert uppercase to lowercase.
    title=${title,,}

    # Add .sh to the end of the title if it is not there already.
    [ "${title: -3}" != '.sh' ] && title=${title}.sh

    # Check to see if the file exists already.
    if [ -e $title ] ; then 
        printf "\n%s\n%s\n\n" "The script \"$title\" already exists." \
        "Please select another title."
        _select_title
    fi

}

_select_title

printf "Enter a description: " ; read -r dscrpt
printf "Enter your name: " ; read -r name
printf "Enter the version number: " ; read -r vnum

# Format the output and write it to a file.
printf "%-16s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%s\n\n\n" '#!/bin/bash -' '#title' ":$title" '#description' \
":${dscrpt}" '#author' ":$name" '#date' ":$today" '#version' \
":$vnum" '#usage' ":./$title" '#notes' ':' '#bash_version' \
":${BASH_VERSION}" \#$div${div} \
> $title

printf "%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n \
%s\n\n\n"
'# SCRIPT SET UP INFOMATION' \

'# Color informaiton' \
'CLEAR=$(tput clear)' \
'DOWN=$(tput cud1)' \
'BLACK=$(tput setaf 0)' \
'RED=$(tput setaf 1)' \
'GREEN=$(tput setaf 2)' \
'YELLOW=$(tput setaf 3)' \
'LIME_YELLOW=$(tput setaf 190)' \
'POWDER_BLUE=$(tput setaf 153)' \
'BLUE=$(tput setaf 4)' \
'MAGENTA=$(tput setaf 5)' \
'CYAN=$(tput setaf 6)' \
'WHITE=$(tput setaf 7)' \
'BRIGHT=$(tput bold)' \
'NORMAL=$(tput sgr0)' \
'BLINK=$(tput blink)' \
'UNDERLINE=$(tput smul)' \
'# To reset the color information such that subsequent text is in the normal terminal color you would append ${NORMAL} to the end like so' \
'# echo "${RED}this is red ${NORMAL}this is normal"' \
'# printf "%40s\n" "${blue}This text is blue${normal}"' \
>> $title

# Make the file executable.
chmod +x $title

#/usr/bin/clear

nano +12 $title
