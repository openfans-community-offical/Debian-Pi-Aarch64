## Example

#### UGREEN
- **Port:** USB 3.0 2.5-Inch SATA
- **Mode/PID:** CM237
- **Main Controller:** ***ASM1153E***
- **Support:** UASP Transfer Protocol

#### OPEN Trim for external usb ssd

```
sudo fstrim -v /
```

**fstrim: /run/media/telgar/ssd: the discard operation is not supported**

```
$ lsblk --discard /dev/sda
NAME   DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO
sdb           0        0B       0B         0
├─sdba        0        0B       0B         0
└─sdba        0        0B       0B         0
```

If the **DISC-MAX** value is **0B**, then TRIM is not **enabled**.

Find the USB **idVendor** and **idProduct** :

```
$ lsusb
...
Bus 002 Device 002: ID 174c:1153 ASMedia Technology Inc. ASM1153 SATA 3Gb/s bridge
...
```

Add **/etc/udev/rules.d/50-usb-ssd-trim.rules**

```
ACTION=="add|change", ATTRS{idVendor}=="174c", ATTRS{idProduct}=="1153", SUBSYSTEM=="scsi_disk", ATTR{provisioning_mode}="unmap"
```

Then reboot, the TRIM will be **enabled**.

1st time, run "**fstrim -v /**" successfull:

```
$ sudo fstrim -v /
/: 111.4 GiB (119574462464 bytes) trimmed
```

Automatic trimming

The last thing you will need to do to make sure the TRIM command is run automatically in the background 

(so you don't need to run fstrim manually) is to enable the built-in fstrim.timer.

To do that, run the command:

```
$ sudo systemctl enable fstrim.timer
```

By default, it will run weekly. 

All done.
