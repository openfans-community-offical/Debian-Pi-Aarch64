#### build

```
wget https://source.denx.de/u-boot/u-boot/-/archive/v2021.04/u-boot-v2021.04.tar.gz
cd  u-boot-v2021.04/
make distclean
make rpi_4_defconfig
make -j X
cp u-boot.bin /boot/
```

#### config.txt

**add:**

```
kernel=u-boot.bin
kernel_address=Ox00080000
arm_64bit=1
enable_uart=1
uart_2ndstage=1
enable_gic=1
```

#### PS: 

**kernel=kernel8.img** change to **kernel=u-boot.bin**
