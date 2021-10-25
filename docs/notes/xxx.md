```
sudo rm -f /etc/machine-id
sudo rm -f /var/lib/dbus/machine-id
sudo systemd-machine-id-setup
```
change to unactive.

```
sudo rm -f /etc/machine-id
sudo dbus-uuidgen -ensure=/etc.machine-id
sudo rm -f /var/lib/dbus/machine-id
sudo dbus-uuidgen -ensure
```
