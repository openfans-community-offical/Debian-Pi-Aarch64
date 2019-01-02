#### 如何更新 Debian Pi Aarch64 系统

**请前往 [此处](https://pan.baidu.com/s/1-NY_WL5LB0stpxT1wAKSaA)**

* 打开"***Debian-Pi-Aarch64-Kernel-Firmware***"文件夹，

* **下载最新的升级包** (根据年月日判断，如2019-01-02)

* 如：***upkg-2019-01-02-v2019-1.0-u1.zip***

* 上传到你的树莓派系统，解压这个升级包

```shell
unzip upkg-2019-01-02-v2019-1.0-u1.zip

# 注意：这里的 upkg-2019-01-02-v2019-1.0-u1.zip 以你实际下载的文件名为准
```
* 解压完成后执行以下命令

```shell
cd ./upkg
sudo  sh  ./sys_upgrade
```

* **然后重启系统，完成升级**
