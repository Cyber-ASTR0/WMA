#!/bin/bash
### Coded By ASTRO
echo "GETTING READY TO SHOOT"
green='\e[0;32m'
white='\e[1;37m'
red='\e[1;31m'
function main_menu()
{
    while :
    do
echo -ne "\033]0;---ASTRO---"
resize -s 24 109
clear

echo -e """
$red ------------------------------------------------------

$red   __        ____  __    _ 
$red   \ \      / /  \/  |  / \  Ver | 1.0
$red    \ \ /\ / /| |\/| | / _ \  
$green     \ V  V / | |  | |/ ___ \ 
$green      \_/\_/  |_|  |_/_/   \_\  
$green                            Dev | ASTRO
------------------------------------------------------
"""
echo -e  """$white
1] Google Scrapper         | 8] Revarse Ip Lookup
2] Http Header             | 9] Banner Grabing
3] Sql Vuln Web Scrapper   |10] UDP Port Scan
4] Port Scanner            |11] Admin Panel Finder
5] CMS Detector            |12] Hash Cracker
6] Extract Page Links      |13] CheckPort
7] Subdomain Finder        | d] Download Hash List DB
"""
read -p "root@W-M-A:~$ " option
case "$option" in
                d)cd modules
                  wget https://www.dropbox.com/s/jwi4va9vfancx5q/worddb.zip
                  unzip worddb.zip
                  echo "DONE"
                  ;;
                1) cd modules
                   read -p "Enter Dork To Scrape Links From Google:  " dork
                   echo "Collecting DATA PLS WAIT"
                   python3 gs.py $dork >> $dork.scrapped.txt
                   echo "Result Saved in " | pwd "/ $dork.scrapped.txt"
                   cd ..
                   read -p "Enter Any Key To return"
                   ;;
               2) read -p "Enter Host without [http/https] with [www.] : " url
                  curl -I $url
                  read -p "Enter Any Key To return"
                  ;;
              3) echo "Getting Sql Vuln. Site From Google Using Dorks"
                 echo "Collecting Data Please Wait...."
                cd modules
                python3 gs.py inurl:news/news.php?id= >>sql.txt
                python3 gs.py inurl:php?id=* >>_=*.sql1.txt
                echo "Saved As sql.txt *.sql1.txt"
                cd ..
                ;;
                4)read -p "Enter Ip Or Host To Scan :" ip
                nmap $ip
                read -p "press any key to return"
                ;;
            5)cd modules
              read -p "Enter Host Name To Detect CMS :>" site
             python cms-detector.py --site $site
             read -p "press any key to return"
             cd ..
             ;;
            6)echo "EXTRACT PAGE-LINKS"
             read -p "Enter Website Full Url :> " url
             curl https://api.hackertarget.com/pagelinks/?q=$url
             read -p "press any key to return"
             ;;
            7) echo "SUBDOMAIN SCANNER"
              read -p "Enter Website Full Url:> " url
             curl https://api.hackertarget.com/hostsearch/?q=$url
             read -p "press any key to return"
              ;;
            8)echo "REVARSE IP LOOKUP"
              read -p "Enter Ip Adress: " ip
              curl https://api.hackertarget.com/reverseiplookup/?q=$ip
              read -p "press any key to return"
              ;;
            9)echo "Banner Grabing"
              read -p "Enter Ip adreess or CIDR: " ip
             curl https://api.hackertarget.com/bannerlookup/?q=$ip
             read -p "press any key to return"
             ;;
           10)echo "UDP PORT SCAN"
             read -p "Enter ip adress or Host Name To Start Scan: " ipu
             nmap -sU  $ipu
             read -p "press any key to return"
             ;;
           11)cd modules
             perl admin.pl
             cd ..
             read -p "press any key to return"
             ;;
           12) echo "-----Hash Cracker----"
              read -p "Enter Has To Crack::> " $hash
              curl https://www.nitrxgen.net/md5db/$hash
              echo "Checking In Worddb"
              cd modules
              grep -w "$hash" knownhashes
              grep -w "$hash" hashplain
              grep -w "$hash" hashplain2
              grep -w "$hash" hashplain3
              grep -w "$hash" hashplain4
              grep -w "$hash" hashplain4
              ;;
              13) echo "Checking Port"
              cd modules
              bash CheckP.sh
              cd ..
              read -p "press any key to return"
              ;;


          esac
    done
}
main_menu
