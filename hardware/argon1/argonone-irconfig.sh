#!/bin/bash

# CHECKPLATFORM="Others"
CHECKPLATFORM="Raspbian"
# Check if Raspbian
grep -q -F 'Raspbian' /etc/os-release &> /dev/null
if [ $? -eq 0 ]
then
	CHECKPLATFORM="Raspbian"
fi

echo "--------------------------------"
echo "Argon One IR Configuration Tool"
echo "--------------------------------"
echo "WARNING: This only supports NEC"
echo "         protocol only."
echo -n "Press Y to continue:"
read -n 1 confirm
echo

if [ "$confirm" = "y" ]
then
	confirm="Y"
fi

if [ "$confirm" != "Y" ]
then
	echo "Cancelled"
	exit
fi
echo "Thank you."

get_number () {
	read curnumber
	if [ -z "$curnumber" ]
	then
		echo "-2"
		return
	elif [[ $curnumber =~ ^[+-]?[0-9]+$ ]]
	then
		if [ $curnumber -lt 0 ]
		then
			echo "-1"
			return
		elif [ $curnumber -gt 100 ]
		then
			echo "-1"
			return
		fi	
		echo $curnumber
		return
	fi
	echo "-1"
	return
}

irexecrcfile=/etc/lirc/irexec.lircrc
irexecshfile=/usr/bin/argonirexec
irdecodefile=/usr/bin/argonirdecoder
kodiuserdatafolder="$HOME/.kodi/userdata"
kodilircmapfile="$kodiuserdatafolder/Lircmap.xml"
remotemode=""
needinstallation=0

loopflag=1
while [ $loopflag -eq 1 ]
do
	echo
	echo "Select remote control to configure:"
	echo "  1. Configure Remote ON/OFF Button"
	if [ "$CHECKPLATFORM" = "Raspbian" ]
	then
		echo "  2. Configure Other Remote Buttons"
		if [ ! -f "$irexecshfile" ]
		then
			echo "  3. Cancel"
			echo -n "Enter Number (1-3):"

			newmode=$( get_number )
			if [[ $newmode -ge 1 && $newmode -le 3 ]]
			then
				loopflag=0
				if [ $newmode -eq 3 ]
				then
					newmode=4
				fi
			fi

		else
			echo "  3. Uninstall Other Remote Buttons"
			echo "  4. Cancel"
			echo -n "Enter Number (1-4):"
			newmode=$( get_number )
			if [[ $newmode -ge 1 && $newmode -le 4 ]]
			then
				loopflag=0
			fi
		fi
	else
		echo "  2. Cancel"
		echo -n "Enter Number (1-2):"

		newmode=$( get_number )
		if [[ $newmode -ge 1 && $newmode -le 2 ]]
		then
			loopflag=0
			if [ $newmode -eq 2 ]
			then
				newmode=4
			fi
		fi
	fi
done


echo
if [ $newmode -eq 3 ]
then
	irtmpconfigfile=/dev/shm/argonirconfig.txt
	sudo systemctl stop irexec.service
	sudo systemctl disable irexec.service
	sudo pip3 uninstall lirc -y
	sudo apt-get -y remove lirc
	sudo rm $irexecshfile
	sudo rm $irdecodefile

	sudo cat /boot/config.txt | grep -v 'dtoverlay=gpio-ir,gpio_pin=23' > $irtmpconfigfile
	cat $irtmpconfigfile | sudo tee /boot/config.txt 1> /dev/null
	sudo rm $irtmpconfigfile

	echo "Uninstall Completed"
	echo "Please reboot for changes to take effect"
	exit
elif [ $newmode -eq 1 ]
then
	loopflag=1
	while [ $loopflag -eq 1 ]
	do
		echo
		echo "Select remote control to configure:"
		echo "  1. Use Argon Remote ON/OFF Button"
		echo "  2. Use Custom Remote ON/OFF Button"
		echo "  3. Cancel"
		echo -n "Enter Number (1-3):"
		newmode=$( get_number )
		if [[ $newmode -ge 1 && $newmode -le 4 ]]
		then
			loopflag=0
		fi
	done

	if [ $newmode -eq 3 ]
	then
		echo "Cancelled"
		exit
	elif [ $newmode -eq 1 ]
	then
		remotemode="resetpower"
	elif [ $newmode -eq 2 ]
	then
		remotemode="power"
	fi
elif [ $newmode -eq 2 ]
then
	echo "--------------------------------"
	echo "Argon One IR Configuration Tool"
	echo "--------------------------------"
	echo "WARNING: This will install LIRC"
	echo "         and related libraries."
	echo -n "Press Y to agree:"
	read -n 1 confirm
	echo

	if [ "$confirm" = "y" ]
	then
		confirm="Y"
	fi

	if [ "$confirm" != "Y" ]
	then
		echo "Cancelled"
		exit
	fi
	echo "Thank you."


	needinstallation=1
	loopflag=1
	while [ $loopflag -eq 1 ]
	do
		echo
		echo "Select remote control to configure:"
		echo "  1. Use Argon Remote Buttons"
		echo "  2. Use Custom Remote Buttons"
		echo "  3. Cancel"
		echo -n "Enter Number (1-3):"
		newmode=$( get_number )
		if [[ $newmode -ge 1 && $newmode -le 4 ]]
		then
			loopflag=0
		fi
	done

	if [ $newmode -eq 3 ]
	then
		echo "Cancelled"
		exit
	elif [ $newmode -eq 1 ]
	then
		remotemode="default"
	elif [ $newmode -eq 2 ]
	then
		remotemode="custom"
	fi
else
	echo "Cancelled"
	exit
fi

needrestart=0
if [ $needinstallation -eq 1 ]
then
	if [ ! -f "$irexecshfile" ]
	then
		needrestart=1
		sudo apt-get -y update
		sudo apt-get -y install lirc

		sudo pip3 install lirc

		echo "dtoverlay=gpio-ir,gpio_pin=23" | sudo tee -a /boot/config.txt 1> /dev/null

		sudo /usr/share/lirc/lirc-old2new

		sudo systemctl daemon-reload
		sudo systemctl enable irexec.service
		sudo systemctl start irexec.service

		echo "" | sudo tee $irexecrcfile 1> /dev/null
		for keyname in UP DOWN LEFT RIGHT BACK PLAYPAUSE MENU HOME OK MUTE VOLUMEUP VOLUMEDOWN
		do
			echo 'begin' | sudo tee -a $irexecrcfile 1> /dev/null
			echo '	remote=argon' | sudo tee -a $irexecrcfile 1> /dev/null
			echo '	prog=irexec' | sudo tee -a $irexecrcfile 1> /dev/null
			echo '	button=KEY_'$keyname | sudo tee -a $irexecrcfile 1> /dev/null
			echo '	config='$irexecshfile' "'$keyname'"' | sudo tee -a $irexecrcfile 1> /dev/null
			echo 'end' | sudo tee -a $irexecrcfile 1> /dev/null
		done


		echo "#!/bin/bash" | sudo tee $irexecshfile 1> /dev/null

		echo '' | sudo tee -a $irexecshfile 1> /dev/null
		echo 'if [ -z "$1" ]' | sudo tee -a $irexecshfile 1> /dev/null
		echo 'then' | sudo tee -a $irexecshfile 1> /dev/null
		echo '        exit' | sudo tee -a $irexecshfile 1> /dev/null
		echo 'fi' | sudo tee -a $irexecshfile 1> /dev/null

		echo '' | sudo tee -a $irexecshfile 1> /dev/null

		echo '# Handlers for different key codes' | sudo tee -a $irexecshfile 1> /dev/null
		echo '# Key codes: UP DOWN LEFT RIGHT BACK PLAYPAUSE MENU HOME OK MUTE VOLUMEUP VOLUMEDOWN' | sudo tee -a $irexecshfile 1> /dev/null
		echo '' | sudo tee -a $irexecshfile 1> /dev/null

		echo 'amixerdevice=$(/usr/bin/amixer scontrols | sed -n "s/^.*'"'\(.*\)'"'.*$/\1/p")' | sudo tee -a $irexecshfile 1> /dev/null
		echo 'if [ $1 == "VOLUMEUP" ]' | sudo tee -a $irexecshfile 1> /dev/null
		echo 'then' | sudo tee -a $irexecshfile 1> /dev/null
		echo '        /usr/bin/amixer set $amixerdevice -- $[$(/usr/bin/amixer get $amixerdevice|grep -o [0-9]*%|sed '"'s/%//'"')+5]%' | sudo tee -a $irexecshfile 1> /dev/null
		echo 'elif [ $1 == "VOLUMEDOWN" ]' | sudo tee -a $irexecshfile 1> /dev/null
		echo 'then' | sudo tee -a $irexecshfile 1> /dev/null
		echo '        /usr/bin/amixer set $amixerdevice -- $[$(/usr/bin/amixer get $amixerdevice|grep -o [0-9]*%|sed '"'s/%//'"')-5]%' | sudo tee -a $irexecshfile 1> /dev/null
		echo 'elif [ $1 == "MUTE" ]' | sudo tee -a $irexecshfile 1> /dev/null
		echo 'then' | sudo tee -a $irexecshfile 1> /dev/null
		echo '        /usr/bin/amixer set $amixerdevice toggle' | sudo tee -a $irexecshfile 1> /dev/null
		echo 'fi' | sudo tee -a $irexecshfile 1> /dev/null

		echo '' | sudo tee -a $irexecshfile 1> /dev/null

		sudo chmod 755 $irexecshfile
	fi	
fi

if [ ! -f "$irdecodefile" ]
then
	sudo wget https://download.argon40.com/argonone-irdecoder.py -O $irdecodefile --quiet
fi

sudo python3 $irdecodefile $remotemode

if [ ! -d $kodiuserdatafolder ]
then
	if [ ! -d "$HOME/.kodi" ]
	then
		mkdir "$HOME/.kodi"
	fi
	mkdir $kodiuserdatafolder
fi

if [ -d $kodiuserdatafolder ]
then
	echo "<lircmap>" | tee $kodilircmapfile 1> /dev/null
	echo '    <remote device="argon">' | tee -a $kodilircmapfile 1> /dev/null
	echo '        <left>KEY_LEFT</left>' | tee -a $kodilircmapfile 1> /dev/null
	echo '        <right>KEY_RIGHT</right>' | tee -a $kodilircmapfile 1> /dev/null
	echo '        <up>KEY_UP</up>' | tee -a $kodilircmapfile 1> /dev/null
	echo '        <down>KEY_DOWN</down>' | tee -a $kodilircmapfile 1> /dev/null
	echo '        <select>KEY_OK</select>' | tee -a $kodilircmapfile 1> /dev/null
	echo '        <start>KEY_HOME</start>' | tee -a $kodilircmapfile 1> /dev/null
	echo '        <rootmenu>KEY_MENUBACK</rootmenu>' | tee -a $kodilircmapfile 1> /dev/null
	echo '        <volumeplus>KEY_VOLUMEUP</volumeplus>' | tee -a $kodilircmapfile 1> /dev/null
	echo '        <volumeminus>KEY_VOLUMEDOWN</volumeminus>' | tee -a $kodilircmapfile 1> /dev/null
	echo '    </remote>' | tee -a $kodilircmapfile 1> /dev/null
	echo '</lircmap>' | tee -a $kodilircmapfile 1> /dev/null
fi

echo
echo "Thank you."
if [ $needrestart -eq 1 ]
then
	echo "Changes should take after reboot."
elif [ $needinstallation -eq 1 ]
then
	sudo systemctl restart lircd.service
	sudo systemctl restart irexec.service
fi
