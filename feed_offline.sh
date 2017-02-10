#!/bin/bash
#Version 1.0 
#Changelog- 1.0 - Inicio 
#Defenir las firmas
PACKAGE_LIST="ossim-mysql-ext alienvault-directives-free alienvault-directives-pro alienvault-crosscorrelation-free alienvault-crosscorrelation-pro snort-rules-default suricata-rules-default ossim-taxonomy alienvault-openvas-feed alienvault-openvas8-feed alienvault-cpe alienvault-plugins alienvault-plugin-sids alienvault-reporting"
#Crear el Menu
HEIGHT=15
WIDTH=60
CHOICE_HEIGHT=4
BACKTITLE="Actulizar firmas USM OFFLINE"
TITLE="Actualiza firmas USM OFFLINE"
MENU="Elige una opcion:"

OPTIONS=(1 "Bajar las actualizaciones de firmas"
         2 "Instalar las firmas"
         3 "Salir")

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
		echo "Bajando las firmas"
		sleep 3
		for FIRMWARE in $PACKAGE_LIST; do
			dpkg -l $FIRMWARE|grep ^ii >/dev/null 2>&1 && apt-get download $FIRMWARE
		done
            ;;
	2)
		echo "Instalando las firmas"
		sleep 3
		   dpkg -i *.deb  && alienvault-reconfig -c -v
exit 0
            ;;
	3)
	exit 0
            ;;
esac
