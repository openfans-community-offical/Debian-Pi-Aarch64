# RTC Mod DS3231 Readme

## 1. Change to user root:

```
sudo -i
```

## 2. Disable Fake-Hwclock Service:

```
systemctl mask fake-hwclock.service
```

## 3. Copy boot kernel:

```
cd /boot/
cp /boot/EFI/BOOT/bootaa64.efi  ./kernel8.img
```

## 4. Edit file: /boot/config.txt

#### Change

```
...

## RPI AARCH64 BOOT CORE CONF ##
arm_64bit=1
arm_control=0x200 
armstub=RPI_EFI.fd 
disable_commandline_tags=2 
device_tree_address=0x8000 
device_tree_end=0x10000 
device_tree=bcm2710-rpi-3-b-plus.dtb
hdmi_force_hotplug=1
force_turbo=1
initial_turbo=30
disable_splash=1
boot_delay=1
dtparam=random=on
##   Do not change above !!   ##

...

```

#### To:

```
...

## RPI AARCH64 BOOT CORE CONF ##
arm_64bit=1
arm_control=0x200
#armstub=RPI_EFI.fd
kernel=kernel8.img
#disable_commandline_tags=2
#device_tree_address=0x8000
#device_tree_end=0x10000
device_tree=bcm2710-rpi-3-b-plus.dtb
force_turbo=1
initial_turbo=30
disable_splash=1
boot_delay=1
dtparam=random=on

dtoverlay=i2c-rtc,ds3231

##   Do not change above !!   ##

...

```

## 5. Edit file: /boot/rc-local 

Before " **exit 0** ", add content bellow:

```

# read rtc-time
hwclock -r

# write rtc-time to system
hwclock -s

```

**exit 0**



