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
touch ip-all.txt

## loop the main command 
while read -r domain; do
    ip=$(dig +short "$domain" | tail -n1)
    echo "$domain: $ip"
done < sub-all.txt > sub-ip.txt

awk '$2 {print $2}' sub-ip.txt | sort | uniq > ip-all.txt

# unresolved ip list
cat ip-all.txt | grep -v '^[0-9]' > ip-unresolved-list.txt

# private ip list
cat ip-all.txt | grep '^10\.' > ip-private-list.txt
cat ip-all.txt | grep -E '^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[0-1]\.' >> ip-private-list.txt
cat ip-all.txt | grep '^192\.168\.' >> ip-private-list.txt

# public ip list
diff ip-all.txt ip-private-list.txt | grep '^<' | sed 's/^< //g' > temp1
diff temp1 ip-unresolved-list.txt | grep '^<' | sed 's/^< //g' > ip-public-list.txt

rm temp1

echo ""
echo "Remove the private ip addresses -"
echo "10.0.0.0 to 10.255.255.255"
echo "172.16.0.0 to 172.31.255.255"
echo "192.168.0.0 to 192.168.255.255"
echo "Done."


#############################

## For unresolved subdomains 
## use different-different DNS resolves
## example
## dig @9.9.9.9 +short "$domain"
## and other DNS resolvers
