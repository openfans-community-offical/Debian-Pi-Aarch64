#!/bin/bash


argon_create_file() {
	if [ -f $1 ]; then
        rm $1
    fi
	touch $1
	chmod 666 $1
}

daemonname="argononed"
powerbuttonscript=/storage/.config/$daemonname.py
shutdownscript="/storage/.config/"$daemonname"-poweroff.py"
daemonconfigfile=/storage/$daemonname.conf
configscript=/storage/argonone-config
removescript=/storage/argonone-uninstall
daemonfanservice=/storage/.config/system.d/$daemonname.service

argononeshutdownscript="/storage/.config/shutdown.sh"



PIINFO=$(cat /flash/config.txt | grep 'dtparam=i2c=on')
if [ -z "$PIINFO" ]
then
	mount -o remount,rw /flash
	echo "dtparam=i2c=on" >> /flash/config.txt
	echo "enable_uart=1" >> /flash/config.txt
	mount -o remount,ro /flash
fi
	
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
	echo '# systemctl restart '$daemonname'.service' >> $daemonconfigfile
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
echo "sys.path.append('/storage/.kodi/addons/virtual.system-tools/lib')" >> $shutdownscript
echo 'import smbus' >> $shutdownscript
echo "sys.path.append('/storage/.kodi/addons/virtual.rpi-tools/lib')" >> $shutdownscript
echo 'import RPi.GPIO as GPIO' >> $shutdownscript
echo 'rev = GPIO.RPI_REVISION' >> $shutdownscript
echo 'if rev == 2 or rev == 3:' >> $shutdownscript
echo '	bus = smbus.SMBus(1)' >> $shutdownscript
echo 'else:' >> $shutdownscript
echo '	bus = smbus.SMBus(0)' >> $shutdownscript

echo "try:"  >> $shutdownscript
echo "	bus.write_byte(0x1a,0)"  >> $shutdownscript
echo "	bus.write_byte(0x1a,0xFF)"  >> $shutdownscript
echo "except:"  >> $shutdownscript
echo "	rev=0"  >> $shutdownscript
chmod 755 $shutdownscript

# Generate script to monitor shutdown button

argon_create_file $powerbuttonscript

echo "#!/usr/bin/python" >> $powerbuttonscript
echo 'import sys' >> $powerbuttonscript
echo "sys.path.append('/storage/.kodi/addons/virtual.system-tools/lib')" >> $powerbuttonscript
echo 'import smbus' >> $powerbuttonscript
echo "sys.path.append('/storage/.kodi/addons/virtual.rpi-tools/lib')" >> $powerbuttonscript
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
echo "			os.system('kodi-send --action=\"ShutDown()\"')" >> $powerbuttonscript
#echo '			os.system("shutdown now -h")' >> $powerbuttonscript

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
echo "[Unit]" >> $daemonfanservice
echo "Description=Argon One Fan and Button Service" >> $daemonfanservice
echo "After=multi-user.target" >> $daemonfanservice
echo '[Service]' >> $daemonfanservice
echo 'Type=simple' >> $daemonfanservice
echo "Restart=always" >> $daemonfanservice
echo "RemainAfterExit=true" >> $daemonfanservice
echo "ExecStart=/usr/bin/python $powerbuttonscript" >> $daemonfanservice
echo '[Install]' >> $daemonfanservice
echo "WantedBy=multi-user.target" >> $daemonfanservice

chmod 644 $daemonfanservice

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
echo 'if [ -f '$powerbuttonscript' ]; then' >> $removescript
echo '	systemctl stop '$daemonname'.service' >> $removescript
echo '	systemctl disable '$daemonname'.service' >> $removescript
echo '	rm '$powerbuttonscript >> $removescript
echo '	rm '$shutdownscript >> $removescript
echo '	rm '$removescript >> $removescript
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


echo 'echo -n "Press Y if you want the fan to be always on:"' >> $configscript
echo 'read -n 1 confirm' >> $configscript
echo 'echo' >> $configscript
echo 'if [ "$confirm" = "y" ]' >> $configscript
echo 'then' >> $configscript
echo '	confirm="Y"' >> $configscript
echo 'fi' >> $configscript
echo '' >> $configscript
echo 'echo "#" > $daemonconfigfile' >> $configscript
echo 'echo "# Argon One Fan Speed Configuration" >> $daemonconfigfile' >> $configscript
echo 'echo "#" >> $daemonconfigfile' >> $configscript
echo 'echo "# Min Temp=Fan Speed" >> $daemonconfigfile' >> $configscript

echo 'if [ "$confirm" != "Y" ]' >> $configscript
echo 'then' >> $configscript
echo '	echo 90"="100 >> $daemonconfigfile' >> $configscript
echo '	echo "Fan off."' >> $configscript
echo 'else' >> $configscript
echo '	echo 1"="100 >> $daemonconfigfile' >> $configscript
echo '	echo "Fan always on."' >> $configscript
echo 'fi' >> $configscript
echo 'systemctl restart '$daemonname'.service' >> $configscript

chmod 755 $configscript

needsshutdownedit=0
if [ -f $argononeshutdownscript ]; then
	needsshutdownedit=1
	echo '# Kindly add the following lines under the "halt" and "poweroff" (remove "#" from the start)' >> $argononeshutdownscript
	echo '#    /usr/bin/python '$shutdownscript >> $argononeshutdownscript
else
	argon_create_file $argononeshutdownscript
	# Shutdown Script
	echo '#!/bin/bash' >> $argononeshutdownscript
	echo 'case "$1" in' >> $argononeshutdownscript
	echo '  halt)' >> $argononeshutdownscript
	echo '    /usr/bin/python '$shutdownscript >> $argononeshutdownscript
	echo '    ;;' >> $argononeshutdownscript
	echo '  poweroff)' >> $argononeshutdownscript
	echo '    /usr/bin/python '$shutdownscript >> $argononeshutdownscript
	echo '    ;;' >> $argononeshutdownscript
	echo '  reboot)' >> $argononeshutdownscript
	echo '    #' >> $argononeshutdownscript
	echo '    ;;' >> $argononeshutdownscript
	echo '  *)' >> $argononeshutdownscript
	echo '    # your commands here' >> $argononeshutdownscript
	echo '    ;;' >> $argononeshutdownscript
	echo 'esac' >> $argononeshutdownscript

	chmod 755 $argononeshutdownscript
fi



systemctl daemon-reload
systemctl enable $daemonname.service
systemctl start $daemonname.service

echo "***************************"
echo "Argon One Setup Completed."
echo "***************************"
if [ $needsshutdownedit -gt 0 ]
then
	nano $argononeshutdownscript
fi
echo "Changes take effect upon restart"
