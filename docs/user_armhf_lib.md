#### A new way to used armhf lib in 64 bit ENV.

```
sudo apt install libc6-armhf-cross libstdc++6-armhf-cross -y
sudo echo '/usr/arm-linux-gnueabihf/lib/' > /etc/ld.so.conf.d/libs_armhf.conf
sudo ldconfig
```
