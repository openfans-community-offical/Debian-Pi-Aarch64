#### A new way to used armhf lib in 64 bit ENV.

```
sudo apt install libc6-armhf-cross libstdc++6-armhf-cross -y
sudo echo '/usr/arm-linux-gnueabihf/lib/' > /etc/ld.so.conf.d/libs_armhf.conf
sudo ldconfig
```

#### Another Example

```
file  /opt/vc/bin/vcdbg 
/opt/vc/bin/vcdbg: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, 
interpreter /lib/ld-linux-armhf.so.3, for GNU/Linux 2.6.32, not stripped
```

```
sudo apt install libgcc1-armhf-cross libstdc++6-armhf-cross libc6-armhf-cross patchelf -y
cd /usr/arm-linux-gnueabihf/lib
sudo curl -OL https://github.com/Hexxeh/rpi-firmware/raw/master/vc/hardfp/opt/vc/lib/libdebug_sym.so
sudo curl -OL https://github.com/Hexxeh/rpi-firmware/raw/master/vc/hardfp/opt/vc/lib/libelftoolchain.so
sudo curl -OL https://github.com/Hexxeh/rpi-firmware/raw/master/vc/hardfp/opt/vc/lib/libvcos.so
sudo mkdir -p /opt/vc/bin/
cd /opt/vc/bin/
sudo curl -OL https://github.com/Hexxeh/rpi-firmware/raw/master/vc/hardfp/opt/vc/bin/vcdbg
sudo chmod +x /opt/vc/bin/vcdbg
sudo cp /opt/vc/bin/vcdbg /opt/vc/bin/vcdbg.orig
sudo patchelf --force-rpath --set-rpath "/usr/arm-linux-gnueabihf/lib" /opt/vc/bin/vcdbg
sudo patchelf --set-interpreter /usr/arm-linux-gnueabihf/lib/ld-linux-armhf.so.3 /opt/vc/bin/vcdbg
```
