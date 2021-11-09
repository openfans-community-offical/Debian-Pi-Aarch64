#!/bin/bash


argon_create_file() {
	if [ -f $1 ]; then
		sudo rm $1
	fi
	sudo touch $1
	sudo chmod 666 $1
}
argon_check_pkg() {
	RESULT=$(dpkg-query -W -f='${Status}\n' "$1" 2> /dev/null | grep "installed")

	if [ "" == "$RESULT" ]; then
		echo "NG"
	else
		echo "OK"
	fi
}

CHECKPLATFORM="Others"
# Check if Raspbian, otherwise Ubuntu
grep -q -F 'Raspbian' /etc/os-release &> /dev/null
if [ $? -eq 0 ]
then
	CHECKPLATFORM="Raspbian"
	pkglist=(raspi-gpio python3-rpi.gpio python3-smbus i2c-tools)	
else
	# Ubuntu has serial and i2c enabled
	pkglist=(python3-rpi.gpio python3-smbus i2c-tools)
fi

for curpkg in ${pkglist[@]}; do
	sudo apt-get install -y $curpkg
	RESULT=$(argon_check_pkg "$curpkg")
	if [ "NG" == "$RESULT" ]
	then
		echo "********************************************************************"
		echo "Please also connect device to the internet and restart installation."
		echo "********************************************************************"
		exit
	fi
done

# Ubuntu Mate for RPi has raspi-config too
command -v raspi-config &> /dev/null
if [ $? -eq 0 ]
then
	sudo raspi-config nonint do_i2c 0
	sudo raspi-config nonint do_serial 0
fi

daemonname="argononed"
powerbuttonscript=/usr/bin/$daemonname.py
shutdownscript="/lib/systemd/system-shutdown/"$daemonname"-poweroff.py"
daemonconfigfile=/etc/$daemonname.conf
configscript=/usr/bin/argonone-config
removescript=/usr/bin/argonone-uninstall

daemonfanservice=/lib/systemd/system/$daemonname.service
	
if [ ! -f $daemonconfigfile ]; then
	# Generate config file for fan speed
	sudo touch $daemonconfigfile
	sudo chmod 666 $daemonconfigfile
	echo '#' >> $daemonconfigfile
	echo '# Argon One Fan Configuration' >> $daemonconfigfile
	echo '#' >> $daemonconfigfile
	echo '# List below the temperature (Celsius) and fan speed (in percent) pairs' >> $daemonconfigfile
	echo '# Use the following form:' >> $daemonconfigfile
	echo '# min.temperature=speed' >> $daemonconfigfile
	echo '#' >> $daemonconfigfile
	echo '# Example:' >> $daemonconfigfile
	echo '# 55=10' >> $daemonconfigfile
	echo '# 60=55' >> $daemonconfigfile
	echo '# 65=100' >> $daemonconfigfile
	echo '#' >> $daemonconfigfile
	echo '# Above example sets the fan speed to' >> $daemonconfigfile
	echo '#' >> $daemonconfigfile
	echo '# NOTE: Lines begining with # are ignored' >> $daemonconfigfile
	echo '#' >> $daemonconfigfile
	echo '# Type the following at the command line for changes to take effect:' >> $daemonconfigfile
	echo '# sudo systemctl restart '$daemonname'.service' >> $daemonconfigfile
	echo '#' >> $daemonconfigfile
	echo '# Start below:' >> $daemonconfigfile
	echo '55=10' >> $daemonconfigfile
	echo '60=55' >> $daemonconfigfile
	echo '65=100' >> $daemonconfigfile
fi

# Generate script that runs every shutdown event
argon_create_file $shutdownscript

echo "#!/usr/bin/python3" >> $shutdownscript
echo 'import sys' >> $shutdownscript
echo 'import smbus' >> $shutdownscript
echo 'import RPi.GPIO as GPIO' >> $shutdownscript
echo 'rev = GPIO.RPI_REVISION' >> $shutdownscript
echo 'if rev == 2 or rev == 3:' >> $shutdownscript
echo '	bus = smbus.SMBus(1)' >> $shutdownscript
echo 'else:' >> $shutdownscript
echo '	bus = smbus.SMBus(0)' >> $shutdownscript

echo 'if len(sys.argv)>1:' >> $shutdownscript
echo "	bus.write_byte(0x1a,0)"  >> $shutdownscript

# powercut signal
echo '	if sys.argv[1] == "poweroff" or sys.argv[1] == "halt":'  >> $shutdownscript
echo "		try:"  >> $shutdownscript
echo "			bus.write_byte(0x1a,0xFF)"  >> $shutdownscript
echo "		except:"  >> $shutdownscript
echo "			rev=0"  >> $shutdownscript

sudo chmod 755 $shutdownscript

# Generate script to monitor shutdown button

argon_create_file $powerbuttonscript

echo "#!/usr/bin/python3" >> $powerbuttonscript
echo 'import smbus' >> $powerbuttonscript
echo 'import RPi.GPIO as GPIO' >> $powerbuttonscript
echo 'import os' >> $powerbuttonscript
echo 'import time' >> $powerbuttonscript
echo 'from threading import Thread' >> $powerbuttonscript
echo 'rev = GPIO.RPI_REVISION' >> $powerbuttonscript
echo 'if rev == 2 or rev == 3:' >> $powerbuttonscript
echo '	bus = smbus.SMBus(1)' >> $powerbuttonscript
echo 'else:' >> $powerbuttonscript
echo '	bus = smbus.SMBus(0)' >> $powerbuttonscript

echo 'GPIO.setwarnings(False)' >> $powerbuttonscript
echo 'GPIO.setmode(GPIO.BCM)' >> $powerbuttonscript
echo 'shutdown_pin=4' >> $powerbuttonscript
echo 'GPIO.setup(shutdown_pin, GPIO.IN,  pull_up_down=GPIO.PUD_DOWN)' >> $powerbuttonscript

echo 'def shutdown_check():' >> $powerbuttonscript
echo '	while True:' >> $powerbuttonscript
echo '		pulsetime = 1' >> $powerbuttonscript
echo '		GPIO.wait_for_edge(shutdown_pin, GPIO.RISING)' >> $powerbuttonscript
echo '		time.sleep(0.01)' >> $powerbuttonscript
echo '		while GPIO.input(shutdown_pin) == GPIO.HIGH:' >> $powerbuttonscript
echo '			time.sleep(0.01)' >> $powerbuttonscript
echo '			pulsetime += 1' >> $powerbuttonscript
echo '		if pulsetime >=2 and pulsetime <=3:' >> $powerbuttonscript
echo '			os.system("reboot")' >> $powerbuttonscript
echo '		elif pulsetime >=4 and pulsetime <=5:' >> $powerbuttonscript
echo '			os.system("shutdown now -h")' >> $powerbuttonscript

echo 'def get_fanspeed(tempval, configlist):' >> $powerbuttonscript
echo '	for curconfig in configlist:' >> $powerbuttonscript
echo '		curpair = curconfig.split("=")' >> $powerbuttonscript
echo '		tempcfg = float(curpair[0])' >> $powerbuttonscript
echo '		fancfg = int(float(curpair[1]))' >> $powerbuttonscript
echo '		if tempval >= tempcfg:' >> $powerbuttonscript
echo '			return fancfg' >> $powerbuttonscript
echo '	return 0' >> $powerbuttonscript

echo 'def load_config(fname):' >> $powerbuttonscript
echo '	newconfig = []' >> $powerbuttonscript
echo '	try:' >> $powerbuttonscript
echo '		with open(fname, "r") as fp:' >> $powerbuttonscript
echo '			for curline in fp:' >> $powerbuttonscript
echo '				if not curline:' >> $powerbuttonscript
echo '					continue' >> $powerbuttonscript
echo '				tmpline = curline.strip()' >> $powerbuttonscript
echo '				if not tmpline:' >> $powerbuttonscript
echo '					continue' >> $powerbuttonscript
echo '				if tmpline[0] == "#":' >> $powerbuttonscript
echo '					continue' >> $powerbuttonscript
echo '				tmppair = tmpline.split("=")' >> $powerbuttonscript
echo '				if len(tmppair) != 2:' >> $powerbuttonscript
echo '					continue' >> $powerbuttonscript
echo '				tempval = 0' >> $powerbuttonscript
echo '				fanval = 0' >> $powerbuttonscript
echo '				try:' >> $powerbuttonscript
echo '					tempval = float(tmppair[0])' >> $powerbuttonscript
echo '					if tempval < 0 or tempval > 100:' >> $powerbuttonscript
echo '						continue' >> $powerbuttonscript
echo '				except:' >> $powerbuttonscript
echo '					continue' >> $powerbuttonscript
echo '				try:' >> $powerbuttonscript
echo '					fanval = int(float(tmppair[1]))' >> $powerbuttonscript
echo '					if fanval < 0 or fanval > 100:' >> $powerbuttonscript
echo '						continue' >> $powerbuttonscript
echo '				except:' >> $powerbuttonscript
echo '					continue' >> $powerbuttonscript
echo '				newconfig.append( "{:5.1f}={}".format(tempval,fanval))' >> $powerbuttonscript
echo '		if len(newconfig) > 0:' >> $powerbuttonscript
echo '			newconfig.sort(reverse=True)' >> $powerbuttonscript
echo '	except:' >> $powerbuttonscript
echo '		return []' >> $powerbuttonscript
echo '	return newconfig' >> $powerbuttonscript

echo 'def temp_check():' >> $powerbuttonscript
echo '	fanconfig = ["65=100", "60=55", "55=10"]' >> $powerbuttonscript
echo '	tmpconfig = load_config("'$daemonconfigfile'")' >> $powerbuttonscript
echo '	if len(tmpconfig) > 0:' >> $powerbuttonscript
echo '		fanconfig = tmpconfig' >> $powerbuttonscript
echo '	address=0x1a' >> $powerbuttonscript
echo '	prevblock=0' >> $powerbuttonscript
echo '	while True:' >> $powerbuttonscript

echo '		try:' >> $powerbuttonscript
echo '			tempfp = open("/sys/class/thermal/thermal_zone0/temp", "r")' >> $powerbuttonscript
echo '			temp = tempfp.readline()' >> $powerbuttonscript
echo '			tempfp.close()' >> $powerbuttonscript
echo '			val = float(int(temp)/1000)' >> $powerbuttonscript
echo '		except IOError:' >> $powerbuttonscript
echo '			val = 0' >> $powerbuttonscript

echo '		block = get_fanspeed(val, fanconfig)' >> $powerbuttonscript
echo '		if block < prevblock:' >> $powerbuttonscript
echo '			time.sleep(30)' >> $powerbuttonscript
echo '		prevblock = block' >> $powerbuttonscript
echo '		try:' >> $powerbuttonscript
echo '			bus.write_byte(address,block)' >> $powerbuttonscript
echo '		except IOError:' >> $powerbuttonscript
echo '			temp=""' >> $powerbuttonscript
echo '		time.sleep(30)' >> $powerbuttonscript

echo 'try:' >> $powerbuttonscript
echo '	t1 = Thread(target = shutdown_check)' >> $powerbuttonscript
echo '	t2 = Thread(target = temp_check)' >> $powerbuttonscript
echo '	t1.start()' >> $powerbuttonscript
echo '	t2.start()' >> $powerbuttonscript
echo 'except:' >> $powerbuttonscript
echo '	t1.stop()' >> $powerbuttonscript
echo '	t2.stop()' >> $powerbuttonscript
echo '	GPIO.cleanup()' >> $powerbuttonscript

sudo chmod 755 $powerbuttonscript

argon_create_file $daemonfanservice

# Fan Daemon
echo "[Unit]" >> $daemonfanservice
echo "Description=Argon One Fan and Button Service" >> $daemonfanservice
echo "After=multi-user.target" >> $daemonfanservice
echo '[Service]' >> $daemonfanservice
echo 'Type=simple' >> $daemonfanservice
echo "Restart=always" >> $daemonfanservice
echo "RemainAfterExit=true" >> $daemonfanservice
echo "ExecStart=/usr/bin/python3 $powerbuttonscript" >> $daemonfanservice
echo '[Install]' >> $daemonfanservice
echo "WantedBy=multi-user.target" >> $daemonfanservice

sudo chmod 644 $daemonfanservice

argon_create_file $removescript

# Uninstall Script
echo '#!/bin/bash' >> $removescript
echo 'echo "-------------------------"' >> $removescript
echo 'echo "Argon One Uninstall Tool"' >> $removescript
echo 'echo "-------------------------"' >> $removescript
echo 'echo -n "Press Y to continue:"' >> $removescript
echo 'read -n 1 confirm' >> $removescript
echo 'echo' >> $removescript
echo 'if [ "$confirm" = "y" ]' >> $removescript
echo 'then' >> $removescript
echo '	confirm="Y"' >> $removescript
echo 'fi' >> $removescript
echo '' >> $removescript
echo 'if [ "$confirm" != "Y" ]' >> $removescript
echo 'then' >> $removescript
echo '	echo "Cancelled"' >> $removescript
echo '	exit' >> $removescript
echo 'fi' >> $removescript
echo 'if [ -d "/home/pi/Desktop" ]; then' >> $removescript
echo '	sudo rm "/home/pi/Desktop/argonone-config.desktop"' >> $removescript
echo '	sudo rm "/home/pi/Desktop/argonone-uninstall.desktop"' >> $removescript
echo 'fi' >> $removescript
echo 'if [ -f '$powerbuttonscript' ]; then' >> $removescript
echo '	sudo systemctl stop '$daemonname'.service' >> $removescript
echo '	sudo systemctl disable '$daemonname'.service' >> $removescript
echo '	sudo /usr/bin/python3 '$shutdownscript' uninstall' >> $removescript
echo '	sudo rm '$powerbuttonscript >> $removescript
echo '	sudo rm '$shutdownscript >> $removescript
echo '	sudo rm '$removescript >> $removescript
echo '	echo "Removed Argon One Services."' >> $removescript
echo '	echo "Cleanup will complete after restarting the device."' >> $removescript
echo 'fi' >> $removescript

sudo chmod 755 $removescript

argon_create_file $configscript

# Config Script
echo '#!/bin/bash' >> $configscript
echo 'daemonconfigfile='$daemonconfigfile >> $configscript
echo 'echo "--------------------------------------"' >> $configscript
echo 'echo "Argon One Fan Speed Configuration Tool"' >> $configscript
echo 'echo "--------------------------------------"' >> $configscript
echo 'echo "WARNING: This will remove existing configuration."' >> $configscript
echo 'echo -n "Press Y to continue:"' >> $configscript
echo 'read -n 1 confirm' >> $configscript
echo 'echo' >> $configscript
echo 'if [ "$confirm" = "y" ]' >> $configscript
echo 'then' >> $configscript
echo '	confirm="Y"' >> $configscript
echo 'fi' >> $configscript
echo '' >> $configscript
echo 'if [ "$confirm" != "Y" ]' >> $configscript
echo 'then' >> $configscript
echo '	echo "Cancelled"' >> $configscript
echo '	exit' >> $configscript
echo 'fi' >> $configscript
echo 'echo "Thank you."' >> $configscript

echo 'get_number () {' >> $configscript
echo '	read curnumber' >> $configscript
echo '	re="^[0-9]+$"' >> $configscript
echo '	if [ -z "$curnumber" ]' >> $configscript
echo '	then' >> $configscript
echo '		echo "-2"' >> $configscript
echo '		return' >> $configscript
echo '	elif [[ $curnumber =~ ^[+-]?[0-9]+$ ]]' >> $configscript
echo '	then' >> $configscript
echo '		if [ $curnumber -lt 0 ]' >> $configscript
echo '		then' >> $configscript
echo '			echo "-1"' >> $configscript
echo '			return' >> $configscript
echo '		elif [ $curnumber -gt 100 ]' >> $configscript
echo '		then' >> $configscript
echo '			echo "-1"' >> $configscript
echo '			return' >> $configscript
echo '		fi	' >> $configscript
echo '		echo $curnumber' >> $configscript
echo '		return' >> $configscript
echo '	fi' >> $configscript
echo '	echo "-1"' >> $configscript
echo '	return' >> $configscript
echo '}' >> $configscript
echo '' >> $configscript

echo 'loopflag=1' >> $configscript
echo 'while [ $loopflag -eq 1 ]' >> $configscript
echo 'do' >> $configscript
echo '	echo' >> $configscript
echo '	echo "Select fan mode:"' >> $configscript
echo '	echo "  1. Always on"' >> $configscript
echo '	echo "  2. Adjust to temperatures (55C, 60C, and 65C)"' >> $configscript
echo '	echo "  3. Customize behavior"' >> $configscript
echo '	echo "  4. Cancel"' >> $configscript
echo '	echo "NOTE: You can also edit $daemonconfigfile directly"' >> $configscript
echo '	echo -n "Enter Number (1-4):"' >> $configscript
echo '	newmode=$( get_number )' >> $configscript
echo '	if [[ $newmode -ge 1 && $newmode -le 4 ]]' >> $configscript
echo '	then' >> $configscript
echo '		loopflag=0' >> $configscript
echo '	fi' >> $configscript
echo 'done' >> $configscript

echo 'echo' >> $configscript
echo 'if [ $newmode -eq 4 ]' >> $configscript
echo 'then' >> $configscript
echo '	echo "Cancelled"' >> $configscript
echo '	exit' >> $configscript
echo 'elif [ $newmode -eq 1 ]' >> $configscript
echo 'then' >> $configscript
echo '	echo "#" > $daemonconfigfile' >> $configscript
echo '	echo "# Argon One Fan Speed Configuration" >> $daemonconfigfile' >> $configscript
echo '	echo "#" >> $daemonconfigfile' >> $configscript
echo '	echo "# Min Temp=Fan Speed" >> $daemonconfigfile' >> $configscript
echo '	echo 1"="100 >> $daemonconfigfile' >> $configscript
echo '	sudo systemctl restart '$daemonname'.service' >> $configscript
echo '	echo "Fan always on."' >> $configscript
echo '	exit' >> $configscript
echo 'elif [ $newmode -eq 2 ]' >> $configscript
echo 'then' >> $configscript
echo '	echo "Please provide fan speeds for the following temperatures:"' >> $configscript
echo '	echo "#" > $daemonconfigfile' >> $configscript
echo '	echo "# Argon One Fan Speed Configuration" >> $daemonconfigfile' >> $configscript
echo '	echo "#" >> $daemonconfigfile' >> $configscript
echo '	echo "# Min Temp=Fan Speed" >> $daemonconfigfile' >> $configscript
echo '	curtemp=55' >> $configscript
echo '	while [ $curtemp -lt 70 ]' >> $configscript
echo '	do' >> $configscript
echo '		errorfanflag=1' >> $configscript
echo '		while [ $errorfanflag -eq 1 ]' >> $configscript
echo '		do' >> $configscript
echo '			echo -n ""$curtemp"C (0-100 only):"' >> $configscript
echo '			curfan=$( get_number )' >> $configscript
echo '			if [ $curfan -ge 0 ]' >> $configscript
echo '			then' >> $configscript
echo '				errorfanflag=0' >> $configscript
echo '			fi' >> $configscript
echo '		done' >> $configscript
echo '		echo $curtemp"="$curfan >> $daemonconfigfile' >> $configscript
echo '		curtemp=$((curtemp+5))' >> $configscript
echo '	done' >> $configscript

echo '	sudo systemctl restart '$daemonname'.service' >> $configscript
echo '	echo "Configuration updated."' >> $configscript
echo '	exit' >> $configscript
echo 'fi' >> $configscript

echo 'echo "Please provide fan speeds and temperature pairs"' >> $configscript
echo 'echo' >> $configscript

echo 'loopflag=1' >> $configscript
echo 'paircounter=0' >> $configscript
echo 'while [ $loopflag -eq 1 ]' >> $configscript
echo 'do' >> $configscript
echo '	errortempflag=1' >> $configscript
echo '	errorfanflag=1' >> $configscript
echo '	while [ $errortempflag -eq 1 ]' >> $configscript
echo '	do' >> $configscript
echo '		echo -n "Provide minimum temperature (in Celsius) then [ENTER]:"' >> $configscript
echo '		curtemp=$( get_number )' >> $configscript
echo '		if [ $curtemp -ge 0 ]' >> $configscript
echo '		then' >> $configscript
echo '			errortempflag=0' >> $configscript
echo '		elif [ $curtemp -eq -2 ]' >> $configscript
echo '		then' >> $configscript
echo '			errortempflag=0' >> $configscript
echo '			errorfanflag=0' >> $configscript
echo '			loopflag=0' >> $configscript
echo '		fi' >> $configscript
echo '	done' >> $configscript
echo '	while [ $errorfanflag -eq 1 ]' >> $configscript
echo '	do' >> $configscript
echo '		echo -n "Provide fan speed for "$curtemp"C (0-100) then [ENTER]:"' >> $configscript
echo '		curfan=$( get_number )' >> $configscript
echo '		if [ $curfan -ge 0 ]' >> $configscript
echo '		then' >> $configscript
echo '			errorfanflag=0' >> $configscript
echo '		elif [ $curfan -eq -2 ]' >> $configscript
echo '		then' >> $configscript
echo '			errortempflag=0' >> $configscript
echo '			errorfanflag=0' >> $configscript
echo '			loopflag=0' >> $configscript
echo '		fi' >> $configscript
echo '	done' >> $configscript
echo '	if [ $loopflag -eq 1 ]' >> $configscript
echo '	then' >> $configscript
echo '		if [ $paircounter -eq 0 ]' >> $configscript
echo '		then' >> $configscript
echo '			echo "#" > $daemonconfigfile' >> $configscript
echo '			echo "# Argon One Fan Speed Configuration" >> $daemonconfigfile' >> $configscript
echo '			echo "#" >> $daemonconfigfile' >> $configscript
echo '			echo "# Min Temp=Fan Speed" >> $daemonconfigfile' >> $configscript
echo '		fi' >> $configscript
echo '		echo $curtemp"="$curfan >> $daemonconfigfile' >> $configscript
echo '		' >> $configscript
echo '		paircounter=$((paircounter+1))' >> $configscript
echo '		' >> $configscript
echo '		echo "* Fan speed will be set to "$curfan" once temperature reaches "$curtemp" C"' >> $configscript
echo '		echo' >> $configscript
echo '	fi' >> $configscript
echo 'done' >> $configscript
echo '' >> $configscript
echo 'echo' >> $configscript
echo 'if [ $paircounter -gt 0 ]' >> $configscript
echo 'then' >> $configscript
echo '	echo "Thank you!  We saved "$paircounter" pairs."' >> $configscript
echo '	sudo systemctl restart '$daemonname'.service' >> $configscript
echo '	echo "Changes should take effect now."' >> $configscript
echo 'else' >> $configscript
echo '	echo "Cancelled, no data saved."' >> $configscript
echo 'fi' >> $configscript

sudo chmod 755 $configscript


sudo systemctl daemon-reload
sudo systemctl enable $daemonname.service

sudo systemctl start $daemonname.service


shortcutfile="/home/pi/Desktop/argonone-config.desktop"
if [ "$CHECKPLATFORM" = "Raspbian" ] && [ -d "/home/pi/Desktop" ]
then
	sudo wget http://download.argon40.com/ar1config.png -O /usr/share/pixmaps/ar1config.png --quiet
	sudo wget http://download.argon40.com/ar1uninstall.png -O /usr/share/pixmaps/ar1uninstall.png --quiet
	# Create Shortcuts
	echo "[Desktop Entry]" > $shortcutfile
	echo "Name=Argon One Configuration" >> $shortcutfile
	echo "Comment=Argon One Configuration" >> $shortcutfile
	echo "Icon=/usr/share/pixmaps/ar1config.png" >> $shortcutfile
	echo 'Exec=lxterminal -t "Argon One Configuration" --working-directory=/home/pi/ -e '$configscript >> $shortcutfile
	echo "Type=Application" >> $shortcutfile
	echo "Encoding=UTF-8" >> $shortcutfile
	echo "Terminal=false" >> $shortcutfile
	echo "Categories=None;" >> $shortcutfile
	chmod 755 $shortcutfile
	
	shortcutfile="/home/pi/Desktop/argonone-uninstall.desktop"
	echo "[Desktop Entry]" > $shortcutfile
	echo "Name=Argon One Uninstall" >> $shortcutfile
	echo "Comment=Argon One Uninstall" >> $shortcutfile
	echo "Icon=/usr/share/pixmaps/ar1uninstall.png" >> $shortcutfile
	echo 'Exec=lxterminal -t "Argon One Uninstall" --working-directory=/home/pi/ -e '$removescript >> $shortcutfile
	echo "Type=Application" >> $shortcutfile
	echo "Encoding=UTF-8" >> $shortcutfile
	echo "Terminal=false" >> $shortcutfile
	echo "Categories=None;" >> $shortcutfile
	chmod 755 $shortcutfile
fi

# IR config script
sudo wget https://download.argon40.com/argonone-irconfig.sh -O /usr/bin/argonone-ir --quiet
sudo chmod 755 /usr/bin/argonone-ir

echo "***************************"
echo "Argon One Setup Completed."
echo "***************************"
echo
if [ ! "$CHECKPLATFORM" = "Raspbian" ]
then
		echo "You may need to reboot for changes to take effect"
		echo
fi 
if [ -f $shortcutfile ]; then
	echo Shortcuts created in your desktop.
else
	echo Use 'argonone-config' to configure fan
	echo Use 'argonone-uninstall' to uninstall
fi
echo
