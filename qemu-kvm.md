# QEMU-KVM 下载及使用说明

## 下载地址

* QEMU虚拟机二进制软件包 [下载地址](https://pan.baidu.com/s/1cQRDNV712f7sbrFrP4wpQg)

      文件路径：Debian-Pi-Aarch64-PKGS -> qemu

      文件名：qemu-2.12+dfsg-3.zip

* Debian Aarch64虚拟机镜像 [下载地址](https://pan.baidu.com/s/1cQRDNV712f7sbrFrP4wpQg)

      文件路径：Debian-Pi-Aarch64-PKGS -> qemu_vm -> debian9_vm

      此文件加下的所有文件均需下载，如下图所示：

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![vmfiles](./images/vmfiles.png)

## 使用说明

* **QEMU虚拟机二进制软件包 使用说明**

1. 下载QEMU虚拟机二进制软件包
2. 上传到你的树莓派
3. 解压压缩包
4. 进入解压目录，然后执行以下命令即可

```shell
sudo sh ./install
```

*注意：你的系统必须要能够连接互联网，安装过程中需要下载相关依赖的软件包*

* **Debian Aarch64虚拟机镜像 使用说明**

1. 新建一个文件夹，例如virtual_michine
2. 将刚才下载的文件全部上传到这个目录中
3. 进入这个目录，然后执行以下命令以后台运行虚拟机

```shell
sudo sh ./vm_run
```
