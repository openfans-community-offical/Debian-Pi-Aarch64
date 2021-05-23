#### build

```
wge https://source.denx.de/u-boot/u-boot/-/archive/v2021.04/u-boot-v2021.04.tar.gz
cd  u-boot-v2021.04/
make distclean
make rpi_4_defconfig
make -j X
```

#### vim boot.scr （NOT NEEDED ANYMORE）

```
fdt addr ${fdt_addr} && fdt get value bootargs /chosen bootargs
fatload mmc 0:1 ${kernel_addr_r} kernel8.img
booti ${kernel_addr_r} - ${fdt_addr}
```

```
./tools/mkimage -A arm64 -T script -C none -n "Boot script" -d boot.scr boot.scr.uimg
cp  u-boot.bin   /boot/
cp  boot.scr.uimg  /boot/
cd /boot/
vim config.txt
```

----

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
