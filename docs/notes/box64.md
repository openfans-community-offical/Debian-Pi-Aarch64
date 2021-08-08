# Box64 build

```
cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DARM_DYNAREC=1
make install
```

# Install Wine (6.0.1 stable)

```
apt install lib64gcc1-i386-cross libc6-amd64-i386-cross -y
mkdir /opt/wine64; cd /opt/wine64
wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-amd64/PlayOnLinux-wine-6.0.1-upstream-linux-amd64.tar.gz
tar  xvf PlayOnLinux-wine-6.0.1-upstream-linux-amd64.tar.gz
ln -sf /opt/wine64/bin/wine64 /usr/local/bin/wine64
```

# Add audio support

```
wget http://mirrors.huaweicloud.com/debian/pool/main/f/faudio/libfaudio0_21.02-1~bpo10+1_amd64.deb
dpkg-deb -x  libfaudio0_21.02-1~bpo10+1_amd64.deb  /tmp/
cp -rfv /tmp/usr/lib/x86_64-linux-gnu/libFAudio* /opt/wine64/lib64/
```

# Wine init config

```
mkdir /opt/wine64
env LANG=zh_CN WINEPREFIX="/opt/win64/" https_proxy="http://x.x.x.x:xxxx" wine64 winecfg
```

