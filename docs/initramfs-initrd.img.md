## Create initramfs initrd img

```
apt install initramfs-tools -y
rm -rf /boot/initrd.img ; mkinitramfs -o /boot/initrd.img
# update-initramfs -k $(uname -r) -c -b /boot
```

## Add to config

```
echo 'initramfs initrd.img followkernel' >>/boot/config.txt; cat /boot/config.txt|tail -n1
```

## Finished

```
reboot
```
