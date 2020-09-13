#!/bin/bash
clear
re='^[0-9]+$'

C5='\e[1;32m' #green
C4='\e[1;37m' #white
C3='\e[1;31m' #Red
C2='\e[1;33m' #yellow
C1='\e[1;34m' #blue

chooser() {

	ren=`shuf -i 1-3 -n 1`

	if [ $ren = "1" ] ; then
		banner1

	elif [ $ren = "2" ] ; then
		banner2

	elif [ $ren = "3" ] ; then
		banner3

	fi

}

banner1() {

	echo -e "$C1"
	echo -e "$C1""[──────█─▄▀█──█▀▄─█──────]"
	echo -e "$C1""[─────▐▌──────────▐▌─────]"
	echo -e "$C1""[─────█▌▀▄──▄▄──▄▀▐█─────]"
	echo -e "$C1""[────▐██──▀▀──▀▀──██▌────]"
	echo -e "$C1""[───▄████▄──▐▌──▄████▄───]"
	echo -e "$C1""[  Check    open   port  ]"
	echo -e "$C1""[      Dev By: EBH14     ]"
	echo -e "$C4"
	checkint

}

banner2() {

	echo -e "$C1"
	echo -e "   ________              __   ____ "
	echo -e "  / ____/ /_  ___  _____/ /__/ __ \ "
	echo -e " / /   / __ \/ _ \/ ___/ //_/ /_/ /"
	echo -e "/ /___/ / / /  __/ /__/ ,< / ____/ "
	echo -e "\____/_/ /_/\___/\___/_/|_/_/     "
	echo -e "$C4"
	checkint

}

banner3() {

	echo -e "$C4"
	echo -e "$C1"'  dP""b8 88  88 888888  dP""b8 88  dP 88""Yb '
	echo -e "$C1"' dP   `" 88  88 88__   dP   `" 88odP  88__dP '
	echo -e "$C1"' Yb      888888 88""   Yb      88"Yb  88"""  '
	echo -e "$C1"'  YboodP 88  88 888888  YboodP 88  Yb 88    '
	echo -e "$C4"
	checkint

}

checkint() {

	echo
	echo
	if ping -q -c 1 -W 1 www.google.com &> /dev/null ;then
		menu
	else
		echo -e "$C3!)$C4 You Don't Have Internet Connection !"
		exit
	fi

}

menu() {

	echo -e "$C1""1)$C4 For Check All Ports"
	echo -e "$C1""2)$C4 For Check From 1 To 1000"
	echo -e "$C1""3)$C4 For Check Just 1 Port"
	echo -e "$C3""0)$C4 For Exit From Tool"
	echo
	enter

}

enter() {

	echo
	read -p $'\e[1;32m+)\e[1;37m Choose The Tool : \e[1;32m' en
	echo

	checkn
}

checkn() {

    if ! [[ $en =~ $re ]] ; then
        echo -e "$C3""!)$C4 It's Not Number !"
        enter
    
    else
        start
    
    fi
    
}

start() {
    
    if [ $en = "1" ] &> /dev/null ; then
        Tool1
    
    elif [ $en = "2" ] &> /dev/null ; then
        Tool2
    
    elif [ $en = "3" ] &> /dev/null ; then
        Tool3
    
    elif [ $en = "0" ] &> /dev/null ; then
        clear
        exit
        
    else
        echo -e "$C3""!)$C4 Unknown Enter !"
        enter
        
    fi
    
    
}

Tool1() {
    
    echo -e "$C5""√)$C4 Check Started"
    x=1
    while [[ $x -le 65535 ]]; do
    
        if timeout 1 bash -c "</dev/tcp/kernel.org/$x &>/dev/null"; then  
            echo -e "$C5""√)$C4 Port Number $x Open"
        
        else
            echo -e "$C3""!)$C4 Port Number $x Closed"
        
        fi
        x=$(expr $x + 1)
    done
    echo -e "$C5""√)$C4 All Ports Checked "
    x=1
    enter

}

Tool2() {
    
    echo -e "$C5""√)$C4 Check Started"
    x=1
    while [[ $x -le 1000 ]]; do
    
        if timeout 1 bash -c "</dev/tcp/kernel.org/$x &>/dev/null"; then  
            echo -e "$C5""√)$C4 Port Number $x Open"
        
        else
            echo -e "$C3""!)$C4 Port Number $x Closed"
        
        fi
        x=$(expr $x + 1)
    done
    echo -e "$C3""√)$C4 All Ports From 1 to 1000 Checked "
    x=1
    enter

}

Tool3() {
    
    read -p $'\e[1;32m+)\e[1;37m Enter Port Number : \e[1;32m' p
        if ! [[ $p =~ $re ]] ; then
        echo -e "$C3!)$C5 It's Not Number !"
        enter
    
    fi
    
    if timeout 5 bash -c "</dev/tcp/kernel.org/$p &>/dev/null"; then  
        echo -e "$C5√)$C4 Port Number $p Is Opened"
        sleep 10
        clear
        Tool3

    else
        echo -e "$C3√)$C4 Port Number $p Is Closed"
        sleep 10
        clear
        Tool3
    
    fi
}

chooser
