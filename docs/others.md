
#### 再次重申！我们是团队，企业级团队出品的系统，不要拿个人作品来和我们比较。

![openfans](../images/openfans.png)&nbsp;&nbsp;&nbsp;&nbsp;![amatfan.png](../images/amatfan.png)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[OPENFANS开源社区](http://www.openfans.org)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[树莓派爱好者基地](http://rpifans.cn/)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**荣誉出品 ！！**

----

#### Disable cgroup

- In cmdline.txt remove defined cgoup args and add:
 
      cgroup_disable=cpuset,cpuacct,blkio,memory,devices,freezer,net_cls,perf_event,net_prio,pids

#### ssh glxinfo

      export DISPLAY=:0
      export XAUTHORITY=/var/lib/lightdm/.Xauthority
      glxinfo -B

#### initrd

      apt update ; apt install initramfs-tools -y
      mkinitramfs -o /boot/initrd.img-$(uname -r)
      
#### Xorg

      (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
      sudo apt install xfonts-cyrillic
