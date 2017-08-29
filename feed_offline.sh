#!/bin/bash
#IMPORTANT --------> You need a valid License to download the feeds.Won't work with a trial version ;( <---------
#Version 2.0 
#Changelog- 1.0 - First release
#Changelog- 2.0 - Update release 
#Define the feeds package
PACKAGE_LIST="ossim-mysql-ext alienvault-directives-free alienvault-directives-pro alienvault-crosscorrelation-free alienvault-crosscorrelation-pro snort-rules-default suricata-rules-default ossim-taxonomy alienvault-openvas-feed alienvault-openvas8-feed alienvault-cpe alienvault-plugins alienvault-plugin-sids alienvault-reporting"
#Create menu
HEIGHT=15
WIDTH=60
CHOICE_HEIGHT=4
BACKTITLE="Update feeds USM OFFLINE"
TITLE="Update feeds USM OFFLINE"
MENU="Choose:"

OPTIONS=(1 "Download the feed for USM"
         2 "Install the feeds"
         3 "Exit")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear

case $CHOICE in
	1)
		echo "Downloading feeds"
		sleep 3
		for FIRMWARE in $PACKAGE_LIST; do
			dpkg -l $FIRMWARE|grep ^ii >/dev/null 2>&1 && apt-get download $FIRMWARE
		done
            ;;
	2)
		echo "Installing Feeds"
		sleep 3
		   dpkg -i *.deb  && alienvault-reconfig -c -v
exit 0
            ;;
	3)
	exit 0
            ;;
esac
