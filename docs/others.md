![openfans](/images/openfans.png)&nbsp;&nbsp;&nbsp;&nbsp;![amatfan.png](/images/amatfan.png)

# Debian Pi Aarch64 - 基础系统 + 深度桌面 + Xfce桌面

**[OPENFANS开源社区](http://www.openfans.org)&nbsp;&nbsp; && &nbsp;&nbsp;[树莓派爱好者基地](http://www.pifan.org/)&nbsp;&nbsp;荣誉出品**

###  再次重申！我们是团队，企业级的专业团队出品的系统，不要拿个人作品来和我们比较

----

#### amixer

```
amixer cset numid=3 2
这里将输出设置为2，也就是HDMI。
将输出设置为1将切换到模拟信号（也就是耳机接口）。
默认的设置为0，代表自动选择
```

#### sysbench

```
sysbench --version
sysbench --test=cpu     --num-threads=1 --max-requests=10000  run
sysbench --test=cpu     --num-threads=4 --max-requests=100000 run
sysbench --test=cpu     --num-threads=8 --max-requests=100000 run
sysbench --test=memory  --memory-block-size=1K --memory-total-size=1G --memory-access-mode=rnd run
sysbench --test=memory  --memory-block-size=1K --memory-total-size=1G --memory-access-mode=seq run
sysbench --test=fileio  --file-num=2 --file-total-size=64M --file-test-mode=seqrewr run
sysbench --test=fileio  --file-num=2 --file-total-size=64M --file-test-mode=rndwr run
sysbench --test=threads --num-threads=1000 --thread-yields=1000 --thread-locks=8 run
sysbench --test=mutex   --mutex-num=4096   --mutex-locks=50000 --mutex-loops=10000 run
```

#### other  USB+SD=4

CONFIG

```
[pi4]
arm_64bit=1
total_mem=1024
enable_gic=1                                       
armstub=armstub8-gic.bin
```

CMD

```
dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=/dev/sda2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait mem=1G
```

#### GLES2

```shell
apt install libgles2-mesa-dev
apt install libgles2-mesa
```

#### /etc/modules-load.d/modules.conf

```shell
fbtft
````

#### Disable cgroup

In cmdline.txt remove defined cgoup args and add:

```shell
cgroup_disable=cpuset,cpuacct,blkio,memory,devices,freezer,net_cls,perf_event,net_prio,pids
```

#### ssh glxinfo

```shell
export DISPLAY=:0
export XAUTHORITY=/var/lib/lightdm/.Xauthority
glxinfo -B
env vblank_mode=0 __GL_SYNC_TO_VBLANK=0 glxgears
```

#### initrd

```shell
apt update ; apt install initramfs-tools -y
mkinitramfs -o /boot/initrd.img-$(uname -r)
      
#### /var/log/Xorg.0.log

```shell
(WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
sudo apt install xfonts-cyrillic
```

#### chromium

```shell
rm -rf /usr/sbin/chromium_mod-xface.sh 2>/dev/null;\
cat <<EOF >/usr/sbin/chromium_mod-xface.sh
#!/bin/bash
export PICHROMIUMMODS='/etc/chromium.d/pi-mods'
touch \$PICHROMIUMMODS 2>/dev/null
echo 'CHROMIUM_FLAGS=' > \$PICHROMIUMMODS
sed -i 's/CHROMIUM_FLAGS=/CHROMIUM_FLAGS="\$CHROMIUM_FLAGS --enable-gpu-rasterization --enable-native-gpu-memory-buffers --disable-quic --enable-checker-imaging --enable-tcp-fast-open --enable-fast-unload --enable-experimental-canvas-features --enable-scroll-prediction --enable-simple-cache-backend --answers-in-suggest --max-tiles-for-interest-area=512 --num-raster-threads=4 --default-tile-height=512 --disk-cache-size=0 --use-gl=egl --gles --enable-zero-copy"/g' \$PICHROMIUMMODS
EOF
sudo chmod +x /usr/sbin/chromium_mod-xface.sh

## --disable-gpu-compositing to use vc4 ??
## --disable-gpu-compositing 
```

#### libGL.so armhf

```shell
apt install libgl1-mesa-dri:armhf libgl1-mesa-glx:armhf glx-alternative-mesa:armhf
```

### glmark2 build

```shell
apt-get install libgegl-0.2-0 libgfortran3 libgimp2.0 libgl1-mesa-dev \
libgles2-mesa-dev libglew-dev libglew1.10 libglib2.0-bin libglib2.0-data \
libglib2.0-dev libglu1-mesa-dev 
apt install libpng-dev libx11-dev pkg-config libjpeg-dev libudev-dev libpng++-dev
sudo git clone https://github.com/LeMaker/glmark2.git
cd glmark2
sudo ./waf configure --with-flavors=x11-gl,x11-glesv2
sudo ./waf
sudo ./waf install
```

### omv

- install

```
apt update; apt upgrade ;\
echo 'deb http://packages.openmediavault.org/public arrakis main' >/etc/apt/sources.list.d/openmediavault.list ;\
wget http://packages.openmediavault.org/public/pool/main/o/openmediavault-keyring/openmediavault-keyring_1.0_all.deb ;\
dpkg -i ./openmediavault-keyring_1.0_all.deb ;\
rm -rf ./openmediavault-keyring_1.0_all.deb ;\
apt update; apt install postfix openmediavault ;\
omv-initsystem ; wget -O - http://omv-extras.org/install | bash
```

- Issue

Python 3.5 issues during apt-get update/upgrade

Edit **/usr/lib/python3.5/weakref.py**

change line 109 to:

```
def remove(wr, selfref=ref(self), _atomic_removal=_remove_dead_weakref):
```

And line 117 to:

```
_atomic_removal(d, wr.key)
```

#### WPS EXTERNAL FONTS

```
apt install ttf-mscorefonts-installer -y
```
