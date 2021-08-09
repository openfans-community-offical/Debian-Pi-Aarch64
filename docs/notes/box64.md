# Box64

## build

```
cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DARM_DYNAREC=1
make install
```

## Install Wine (6.0.1 stable)

```
apt install lib64gcc1-i386-cross libc6-amd64-i386-cross -y
mkdir /opt/wine64; cd /opt/wine64
wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-amd64/PlayOnLinux-wine-6.0.1-upstream-linux-amd64.tar.gz
tar  xvf PlayOnLinux-wine-6.0.1-upstream-linux-amd64.tar.gz
ln -sf /opt/wine64/bin/wine64 /usr/local/bin/wine64
```

## Add audio support

```
wget http://mirrors.huaweicloud.com/debian/pool/main/f/faudio/libfaudio0_21.02-1~bpo10+1_amd64.deb
dpkg-deb -x  libfaudio0_21.02-1~bpo10+1_amd64.deb  /tmp/
cp -rfv /tmp/usr/lib/x86_64-linux-gnu/libFAudio* /opt/wine64/lib64/
```

## Wine init config

```
mkdir /opt/wine64
env LANG=zh_CN WINEPREFIX="/opt/win64/" https_proxy="http://x.x.x.x:xxxx" wine64 winecfg
```

----

# For Box86

## Build on arm64

## build

```
apt install gcc-arm-linux-gnueabi binutils-arm-linux-gnueabi gcc-arm-linux-gnueabihf binutils-arm-linux-gnueabihf
cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DARM_DYNAREC=1
make install
```
## On arm64

```
apt install libgcc1-i386-cross libc6-i386-cross
dpkg --add-architecture armhf
apt install gcc-8-base:armhf libc6:armhf libgcc1:armhf
apt install libcups2:armhf libmpg123-0:armhf libmpg16-16:armhf
apt install libjpeg62-turbo:armhf libpng16-16:armhf
apt install libfreetype6:armhf libfontconfig1:armhf libldap-2.4.2:armhf

apt install libx11-6:armhf libxxf86vm1:armhf libxrender1:armhf libxcomposite1:armhf libx11-xcb1:armhf
apt install libxcb-xinerama0:armhf libxinerama1:armhf libxrandr2:armhf libxi6:armhf libxcursor1:armhf
apt purge libxrandr2:armhf -y
```

#### libfaudio0

```
http://mirrors.huaweicloud.com/debian/pool/main/f/faudio/libfaudio0_21.02-1~bpo10+1_i386.deb
apt install libasound2:armhf libpulse0:armhf
```

#### Wine (6.0.1 stable)

```
https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-x86/PlayOnLinux-wine-6.0.1-upstream-linux-x86.tar.gz
#ln -sf /opt/wine/bin/wine  /usr/local/bin/wine
rm -rf /usr/local/bin/wine ; echo -e '#!/bin/bash\nsetarch linux32 -L '"box86 /opt/wine/bin/wine "'"$@"' | tee -a /usr/local/bin/wine >/dev/null && chmod +x /usr/local/bin/wine
ln -sf /opt/wine/bin/winecfg /usr/local/bin/winecfg
ln -sf /opt/wine/bin/wineserver /usr/local/bin/wineserver
```

#### test

```
rm -rf /opt/win32/*; rm -rf /opt/win32/.update-timestamp
env LANG=zh_CN WINEPREFIX="/opt/win32/" https_proxy="http://x.x.x.x:xxxx"  box86 /opt/wine32/bin/wine  winecfg
```

#### winetricks

```
apt-get install cabextract -y
cd ~/ && wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks # Download
chmod +x winetricks && sudo mv winetricks /usr/local/bin/
env LANG=zh_CN WINEPREFIX="/opt/win32/" https_proxy="http://x.x.x.x:xxxx"  box86 winetricks --gui
BOX86_NOBANNER=1 winetricks arch=32 --gui
BOX86_NOBANNER=1 winetricks  --gui
```

# Wine ENV Settings

#### lang and fonts

```
apt install locales
dpkg-reconfigure locales
apt install xfonts-intl-chinese xfonts-wqy ttf-wqy-microhei  xfonts-intl-chinese wqy*
apt install ttf-mscorefonts-installer
```

**env**

```
export LC_ALL="zh_CN.UTF-8"
export LANG="zh_CN.UTF-8"
export LANGUAGE="zh_CN.UTF-8"

export DISPLAY=:0
export WINEPREFIX='/opt/win32'
```

#### chroot system

```
# just testing example ; do not used
~/.asoundrc 
defaults.ctl.card 0 
defaults.pcm.card 0
defaults.pcm.device 0
```


