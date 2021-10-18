## Upgrade buster-backports qemu version

```
apt install libfdt1=\
$(apt-cache madison libfdt1|head -n1|awk -F'|' '{print $2}'|sed 's/ //g') \
-y

apt install libdaxctl1=\
$(apt-cache madison libdaxctl1|head -n1|awk -F'|' '{print $2}'|sed 's/ //g') \
-y

apt install libndctl6=\
$(apt-cache madison libndctl6|head -n1|awk -F'|' '{print $2}'|sed 's/ //g') \
-y

apt install libpmem1=\
$(apt-cache madison libpmem1|head -n1|awk -F'|' '{print $2}'|sed 's/ //g') \
-y

pkgs=$(for i in qemu qemu-block-extra qemu-guest-agent \
qemu-system qemu-system-arm qemu-system-common qemu-system-data \
qemu-system-gui qemu-system-mips qemu-system-misc qemu-system-ppc \
qemu-system-sparc qemu-system-x86 qemu-utils; \
do echo -n "$i=$(apt-cache madison qemu|head -n1|awk '{print $3}')  "; \
done) ; \
apt install $pkgs

pkgs=$(for i in qemu-efi qemu-efi-aarch64 qemu-efi-arm; \
do echo -n "$i=$(apt-cache madison qemu-efi-aarch64|head -n1|awk '{print $3}')  "; \
done) ; \
apt install $pkgs

pkgs=$(for i in ipxe-qemu; \
do echo -n "$i=$(apt-cache madison ipxe-qemu|head -n1|awk '{print $3}')  "; \
done) ; \
apt install $pkgs
```
