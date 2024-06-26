#!/bin/bash

#############################
######     banner   #########


echo "
██╗   ██╗███╗   ██╗██╗███████╗██╗   ██╗██████╗ 
██║   ██║████╗  ██║██║██╔════╝██║   ██║██╔══██╗
██║   ██║██╔██╗ ██║██║███████╗██║   ██║██████╔╝
██║   ██║██║╚██╗██║██║╚════██║██║   ██║██╔══██╗
╚██████╔╝██║ ╚████║██║███████║╚██████╔╝██████╔╝
 ╚═════╝ ╚═╝  ╚═══╝╚═╝╚══════╝ ╚═════╝ ╚═════╝ 
                                                
                                                  "
echo "               Welcome to UniSUB!"
echo -e "        Created with \e[31m♥️\e[0m  by Sujeet Kamble"
echo ""
echo "Usage: unisub [folder name] "
echo "Example: unisub google "
echo "-----------------------------------------------------------"

#############################
######   paramentes   #######


## folder name
folder=$1
## count
num1=1
## list
sources=("alienvault" "anubis" "bevigil" "binaryedge" "bufferover" "c99" "censys" "certspotter" "chaos" "chinaz" "commoncrawl" "crtsh" "digitorus" "dnsdb" "dnsdumpster" "dnsrepo" "fofa" "fullhunt" "hackertarget" "hunter" "intelx" "netlas" "leakix" "passivetotal" "quake" "rapiddns" "redhuntlabs" "robtex" "securitytrails" "shodan" "sitedossier" "threatbook" "virustotal" "waybackarchive" "whoisxmlapi" "zoomeyeapi" "facebook" "builtwith")


#############################
######   functions   ########


## Arguments check
if [ $# -eq 1 ]; then
    # Run the rest of the code here
    echo ""
else
    # Exit the script if not enough arguments are provided
    echo ""
    echo "Error: One arguments are required."
    exit 1
fi

## change directory
cd $folder

## create temp folder
mkdir main
rm allsub
touch allsub

## loop the main command 
for source in "${sources[@]}"; do
  cat ./sub$num1$source >> allsub
  ((num1++))
done

rm sub*

## make the files
sort allsub | uniq -c | sort -n > main/sub-numbered.txt
sed 's/^[[:space:]]*[0-9]\+[[:space:]]*//' main/sub-numbered.txt > main/sub-all.txt
echo "Running Httprobe...."
cat main/sub-all.txt | httprobe > main/httprobe.txt


echo ""
echo "Done."


#############################
