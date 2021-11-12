#!/usr/bin/python3

# Standard Headers
import sys
import smbus
import RPi.GPIO as GPIO

# For GPIO
from datetime import datetime

### For pip3 lirc
import os
import time

# Check if Lirc Lib is installed
import importlib
haslirclib = False
try:
	lirclib = importlib.util.find_spec("lirc")
	haslirclib = lirclib is not None
except:
	try:
		print("WARNING: Falling back to Deprecated module")
		lirclib = importlib.find_loader("lirc")
		haslirclib = lirclib is not None
	except:
		haslirclib = False

if haslirclib:
	import lirc

#########################
# Use GPIO
irreceiver_pin = 23     # IR Receiver Pin
GPIO.setmode(GPIO.BCM)
GPIO.setup(irreceiver_pin, GPIO.IN,  pull_up_down=GPIO.PUD_DOWN)

def getGPIOPulseData():
	# Counter
	ctr = 0

	try:
		# start at 0, wait for it if necessary
		value = GPIO.input(irreceiver_pin)
		if value:
			channel = GPIO.wait_for_edge(irreceiver_pin, GPIO.FALLING, timeout=PULSETIMEOUTMS);
			if channel is None:
				return [];
	except:
		# GPIO Error
		return [(-2, -2)]
	value = 0

	# mark time
	startTime = datetime.now()
	pulseTime = startTime

	# Pulse Data
	pulsedata = []

	aborted = False
	while aborted == False:
		# Wait for transition
		if value:
			channel = GPIO.wait_for_edge(irreceiver_pin, GPIO.FALLING, timeout=PULSETIMEOUTMS);
		else:
			channel = GPIO.wait_for_edge(irreceiver_pin, GPIO.RISING, timeout=PULSETIMEOUTMS);

		if channel is None:
			if ctr == 0:
				continue
			else:
				aborted = True
				if len(pulsedata) == 0:
					# CTRL+C
					return [(-1, -1)]
				break;

		# high/low Length
		now = datetime.now()
		pulseLength = now - pulseTime
		pulseTime = now

		# Update value (changed triggered), this also inverts value before saving
		if value:
			value = 0
		else:
			value = 1
		pulsedata.append((value, pulseLength.microseconds))

		ctr = ctr + 1
		if pulseLength.microseconds > PULSETAIL_MAXMICROS_NEC:
			break
		elif ctr > PULSEDATA_MAXCOUNT:
			break

	# Data is most likely incomplete
	if aborted == True:
		return []
	elif ctr >= PULSEDATA_MAXCOUNT:
		print ("    * Unable to decode. Please try again *")
		return []
	return pulsedata


#########################
# Use LIRC
lircmode=0
def getLIRCobj():
	try:
		# Old method
		return lirc.Lirc()
	except:
		try:
			return lirc.Client()
		except:
			return None


def getLIRCPulseData():
	if haslirclib == False:
		print ("    * LIRC Module not found, please reboot and try again *")
		return []

	irlogfile = "/dev/shm/lircdecoder.log"

	# Clear old data if necessary
	if os.path.exists(irlogfile) == True:
		os.remove(irlogfile) 
	# Start logging
	try:
		# Old method
		lirc.set_inputlog(irlogfile)
	except:
		try:
			lirc.start_logging(irlogfile)
		except:
			print ("    * LIRC Module error, please make sure IR button is not already in use, or reboot and try again *")
			return [(-1, -1)]

	# Wait for first log
	logsize = 0
	while logsize == 0:
		if os.path.exists(irlogfile) == True:
			logsize = os.path.getsize(irlogfile)
		if logsize == 0:
			time.sleep(0.1)

	print("    Thank you")

	newlogsize = 0
	while logsize != newlogsize:
		logsize = newlogsize
		time.sleep(0.1)
		newlogsize = os.path.getsize(irlogfile)

	try:
		# Old method
		lirc.stop_inputlog()
	except:
		try:
			lirc.stop_logging()
		except:
			print ("    * LIRC Module error, please make sure IR button is not already in use *")
			return [(-1, -1)]

	# Pulse Data
	pulsedata = []

	terminated = False
	if os.path.exists(irlogfile) == True:
		ctr = 0
		fp = open(irlogfile, "r")
		for curline in fp:
			if len(curline) > 0:
				rowdata = curline.split(" ")
				if len(rowdata) == 2:
					duration = int(rowdata[1])
					value = 0
					if rowdata[0] == "pulse":
						value = 1
					ctr = ctr + 1
					if value == 1 or ctr > 1:
						if duration > PULSETAIL_MAXMICROS_NEC:
							terminated = True
							break
						pulsedata.append((value, duration))
		fp.close()
		os.remove(irlogfile) 

	# Check if terminating pulse detected
	if terminated == False:
		print ("    * Unable to decode. Please try again *")
		return []
	return pulsedata


#########################
# Common
irconffile = "/etc/lirc/lircd.conf.d/argon.lircd.conf"

# I2C
address = 0x1a	  # I2C Address
command = 0xaa	  # I2C Command

# Constants
PULSETIMEOUTMS = 1000
VERIFYTARGET = 3
PULSEDATA_MAXCOUNT = 200	# Fail safe

# NEC Protocol Constants
PULSEBIT_MAXMICROS_NEC = 2500
PULSEBIT_ZEROMICROS_NEC = 1000

PULSELEADER_MINMICROS_NEC = 8000
PULSELEADER_MAXMICROS_NEC = 10000
PULSETAIL_MAXMICROS_NEC = 12000


rev = GPIO.RPI_REVISION
if rev == 2 or rev == 3:
	bus = smbus.SMBus(1)
else:
	bus = smbus.SMBus(0)


# Standard Methods
def getbytestring(pulsedata):
	outstring = ""
	for curbyte in pulsedata:
		tmpstr = hex(curbyte)[2:]
		while len(tmpstr) < 2:
			tmpstr = "0" + tmpstr
		outstring = outstring+tmpstr
	return outstring

def displaybyte(pulsedata):
	print (getbytestring(pulsedata))


def pulse2byteNEC(pulsedata):
	outdata = []
	bitdata = 1
	curbyte = 0
	bitcount = 0
	for (mode, duration) in pulsedata:
		if mode == 1:
			continue
		elif duration > PULSEBIT_MAXMICROS_NEC:
			continue
		elif duration > PULSEBIT_ZEROMICROS_NEC:
			curbyte = curbyte*2 + 1
		else:
			curbyte = curbyte*2

		bitcount = bitcount + 1
		if bitcount == 8:
			outdata.append(curbyte)
			curbyte = 0
			bitcount = 0
	# Shouldn't happen, but just in case
	if bitcount > 0:
		outdata.append(curbyte)

	return outdata


def bytecompare(a, b):
	idx = 0
	maxidx = len(a)
	if maxidx != len(b):
		return 1
	while idx < maxidx:
		if a[idx] != b[idx]:
			return 1
		idx = idx + 1
	return 0


# Main Flow
mode = "custom"
if len(sys.argv) > 1:
	mode = sys.argv[1]

powerdata = []
buttonlist = ['POWER', 'UP', 'DOWN', 'LEFT', 'RIGHT',
				'VOLUMEUP', 'VOLUMEDOWN', 'OK', 'HOME', 'MENU'
				'BACK']

ircodelist = ['00ff39c6', '00ff53ac', '00ff4bb4', '00ff9966', '00ff837c', 
				'00ff01fe', '00ff817e', '00ff738c', '00ffd32c', '00ffb946',
				'00ff09f6']

buttonidx = 0

if mode == "power":
	buttonlist = ['POWER']
	ircodelist = ['']
elif mode == "resetpower":
	# Just Set the power so it won't create/update the conf file
	buttonlist = ['POWER']
	mode = "default"
elif mode == "custom":
	buttonlist = ['POWER', 'UP', 'DOWN', 'LEFT', 'RIGHT',
				'VOLUMEUP', 'VOLUMEDOWN', 'OK', 'HOME', 'MENU'
				'BACK']
	ircodelist = ['', '', '', '', '', 
				'', '', '', '', '',
				'']
	#buttonlist = ['POWER', 'VOLUMEUP', 'VOLUMEDOWN']
	#ircodelist = ['', '', '']

if mode == "default":
	# To skip the decoding loop
	buttonidx = len(buttonlist)
	# Set MCU IR code
	powerdata = [0x00, 0xff, 0x39, 0xc6]
else:
	print ("************************************************")
	print ("* WARNING: Current buttons are still active.   *")
	print ("*          Please temporarily assign to a      *")
	print ("*          different button if you plan to     *")
	print ("*          reuse buttons.                      *")
	print ("*          e.g. Power Button triggers shutdown *")
	print ("*                                              *")
	print ("*            PROCEED AT YOUR OWN RISK          *")
	print ("*      (Press CTRL+C to abort at any time)     *")
	print ("************************************************")

readaborted = False
# decoding loop
while buttonidx < len(buttonlist):
	print ("Press your button for "+buttonlist[buttonidx]+" (CTRL+C to abort)")
	irprotocol = ""
	outdata = []
	verifycount = 0
	readongoing = True

	# Handles NEC protocol Only
	while readongoing == True:
		# Try GPIO-based reading, if it fails, fallback to LIRC
		pulsedata = getGPIOPulseData()
		if len(pulsedata) == 1:
			if pulsedata[0][0] == -2:
				if lircmode == 0:
					lirc = getLIRCobj()
					if lirc is None:
						readongoing = False
						readaborted = True
						buttonidx = len(buttonlist)
						print ("    * Error initializing LIRC object")
						break;
					lircmode = 1
				pulsedata = getLIRCPulseData()

		# Aborted
		if len(pulsedata) == 1:
			if pulsedata[0][0] == -1:
				readongoing = False
				readaborted = True
				buttonidx = len(buttonlist)
				break
		# Ignore repeat code (NEC)
		if len(pulsedata) <= 4:
			continue

		# Get leading signal
		(mode, duration) = pulsedata[0]

		# Decode IR Protocols
		# https://www.sbprojects.net/knowledge/ir/index.php

		if duration >= PULSELEADER_MINMICROS_NEC and duration <= PULSELEADER_MAXMICROS_NEC:
			irprotocol = "NEC"
			# NEC has 9ms head, +/- 1ms
			curdata = pulse2byteNEC(pulsedata)
			if verifycount > 0:
				if bytecompare(outdata, curdata) == 0:
					verifycount = verifycount + 1
				else:
					verifycount = 0
			else:
				outdata = curdata
				verifycount = 1


			if verifycount >= VERIFYTARGET:
				readongoing = False
				print ("")
			elif verifycount == 0:
				print ("    * IR code mismatch, please try again *")
			elif VERIFYTARGET - verifycount > 1:
				print ("    Press the button "+ str(VERIFYTARGET - verifycount)+ " more times")
			else:
				print ("    Press the button 1 more time")

		else:
			verifycount = 0
			print ("    * Unable to decode. Please try again *")
			#curdata = pulse2byteLSB(pulsedata)
			#displaybyte(curdata)

	# Check for duplicates
	newircode = getbytestring(outdata)
	if verifycount > 0:
		checkidx = 0
		while checkidx < buttonidx and checkidx < len(buttonlist):
			if ircodelist[checkidx] == newircode:
				print ("    Button already assigned. Please try again")
				verifycount = 0
				break
			checkidx = checkidx + 1

	# Store code, and power button code if applicable
	if verifycount > 0:
		if buttonidx == 0:
			powerdata = outdata
		if buttonidx < len(buttonlist):
			# Abort will cause out of bounds
			ircodelist[buttonidx] = newircode
			#print (buttonlist[buttonidx]+": "+ newircode)
			buttonidx = buttonidx + 1

if len(powerdata) > 0 and readaborted == False:
	# Send to device if completed or reset mode
	#print("Writing " + getbytestring(powerdata))
	print("Updating Device...")
	bus.write_i2c_block_data(address, command, powerdata)

	# Update IR Conf if there are other button
	if buttonidx > 1:
		print("Updating Remote Control Codes...")
		fp = open(irconffile, "w")

		# Standard NEC conf header
		fp.write("#\n")
		fp.write("# Based on NEC templates at http://lirc.sourceforge.net/remotes/nec/\n")
		fp.write("# Configured codes based on data gathered\n")
		fp.write("#\n")
		fp.write("\n")
		fp.write("begin remote\n")
		fp.write("  name  argon\n")
		fp.write("  bits           32\n")
		fp.write("  flags SPACE_ENC\n")
		fp.write("  eps            20\n")
		fp.write("  aeps          200\n")
		fp.write("\n")
		fp.write("  header       8800  4400\n")
		fp.write("  one           550  1650\n")
		fp.write("  zero          550   550\n")
		fp.write("  ptrail        550\n")
		fp.write("  repeat       8800  2200\n")
		fp.write("  gap          38500\n")
		fp.write("  toggle_bit      0\n")
		fp.write("\n")
		fp.write("  frequency    38000\n")
		fp.write("\n")
		fp.write("      begin codes\n")

		# Write Key Codes
		buttonidx = 1
		while buttonidx < len(buttonlist):
			fp.write("          KEY_"+buttonlist[buttonidx]+"                0x"+ircodelist[buttonidx]+"\n")
			buttonidx = buttonidx + 1
		fp.write("      end codes\n")
		fp.write("end remote\n")
		fp.close()



###############
# GPIO-Only Cleanup
GPIO.cleanup()

