#!/bin/bash
#
# [PlexGuide Menu]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 - Deiteq
# URL:      https://plexguide.com
#
# PlexGuide Copyright (C) 2018 PlexGuide.com
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################
export NCURSES_NO_UTF8_ACS=1

 HEIGHT=11
 WIDTH=38
 CHOICE_HEIGHT=5
 BACKTITLE="Visit PlexGuide.com - Automations Made Simple"
 TITLE="Applications - Torrent Programs"

 OPTIONS=(A "RuTorrent"
          B "Deluge"
          C "Jackett"
          D "VPN Options"
          E "BETA - uTorrent"
          F "BETA - qBittorrent"
          Z "Exit")

 CHOICE=$(dialog --backtitle "$BACKTITLE" \
                 --title "$TITLE" \
                 --menu "$MENU" \
                 $HEIGHT $WIDTH $CHOICE_HEIGHT \
                 "${OPTIONS[@]}" \
                 2>&1 >/dev/tty)

case $CHOICE in

     A)
       display=RUTorrent
       program=rutorrent
       echo "$program" > /tmp/program_var
       dialog --infobox "Installing: $display" 3 30
       port=8999
       ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags rutorrent &>/dev/null &
        sleep 3
            echo "$program" > /tmp/program
            echo "$program" > /tmp/program_var
            echo "$port" > /tmp/port
            bash /opt/plexguide/menus/time/cron.sh
            bash /opt/plexguide/menus/programs/ending.sh
       ;;

     B)
       display=Deluge
       program=deluge
       echo "$program" > /tmp/program_var
       dialog --infobox "Installing: $display" 3 30
       port=8112
       ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags deluge &>/dev/null &
        sleep 3
            echo "$program" > /tmp/program
            echo "$program" > /tmp/program_var
            echo "$port" > /tmp/port
            bash /opt/plexguide/menus/time/cron.sh
            bash /opt/plexguide/menus/programs/ending.sh
       ;;

     C)
       display=Jackett
       program=jackett
       echo "$program" > /tmp/program_var
       dialog --infobox "Installing: $display" 3 30
       port=9117
       ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags jackett &>/dev/null &
        sleep 3
            echo "$program" > /tmp/program
            echo "$program" > /tmp/program_var
            echo "$port" > /tmp/port
            bash /opt/plexguide/menus/time/cron.sh
            bash /opt/plexguide/menus/programs/ending.sh
       ;;

     D)
       bash /opt/plexguide/menus/programs/vpn.sh ;;

     E)
       display=uTorrent
       program=utorrent
       echo "$program" > /tmp/program_var
       dialog --infobox "Installing: $display" 3 30
       port=8080
       ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags utorrent &>/dev/null &
        sleep 3
            echo "$program" > /tmp/program
            echo "$program" > /tmp/program_var
            echo "$port" > /tmp/port
            bash /opt/plexguide/menus/time/cron.sh
            bash /opt/plexguide/menus/programs/ending.sh
       ;;

     F)
       display=qBittorrent
       program=qBittorrent
       echo "$program" > /tmp/program_var
       dialog --infobox "Installing: $display" 3 30
       port=8080
       ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags qbittorrent &>/dev/null &
        sleep 3
            echo "$program" > /tmp/program
            echo "$program" > /tmp/program_var
            echo "$port" > /tmp/port
            bash /opt/plexguide/menus/time/cron.sh
            bash /opt/plexguide/menus/programs/ending.sh
       ;;

     Z)
       exit 0 ;;
esac

#### recall itself to loop unless user exits
bash /opt/plexguide/menus/programs/torrent.sh
