```
avoid_warnings=2
dtoverlay=dwc2,dr_mode=host
dtparam=i2c_vc=on
dtoverlay=i2c-rtc,pcf85063a,i2c_csi_dsi
eeprom_write_protect=1
```

cmd:
```
systemctl mask rpi-eeprom-update.service
```
