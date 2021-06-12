```
sudo rpi-eeprom-update -d -f ./pieeprom-xxxxxx.bin
```

```
sudo vcgencmd bootloader_version
sudo systemctl mask rpi-eeprom-update
```
