## Upgrade buster-backports qemu version

```
pkgs=$(for i in qemu qemu-block-extra qemu-guest-agent \
qemu-system qemu-system-arm qemu-system-common qemu-system-data \
qemu-system-gui qemu-system-mips qemu-system-misc qemu-system-ppc \
qemu-system-sparc qemu-system-x86 qemu-utils ); \
do echo -n "$i=$(apt-cache madison qemu|head -n1|awk '{print $3}')  "; \
done) ;\
apt install $pkgs
```
