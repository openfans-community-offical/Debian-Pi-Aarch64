#### build

```
git clone https://github.com/u-boot/u-boot
make distclean
make rpi_4_defconfig
make -j X
```

#### config.txt

```
kernel=u-boot.bin
kernel_address=Ox00080000
arm_64bit=1
enable_uart=1
uart_2ndstage=1
enable_gic=1
```
