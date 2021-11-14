

## config.txt

#### Config

Add:

```
device_tree=bcm2710-rpi-zero-2.dtb
```

#### Disable BT

Add:

```
dtoverlay=disable-bt
```

#### OverClock

Add:

```
temp_limit=85
temp_soft_limit=85
arm_freq=1200
over_voltage=6
```

#### Tunning, disable vc cma and video code

Add **/etc/modprobe.d/blacklist.conf**

```
blacklist bcm2835_codec
blacklist bcm2835_v4l2
blacklist bcm2835_isp
blacklist bcm2835_mmal_vchiq
blacklist vc_sm_cma
```
