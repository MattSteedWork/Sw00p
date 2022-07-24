# Sw00p
### Menu Driven WIFI Security Tester   
   
Sw00p is a bash script that helps automates the use of Airmon/Airodump/Aireplay to test the security of wireless networks.  

## Usage  
This script needs to be run as root then Simply make your choices at the menu screen. 
```
sudo ./Sw00p.sh
```   
Airodump for recon or capturing handshakes and Aireplay will be opened in new terminals.   
!!MAKE SURE TO CLOSE THESE WINDOWS BEFORE RESETING YOUR WIFI CARD!!
```
#########################
#        Sw00p          #
#########################

[+]Choose an option...
[1]Put Card Into Monitor Mode
[2]Run Airodunp For Recon
[3]Run Airodump To Capture Handshake
[4]Deauth User
[5]Reset WIFI Card
[0]Quit
```  
## Issues  
This script will probably need some adaptation depending on your OS.
