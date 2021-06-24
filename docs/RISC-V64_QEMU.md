## RISC-V64 QEMU VM Example

- **ENV:** Ubuntu 1804 X86_64

----

#### Install Base Package

```
apt-get install gcc libc6-dev pkg-config bridge-utils uml-utilities zlib1g-dev \
libglib2.0-dev autoconf automake libtool libsdl1.2-dev
```

#### Build riscv-gnu-toolchain

```
sudo apt-get install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev \
libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev

git clone https://gitee.com/mirrors/riscv-gnu-toolchain --depth=1
git rm --cached qemu
git submodule update --init --recursive
./configure --prefix=/opt/riscv-gnu-toolchain_install && make linux -j $(nproc --all)
echo 'export PATH=/opt/riscv-gnu-toolchain_install/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

#### Build Risc-V64 Qemu

```
git clone https://git.qemu.org/git/qemu.git  --depth=1
cd qemu
$ ./configure --target-list=riscv64-linux-user,riscv64-softmmu \
--prefix=/opt/qemu && make linux -j $(nproc --all)
```

#### Build Risc-V64 Kernel

```
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git --depth=1
make ARCH=riscv defconfig
make ARCH=riscv menuconfig
make CROSS_COMPILE=riscv64-unknown-linux-gnu-  ARCH=riscv -j $(nproc --all)
```

#### Buidl Risc-V64 Debian rootFS

```
apt-get install debootstrap qemu-user-static binfmt-support debian-ports-archive-keyring
debootstrap --arch=riscv64  --include=debian-ports-archive-keyring \
unstable /home/linux/riscv64-chroot \
http://mirrors.perfxlab.cn/debian-ports/

or

debootstrap --arch=riscv64 --foreign --include=debian-ports-archive-keyring  \
sid /home/linux/riscv64-chroot \
http://ftp.debian.org/debian-ports/
```

```
cat >>/etc/network/interfaces <<EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
EOF
```

```
cat >>/etc/default/u-boot <<EOF
U_BOOT_PARAMETERS="rw noquiet root=/dev/vda1"
U_BOOT_FDT_DIR="noexist"
EOF
```

CP kernel file.

```
cp Image /home/linux/riscv64-chroot/boot/
```

#### Build Risc-V64 U-Boot

```
git clone https://gitee.com/mirrors/u-boot.git --depth=1
make CROSS_COMPILE=riscv64-unknown-linux-gnu- qemu-riscv64_smode_defconfig
make CROSS_COMPILE=riscv64-unknown-linux-gnu- -j $(nproc --all)
```

#### Build Risc-V OpenSBI

```
git clone https://gitee.com/mirrors/OpenSBI.git --depth=1
make CROSS_COMPILE=riscv64-unknown-linux-gnu- PLATFORM=generic \
FW_PAYLOAD_PATH=../u-boot/u-boot.bin -j $(nproc --all)
```

#### Make Risc-V Qemu DTB

```
qemu-virt.dtb
./qemu-system-riscv64 \
-nographic \
-M virt,dumpdtb=qemu-virt.dtb \
-smp 2 -m 2G \
-bios ./fw_jump.bin \
-kernel ./u-boot.bin \
-append "console=ttyS0 rw root=/dev/vda1"
```

```
dtc -I dtb -O dts -o qemu-virt.dts qemu-virt.dtb
cp ./qemu-virt* /home/linux/riscv64-chroot/boot/
```

#### Make U-boot CMD and SCR

```
touch ./u-boot/boot.cmd
cat >>./u-boot/boot.cmd <<EOF
load virtio 0:1 0x80200000 /boot/Image
load virtio 0:1 0x82000000 /boot/qemu-virt.dtb
booti 0x80200000 - 0x82000000
EOF
```

```
./u-boot/tools/mkimage -A riscv -O linux -T script \
-C none -a 0 -e 0 -n "Distro Boot Script" \
-d ./u-boot/boot.cmd ./u-boot/boot.scr

cp ./u-boot/boot.scr /home/linux/riscv64-chroot/
cp ./u-boot/boot.cmd /home/linux/riscv64-chroot/
```

#### Make rootFS Image

```
apt-get install libguestfs-tools
virt-make-fs --partition=gpt --type=ext4 --size=384MiB \
/home/linux/riscv64-chroot  rootfs.img

chown ${USER} rootfs.img
```

## Run Testing

#### Linux

```
/bin/bash \
nohup \
./qemu-system-riscv64 \
-nographic \
-M virt -smp 2 -m 2G \
-bios ./fw_jump.bin \
-kernel ./u-boot.bin \
-object rng-random,filename=/dev/urandom,id=rng0 \
-device virtio-rng-device,rng=rng0 \
-device virtio-blk-device,drive=hd0 \
-drive file=./rootfs.img,format=raw,id=hd0 \
-device virtio-net-device,netdev=usernet \
-netdev user,id=usernet,hostfwd=tcp::22222-:22
```

#### Windows Example

```
"d:\Program Files\qemu\qemu-system-riscv64.exe" \
-nographic -M virt -m 2G -smp 2 \
-bios d:\images\riscv64\fw_jump.bin \
-kernel d:\images\riscv64\u-boot.bin \
-device virtio-blk-device,drive=hd0 \
-drive file=d:\images\riscv64\rootfs.img,format=raw,id=hd0 \
-device virtio-net-device,netdev=usernet  -netdev user,id=usernet,hostfwd=tcp::22222-:22
```

----

#### Note

**For Qemu used 9P**

```
./configure --enable-gtk --enable-virtfs
-device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare

mount -t 9p -o trans=virtio,version=9p2000.L hostshare /mnt/
```

**Some usefull**

- [https://github.com/riscvarchive/riscv-qemu/wiki](https://github.com/riscvarchive/riscv-qemu/wiki)

- [https://github.com/kvm-riscv/howto](https://github.com/kvm-riscv/howto)

- [https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU](https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU)
