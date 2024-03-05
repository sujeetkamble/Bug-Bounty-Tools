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
echo "Usage: suzsub [folder name] "
echo "Example: suzsub google "
echo "-----------------------------------------------------------"

#############################
######   paramentes   #######


## folder name
folder=$1
## count
num1=1
## list
sources=("alienvault" "anubis" "bevigil" "binaryedge" "bufferover" "c99" "censys" "certspotter" "chaos" "chinaz" "commoncrawl" "crtsh" "digitorus" "dnsdb" "dnsdumpster" "dnsrepo" "fofa" "fullhunt" "hackertarget" "hunter" "intelx" "netlas" "leakix" "passivetotal" "quake" "rapiddns" "redhuntlabs" "robtex" "securitytrails" "shodan" "sitedossier" "threatbook" "virustotal" "waybackarchive" "whoisxmlapi" "zoomeyeapi" "facebook" "builtwith" "github")


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
rm suball
touch suball

## loop the main command 
for source in "${sources[@]}"; do
  cat ./sub$num1$source >> suball
  ((num1++))
done

sort suball | uniq > main/uniquesub.txt
sort suball | uniq -c | sort -n > main/sortedsub.txt



echo""
echo "Done."


#############################
