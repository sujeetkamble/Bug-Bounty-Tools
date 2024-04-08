#!/bin/bash


#############################
######     banner   #########

echo "
 █████╗ ██╗     ██╗     ██╗███╗   ██╗ ██████╗ ███╗   ██╗███████╗
██╔══██╗██║     ██║     ██║████╗  ██║██╔═══██╗████╗  ██║██╔════╝
███████║██║     ██║     ██║██╔██╗ ██║██║   ██║██╔██╗ ██║█████╗  
██╔══██║██║     ██║     ██║██║╚██╗██║██║   ██║██║╚██╗██║██╔══╝  
██║  ██║███████╗███████╗██║██║ ╚████║╚██████╔╝██║ ╚████║███████╗
╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
                                                                 
                                                  "
echo "               Welcome to AllInOne!"
echo -e "        Created with \e[31m♥️\e[0m  by Sujeet Kamble"
echo ""
echo "Usage: allinone [folder name] [domains file path]"
echo "Example: allinone google domains.txt"
echo "-----------------------------------------------------------"


#############################
######   paramentes   #######
## folder name
folder_name=$1
## domain name
file_path=$2
## count
num1=1

#############################
######   functions   ########

## Arguments check
if [ $# -eq 2 ]; then
    # Run the rest of the code here
    echo ""
else
    # Exit the script if not enough arguments are provided
    echo ""
    echo "Error: Two arguments are required."
    exit 1
fi

## create folder and change directory
mkdir $folder_name
cd $folder_name

## Run SuzSUB
while read -r domain; do
	echo "Running SuzSUB on $domain"
    ./../suzsub.sh $domain $domain
done < ../$2 

## Run UniSUB
while read -r domain; do
	echo "Running UniSUB on $domain"
    ./../unisub.sh $domain
done < ../$2 

## Run IpSuz
while read -r domain; do
    echo "Running IpSuz on $domain"
    ./../ipsuz.sh $domain
done < ../$2 

## Run Gowitness
while read -r domain; do
    echo "Running Gowitness on $domain"
    gowitness file -f $domain/main/httprobe.txt --screenshot-path $domain/gowitness --disable-logging
done < ../$2 


#############################
