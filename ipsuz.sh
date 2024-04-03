#!/bin/bash

#############################
######     banner   #########


echo "
██╗██████╗     ███████╗██╗   ██╗███████╗
██║██╔══██╗    ██╔════╝██║   ██║╚══███╔╝
██║██████╔╝    ███████╗██║   ██║  ███╔╝ 
██║██╔═══╝     ╚════██║██║   ██║ ███╔╝  
██║██║         ███████║╚██████╔╝███████╗
╚═╝╚═╝         ╚══════╝ ╚═════╝ ╚══════╝
                                                                                             
"
echo "           Welcome to IP Suz!"
echo -e "    Created with \e[31m♥️\e[0m  by Sujeet Kamble"
echo ""
echo "Usage: ipsuz [domain name]"
echo "Example: ipsuz google "
echo "-----------------------------------------------------------"

#############################
######   paramentes   #######


## folder name
domain_name=$1

## count
num1=1


#############################
######   functions   ########


## Arguments check
if [ $# -eq 1 ]; then
    # Run the rest of the code here
    echo "Running..."
else
    # Exit the script if not enough arguments are provided
    echo ""
    echo "Error: One arguments are required."
    exit 1
fi

## change directory
cd $domain_name
cd main

## create output file
touch iplist.txt

## loop the main command 
while read -r domain; do
    ip=$(dig +short "$domain" | tail -n1)
    echo "$domain: $ip"
done < uniquesub.txt > ipsub.txt

awk '$2 {print $2}' ipsub.txt | sort | uniq > iplist.txt

echo ""
echo "Remove the private ip addresses -"
echo "10.0.0.0 to 10.255.255.255"
echo "172.16.0.0 to 172.31.255.255"
echo "192.168.0.0 to 192.168.255.255"
echo "Done."


#############################

## Add list of DNS resolvers like
## dig @9.9.9.9 +short "$domain"