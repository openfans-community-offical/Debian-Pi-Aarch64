# Fix (some) USB Adapter Problems Using Quirks

Some storage adapters don’t work very well with the Raspberry Pi 4. There is an option that can get a lot of them working using quirks. If your Ubuntu is booting to emergency mode but not in normal mode it’s worth giving quirks a try. This lowers performance, but it’s still much faster than a SD card and your adapter won’t go to waste.

To find out the quirks mode string to use we need to find the device ID string for your adapter and then add an entry to cmdline.txt telling the kernel to apply them on boot.

#### Find Your Adapter

To apply the quirks we first need to get the adapter id. We will use the sudo lsusb command:

```
$ sudo lsusb
 Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
 Bus 002 Device 002: ID 174c:55aa ASMedia Technology Inc. Name: ASM1051E SATA 6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s bridge
 Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
 Bus 001 Device 002: ID 2109:3431 VIA Labs, Inc. Hub
 Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

On line 2 we can see my ASM1051E SATA 6Gb/s bridge adapter (it’s the known working [StarTech.com 2.5″ SATA to USB 3.0*](https://www.amazon.com/StarTech-com-SATA-USB-Cable-USB3S2SAT3CB/dp/B00HJZJI84/ref=as_li_ss_tl?keywords=startech+usb+sata&qid=1564897399&s=gateway&sr=8-1-spons&psc=1&&linkCode=ll1&tag=codemallet-20&linkId=ea87552a7ef6a9633d7a8584537e3e61&language=en_US) adapter). You will see something very similar to mine when you run the command and it shouldn’t be too hard to figure out which device it is. If you need more information add a -v switch to make the command sudo lsusb -v. This can sometimes add some additional details to make it easier to figure out which one is your adapter.

If you’re still not sure, we have another command that between the two that can narrow things down. Type / paste the following:

```
sudo dmesg | grep usb

 [0.828535] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.19
 [0.828568] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
 [0.828597] usb usb3: Product: DWC OTG Controller
 [0.828620] usb usb3: Manufacturer: Linux 4.19.75-v7l+ dwc_otg_hcd
 [0.828644] usb usb3: SerialNumber: fe980000.usb
 [0.830051] usbcore: registered new interface driver uas
 [0.830182] usbcore: registered new interface driver usb-storage
 [0.836488] usbcore: registered new interface driver usbhid
 [0.836511] usbhid: USB HID core driver
 [0.971598] usb 1-1: new high-speed USB device number 2 using xhci_hcd
 [1.154217] usb 1-1: New USB device found, idVendor=2109, idProduct=3431, bcdDevice= 4.20
 [1.154254] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
 [1.154281] usb 1-1: Product: USB2.0 Hub
 [1.301989] usb 2-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
 [1.332965] usb 2-1: New USB device found, idVendor=174c, idProduct=55aa, bcdDevice= 1.00
 [1.332999] usb 2-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
 [1.333026] usb 2-1: Product: ASM105x
 [1.333048] usb 2-1: Manufacturer: ASMT
 [1.333071] usb 2-1: SerialNumber: 123456789B79F
```

This is the dmesg log showing the hardware detection as hardware is activated on the Pi. If your log is really long you can generate fresh entries by just unplugging a device and plugging it back in and running the command again. Here we can clearly see that the ASM105x is what our StarTech adapter is being detected as.

Now we can go back to our first lsusb command and we want the 8 characters from the ID field that comes right after the Device:

```
Bus 002 Device 002: ID 174c:55aa ASMedia Technology Inc. Name: ASM1051E SATA 6Gb/s bridge
```

Our adapter’s ID is: **174c:55aa**

#### Applying Quirks

To apply the quirks to our USB adapter we are going to edit /boot/firmware/cmdline.txt. Type:

```
sudo nano /boot/firmware/cmdline.txt
```

We are going to add the following entry into the very front of cmdline.txt:

```
usb-storage.quirks=XXXX:XXXX:u
```

In place of the X’s above you will put in your adapter’s ID that we got before. With the example commands I gave above mine would look like this: **usb-storage.quirks=174c:55aa:u** . After this my cmdline.txt looks like this (everything should be one continuous line, no line breaks!):

```
usb-storage.quirks=174c:55aa:u dwg_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=LABEL=writable rootfstype=ext4 elevator=deadline rootwait ...
```

Now reboot the Pi. If the Pi fails to boot you can plug the SD card into the computer and go to /boot/cmdline.txt and undo the change we did so you can boot back in with your SD card.

#### Verifying Quirks

Once you have rebooted after changing cmdline.txt we can verify the quirks have been applied by doing another dmesg | grep usb command:

```
sudo dmesg | grep usb
 [1.332924] usb 2-1: New USB device found, idVendor=174c, idProduct=55aa, bcdDevice= 1.00
 [1.332957] usb 2-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
 [1.332983] usb 2-1: Product: ASM105x
 [1.333006] usb 2-1: Manufacturer: ASMT
 [1.333028] usb 2-1: SerialNumber: 123456789B79F
 [1.335967] usb 2-1: UAS is blacklisted for this device, using usb-storage instead
 [1.336071] usb 2-1: UAS is blacklisted for this device, using usb-storage instead
 [1.336103] usb-storage 2-1:1.0: USB Mass Storage device detected
 [1.336479] usb-storage 2-1:1.0: Quirks match for vid 174c pid 55aa: c00000
 [1.336611] scsi host0: usb-storage 2-1:1.0
 ```
 
 This time we can see in dmesg that UAS was blacklisted for the device and it has loaded with the usb-storage driver instead. This driver tends to be more compatible with the “problematic adapters” but the performance is usually significantly lower. It’s definitely worth a try though as some adapters do better with the quirks performance-wise. The only way to know for sure is to run a benchmark (see “Verify Drive Performance” section).
