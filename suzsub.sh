#!/bin/bash

#############################
######     banner   #########

echo "
███████╗██╗   ██╗███████╗███████╗██╗   ██╗██████╗ 
██╔════╝██║   ██║╚══███╔╝██╔════╝██║   ██║██╔══██╗
███████╗██║   ██║  ███╔╝ ███████╗██║   ██║██████╔╝
╚════██║██║   ██║ ███╔╝  ╚════██║██║   ██║██╔══██╗
███████║╚██████╔╝███████╗███████║╚██████╔╝██████╔╝
╚══════╝ ╚═════╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ 
                                                  "
echo "               Welcome to SuzSUB!"
echo -e "        Created with \e[31m♥️\e[0m  by Sujeet Kamble"
echo ""
echo "Usage: suzsub [folder name] [domain name]"
echo "Example: suzsub google google.com"
echo "-----------------------------------------------------------"

#############################
######   paramentes   #######

## folder name
folder=$1
## domain name
domain=$2
## count
num1=1
## list
sources=("alienvault" "anubis" "bevigil" "binaryedge" "bufferover" "c99" "censys" "certspotter" "chaos" "chinaz" "commoncrawl" "crtsh" "digitorus" "dnsdb" "dnsdumpster" "dnsrepo" "fofa" "fullhunt" "hackertarget" "hunter" "intelx" "netlas" "leakix" "passivetotal" "quake" "rapiddns" "redhuntlabs" "robtex" "securitytrails" "shodan" "sitedossier" "threatbook" "virustotal" "waybackarchive" "whoisxmlapi" "zoomeyeapi" "facebook" "builtwith" "github")

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
mkdir $folder
cd $folder

## loop the main command 
for source in "${sources[@]}"; do
  echo "Running $num1 : $source"
  subfinder -silent -d $domain -o ./sub$num1$source -sources $source > /dev/null
  ((num1++))
done

## 

#############################
