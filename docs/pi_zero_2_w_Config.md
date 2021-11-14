

# config.txt

## 1.Config

Add:

```
device_tree=bcm2710-rpi-zero-2.dtb
```

## 2.Disable BT

Add:

```
dtoverlay=disable-bt
```

## 3.OverClock

Add:

```
temp_limit=85
temp_soft_limit=85
arm_freq=1200
over_voltage=6
```

## 4.Tunning: Disable vc cma and video code

Add file: **/etc/modprobe.d/blacklist.conf**

```
blacklist bcm2835_codec
blacklist bcm2835_v4l2
blacklist bcm2835_isp
blacklist bcm2835_mmal_vchiq
blacklist vc_sm_cma
```
## Optional

Faster speed instead of running programs with large memory requirements (compressed memory)
Undo the following from cmdline:

```
cgroup_enable=1 cgroup_memory=1 cgroup_enable=cpuset cgroup_enable=memory swapaccount=1 
zswap.enabled=1 zswap.zpool=z3fold zswap.compressor=lz4 zswap.max_pool_percent=25
```
