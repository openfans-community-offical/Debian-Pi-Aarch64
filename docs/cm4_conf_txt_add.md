```
dtoverlay=dwc2,dr_mode=host
eeprom_write_protect=1
```

cmd:
```
systemctl mask rpi-eeprom-update.service
```
