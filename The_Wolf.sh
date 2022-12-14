#!/usr/bin/env bash
figlet "                                       The_Wolf" | lolcat
printf "\n";
cat scope.txt | while read domain 
do
   echo "-------------------------------------------------------> Start Reconnaissance 🔥️🔥️☠️🔥️ ";
   printf "\n";
   echo "----------------------------------------------> Sublist3r is loading 🌚️🌚️... [good] 🤧️🤧️🤧️:( ";
   sublist3r -d $domain | anew subdomains.txt;
   printf "\n";
   echo "     #### Sublist3r is Ended ✅️✅️";
   printf "\n";
   echo "----------------------------------------------> Assetfinder is loading 🌚️🌚️... [normal] 😬️😬️😬️:) ";
   assetfinder $domain -subs-only | anew subdomains.txt;
   printf "\n";
   echo "     #### Assetfinder is Ended ✅️✅️";
   printf "\n";
   echo "----------------------------------------------> Subfinder is loading 🌚️🌚️... [very good] 🥰️😘️🥰️:) ";
   subfinder -d $domain | anew subdomains.txt;
   printf "\n";
   echo "     #### Subfinder is Ended ✅️✅️";
   printf "\n";
   echo "----------------------------------------------> Amass is my favourite tool is loading 🌚️🔥️... [Great] 😍️💝️💝️🥰️:) ";
   amass enum -passive -d $domain | anew subdomains.txt;
   printf "\n";
   echo "     #### Amass is Ended ✅️✅️";
   echo "----------------------------------------------> Add your list to the file for more subdomains 💝️🥰️🌚️ [optional]:) ";
   cat subdomains_list.txt | while read subfuzz; do echo $subfuzz".$domain"; done | anew subdomains.txt;
   printf "\n";
   printf "\n";
done;
   echo "-------------------------------------------------------> Start httpx 🙈️🙈️🔥️🔥️[live subdomains] and screenshots ";
   httpx --status-code -list subdomains.txt -o httpx.txt;
   printf "\n";
   echo "-------------------------------------------------------> Start Flutteration 🌔️🌔️🔥️ ";
   printf "\n";
   echo "-------------------------------------------------------> Remove 404 🌚️🌚️:( ";
   printf "\n";
   cat httpx.txt | grep -v "404" | cut -d " " -f1 | anew ALLWithout404.txt;
   printf "\n";
   echo "-------------------------------------------------------> Scan for subdomainTakeover using subzy 💝️💝️:(";
   printf "\n";
   cat httpx.txt | grep "404" | cut -d " " -f1 | anew 404.txt;
   subzy -targets 404.txt | anew takeover.txt;
   printf "\n";
   echo "     #### Httpx and subdomain TakeOver is Ended ✅️✅️✅️✅️";
   printf "\n";
   echo "-------------------------------------------------------> Using Nmap scanner for scanning open ports 🔍️🔍️🔍️ ";
   printf "\n";
   cat httpx.txt | cut -d " " -f1 | unfurl domains | anew Domains.txt;
   nmap --open -iL Domains.txt -sC -Pn -A -T3 -oA NmapScanerResutl.txt;
   printf "\n";
   echo "     #### Nmap scanner is ended ✅️✅️✅️✅️";
   printf "\n";
   echo "-------------------------------------------------------> Gathering endpoints using gau and katana 🔗️🔗️🔥️🔗️ ";
   printf "\n";
   printf "\n";
   echo "-------------------------------------------------------> Gau is comming 🔗️🔥️ ";
   cat Domains.txt | gau --blacklist png,jpg,gif,css,ttf,woff,svg --threads 2 | uro | anew Endpoints.txt;
   echo "-------------------------------------------------------> Let's crawling using katana 🔗️🔥️ ";
   cat ALLWithout404.txt | katana -d 3 -jc -delay 10 | uro | anew Endpoints.txt;
   echo "-------------------------------------------------------> Let's Get the live of them for nuclei 🔥️ ";
   cat Endpoints.txt | httpx-toolkit --status-code -mc 200,403,401,400,301 -o LiveEndpoints.txt;
   echo "-------------------------------------------------------> 🔥️☠️😎️ Nuclei scanner for all [fire tmux and leave them in your VPS] ❤️‍🔥️❤️‍🔥️🔥️ ";
   printf "\n";
   cat httpx.txt | anew LiveEndpoints.txt;
   cat LiveEndpoints.txt | cut -d " " -f1 | anew nuclei.txt;
   cat nuclei.txt | nuclei -o Nuclei_Result.txt;
   printf "\n";
   echo "     #### Nuclei scanner is ended ✅️✅️✅️✅️";
   printf "\n";
   echo "-------------------------------------------------------> Thanks :) made by @khaledyasse1882 🔥️🔥️🥰️🥰️ <----------------------------------------------------";
