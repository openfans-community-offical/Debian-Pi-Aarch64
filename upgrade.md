![openfans](/images/openfans.png)&nbsp;&nbsp;&nbsp;&nbsp;![amatfan.png](/images/amatfan.png)

# Debian Pi Aarch64 - 基础系统 + 深度桌面 + Xfce桌面

**[OPENFANS开源社区](http://www.openfans.org)&nbsp;&nbsp; && &nbsp;&nbsp;[树莓派爱好者基地](http://www.pifan.org/)&nbsp;&nbsp;荣誉出品**

## [捐赠](donation/README.md)

###  再次重申！我们是团队，企业级的专业团队出品的系统，不要拿个人作品来和我们比较

----

# 如何升级或更新 Debian Pi Aarch64 系统

## 重要：

**我们发布的更新或软件包根据实际情况一般通常采用 tag、zip、tar.gz、xz 的压缩格式发布**

**你必须至少安装了对以上压缩格式软件的支持，强烈建议通过下面的命令一键安装以上所有软件包的支持**

安装过程要求你的树莓派已连接网络并能够访问互联网

```shell
apt update ; apt install tar gzip zip unzip bzip2 xz-utils -y
```

## [捐赠](donation/README.md)

----

## 升级系统固件及驱动

**请前往  [此处](https://pan.baidu.com/s/1-NY_WL5LB0stpxT1wAKSaA)**

* 打开"***Debian-Pi-Aarch64-Kernel-Firmware***"文件夹，

* **下载最新的升级包** (根据年月日判断，如201X-0X-XX)

> 如：***upkg-201X-0X-XX-v201X-1.X-uX.zip***

* 上传到你的树莓派系统，**切换至root用户** 并解压这个升级包

```shell
unzip upkg-201X-0X-XX-v201X-1.X-uX.zip

# 注意：这里的 upkg-201X-0X-XX-v201X-1.X-uX.zip 以你实际下载的文件名为准
```
* 解压完成后执行以下命令

```shell
cd ./upkg
sudo  sh  ./sys_upgrade
```

最后 **重启** 即可,  **注意：** 如果你使用的是 **"深度桌面"** 或 **"xfce U6"** 以后的版本 :

- **在 重启 之前，还需要执行以下命令再 重新启动**

```shell
sudo -i
sed -i '/initramfs.*/d' /boot/config.txt; sed -i '/initramfs.*/d' /boot/config.txt
sync && sync && init 6
```

- **待完成重启后，执行以下命令**

```shell
mkinitramfs -o /boot/initrd.img-$(uname -r)
update-initramfs -k $(uname -r) -u -t
update-initramfs -u -t
mk-initrd && sync && sync && init 6
```

- **最后重启系统，完成升级**

## [捐赠](donation/README.md)

---

## 如何更新系统

更新系统无需额外操作，直接使用最新的 **Debian** 系统仓库更新即可，通过以下命令进行系统更新

```shell
apt update ; apt upgrade -y
```
## [捐赠](donation/README.md)
