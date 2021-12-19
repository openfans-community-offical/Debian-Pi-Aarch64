#!/bin/bash



argon_create_file() {
	if [ -f $1 ]; then
        rm $1
    fi
	touch $1
	chmod 666 $1
}

daemonname="argononed"
powerbuttonscript=/recalbox/scripts/argonone/$daemonname.py
shutdownscript="/recalbox/scripts/argonone/"$daemonname"-poweroff.py"
daemonconfigfile=/recalbox/share/system/$daemonname.conf
configscript=/usr/bin/argonone-config
removescript=/usr/bin/argonone-uninstall

daemonfanservice=/etc/init.d/S99$daemonname

# Read Write
mount -o remount,rw /
mount -o remount,rw /boot

# Enable i2c
grep -q -F 'i2c-bcm2708' /etc/modules.conf || echo 'i2c-bcm2708' >> /etc/modules.conf
grep -q -F 'i2c-dev' /etc/modules.conf || echo 'i2c-dev' >> /etc/modules.conf
grep -q -F 'dtparam=i2c_arm=on' /boot/config.txt || echo 'dtparam=i2c_arm=on' >> /boot/config.txt
grep -q -F 'enable_uart=1' /boot/config.txt || echo 'enable_uart=1' >> /boot/config.txt
#grep -q -F 'bcm2708.vc_i2c_override=1' /boot/cmdline.txt || sed -i ' 1 s/.*/& bcm2708.vc_i2c_override=1/' /boot/cmdline.txt

mkdir /recalbox/scripts/argonone/
chmod 755 /recalbox/scripts/argonone/

	
if [ ! -f $daemonconfigfile ]; then
	# Generate config file for fan speed
	touch $daemonconfigfile
	chmod 666 $daemonconfigfile
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
	echo '# '$daemonfanservice' restart' >> $daemonconfigfile
	echo '#' >> $daemonconfigfile
	echo '# Start below:' >> $daemonconfigfile
	echo '55=10' >> $daemonconfigfile
	echo '60=55' >> $daemonconfigfile
	echo '65=100' >> $daemonconfigfile
fi

# Generate script that runs every shutdown event
argon_create_file $shutdownscript

echo "#!/usr/bin/python" >> $shutdownscript
echo 'import sys' >> $shutdownscript
echo 'import os' >> $shutdownscript
echo 'import smbus' >> $shutdownscript
echo 'import RPi.GPIO as GPIO' >> $shutdownscript
echo 'rev = GPIO.RPI_REVISION' >> $shutdownscript

echo 'if rev == 2 or rev == 3:' >> $shutdownscript
echo '	bus = smbus.SMBus(1)' >> $shutdownscript
echo 'else:' >> $shutdownscript
echo '	bus = smbus.SMBus(0)' >> $shutdownscript

echo 'if len(sys.argv)>1:' >> $shutdownscript
echo "	bus.write_byte(0x1a,0)"  >> $shutdownscript
echo '	if sys.argv[1] == "poweroff" or sys.argv[1] == "halt":'  >> $shutdownscript
echo "		try:"  >> $shutdownscript
echo "			bus.write_byte(0x1a,0xFF)"  >> $shutdownscript
echo "		except:"  >> $shutdownscript
echo "			rev=0"  >> $shutdownscript
chmod 755 $shutdownscript

# Generate script to monitor shutdown button

argon_create_file $powerbuttonscript

echo "#!/usr/bin/python" >> $powerbuttonscript
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
echo '		temp = os.popen("vcgencmd measure_temp").readline()' >> $powerbuttonscript
echo '		temp = temp.replace("temp=","")' >> $powerbuttonscript
echo '		val = float(temp.replace("'"'"'C",""))' >> $powerbuttonscript
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

chmod 755 $powerbuttonscript

argon_create_file $daemonfanservice

# Fan Daemon
echo '#!/bin/bash' >> $daemonfanservice
echo '### BEGIN INIT INFO' >> $daemonfanservice
echo '# Provides: argononed.py & argononed-poweroff.py' >> $daemonfanservice
echo '# Default-Start: 2 3 4 5' >> $daemonfanservice
echo '# Default-Stop: 0 1 6' >> $daemonfanservice
echo '# Short-Description: Argon One Fan Service.' >> $daemonfanservice
echo '# Description: Starts and stops service.' >> $daemonfanservice
echo '### END INIT INFO' >> $daemonfanservice
echo '' >> $daemonfanservice
echo '#VAR' >> $daemonfanservice
echo 'RUN="'$powerbuttonscript'"' >> $daemonfanservice
echo 'RUNSTOP="'$shutdownscript'"' >> $daemonfanservice
echo 'BTD_PID=$(ps -eo pid,args | grep "/usr/bin/python $RUN" | grep -v grep | awk '"'"'{print $1}'"')" >> $daemonfanservice
echo '' >> $daemonfanservice
echo 'serviceStatus() {' >> $daemonfanservice
echo '   if [ ! -z "$BTD_PID" ]; then' >> $daemonfanservice
echo '      echo -e "$0 [RUNNING] '"['$BTD_PID']"'"' >> $daemonfanservice
echo '   else' >> $daemonfanservice
echo '      echo -e "$0 [NOT RUNNING]"' >> $daemonfanservice
echo '   fi' >> $daemonfanservice
echo '}' >> $daemonfanservice
echo '' >> $daemonfanservice
echo '# Carry out specific functions when asked to by the system' >> $daemonfanservice
echo 'case "$1" in' >> $daemonfanservice
echo '   start)' >> $daemonfanservice
echo '      echo -e "Starting script $RUN ..."' >> $daemonfanservice
echo '      if [ -z "$BTD_PID" ]; then' >> $daemonfanservice
echo '         nice -n 19 $RUN&' >> $daemonfanservice
echo '' >> $daemonfanservice
echo '         if [ $? -eq 0 ]; then' >> $daemonfanservice
echo '            echo -e "$0 [STARTED]"' >> $daemonfanservice
echo '         fi' >> $daemonfanservice
echo '      else' >> $daemonfanservice
echo '         echo -e "$0 [ALREADY STARTED] '"['$BTD_PID']"'!"' >> $daemonfanservice
echo '      fi' >> $daemonfanservice
echo '      #serviceStatus' >> $daemonfanservice
echo '   ;;' >> $daemonfanservice
echo '   stop)' >> $daemonfanservice
echo '      TMPVAL=$(/sbin/runlevel)' >> $daemonfanservice
echo '      if [ "$TMPVAL" == "3 6" ]; then' >> $daemonfanservice
echo '         $RUNSTOP reboot' >> $daemonfanservice
echo '      else' >> $daemonfanservice
echo '         $RUNSTOP halt' >> $daemonfanservice
echo '      fi' >> $daemonfanservice
echo '      #serviceStatus' >> $daemonfanservice
echo '   ;;' >> $daemonfanservice
echo '   status)' >> $daemonfanservice
echo '      serviceStatus' >> $daemonfanservice
echo '   ;;' >> $daemonfanservice
echo '   restart)' >> $daemonfanservice
echo '      echo -e "Restarting script $RUN ..."' >> $daemonfanservice
echo '        if [ ! -z "$BTD_PID" ]; then' >> $daemonfanservice
echo '           echo "Stopping script $RUN ..."' >> $daemonfanservice
echo '           kill $BTD_PID' >> $daemonfanservice
echo '           if [ $? -eq 0 ]; then' >> $daemonfanservice
echo '              echo -e "Starting script $RUN ..."' >> $daemonfanservice
echo '              nice -n 19 $RUN&' >> $daemonfanservice
echo '              echo -e "$0 [RESTARTED]"' >> $daemonfanservice
echo '           fi' >> $daemonfanservice
echo '        else' >> $daemonfanservice
echo '           echo -e "Script $RUN not running"' >> $daemonfanservice
echo '           echo -e "Starting script $RUN ..."' >> $daemonfanservice
echo '           nice -n 19 $RUN&' >> $daemonfanservice
echo '           if [ $? -eq 0 ]; then' >> $daemonfanservice
echo '              echo -e "$0 [RESTARTED]"' >> $daemonfanservice
echo '           fi' >> $daemonfanservice
echo '        fi' >> $daemonfanservice
echo '   ;;' >> $daemonfanservice
echo '   *)' >> $daemonfanservice
echo '      echo -e "Usage: $0 {start | stop | restart | status}"' >> $daemonfanservice
echo '      exit 1' >> $daemonfanservice
echo '   ;;' >> $daemonfanservice
echo 'esac' >> $daemonfanservice
echo '' >> $daemonfanservice
echo 'exit $?' >> $daemonfanservice

chmod 755 $daemonfanservice

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
echo '	rm "/home/pi/Desktop/argonone-config.desktop"' >> $removescript
echo '	rm "/home/pi/Desktop/argonone-uninstall.desktop"' >> $removescript
echo 'fi' >> $removescript
echo 'if [ -f '$powerbuttonscript' ]; then' >> $removescript
echo '  '$daemonfanservice' stop' >> $removescript
echo '	rm '$powerbuttonscript >> $removescript
echo '	rm '$shutdownscript >> $removescript
echo '	rm '$removescript >> $removescript
echo '	rm '$daemonfanservice >> $removescript
echo '	echo "Removed Argon One Services."' >> $removescript
echo '	echo "Cleanup will complete after restarting the device."' >> $removescript
echo 'fi' >> $removescript

chmod 755 $removescript

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
echo '	'$daemonfanservice' restart' >> $configscript
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

echo '	'$daemonfanservice' restart' >> $configscript
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
echo '	'$daemonfanservice' restart' >> $configscript
echo '	echo "Thank you!  We saved "$paircounter" pairs."' >> $configscript
echo '	echo "Changes should take effect now."' >> $configscript
echo 'else' >> $configscript
echo '	echo "Cancelled, no data saved."' >> $configscript
echo 'fi' >> $configscript

chmod 755 $configscript

$daemonfanservice start

mount -o remount,ro /
mount -o remount,ro /boot

echo "***************************"
echo "Argon One Setup Completed."
echo "***************************"
echo 
echo Use 'argonone-config' to configure fan
echo Use 'argonone-uninstall' to uninstall
echo