# Debian Pi Aarch64 Xface Desktop 桌面系统

#### 再次重申！我们是团队，企业级团队出品的系统，不要拿个人作品来和我们比较。

![openfans](../images/openfans.png)&nbsp;&nbsp;&nbsp;&nbsp;![amatfan.png](../images/amatfan.png)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[OPENFANS开源社区](http://www.openfans.org)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[树莓派爱好者基地](http://rpifans.cn/)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**荣誉出品 - 全网首发 ！！**

----

## 系统介绍

四大流行桌面环境之一：**"Xface"**  *这里就不做过多介绍了*

基于 **[OPENFANS Debian Pi Aarch64](https://github.com/openfans-community-offical/Debian-Pi-Aarch64)** 基础系统U4版镜像构建的Xface桌面

点击[此处](https://pan.baidu.com/s/1dJk5uCQq8o0eRyW5Edtkzg)前往下载

# [捐赠](../donation/README.md)

---

## 系统特点

1. 完全兼容 **[OPENFANS Debian Pi Aarch64](https://github.com/openfans-community-offical/Debian-Pi-Aarch64)** 系统，具备 **OPENFANS Debian Pi Aarch64** 系统的所有优秀特性

2. 完全支持 **OPENFANS Debian Pi Aarch64** 系统的所有配置和操作指令

3. 系统镜像使用UEFI启动，完整支持有线、无线网卡和蓝牙设备，均可以通过图形界面配置

4. 支持 **shellinabox** Web方式进行SSH访问，使用方法同**OPENFANS Debian Pi Aarch64**一致

5. 默认使用成熟的**EXT4**文件系统

6. 同**OPENFANS Debian Pi Aarch64**共享软件源和更新

7. 支持TF卡和USB外设的多重启动模式

----

## 系统说明

1. 系统默认没有开启root账户的登录权限

2. 不允许保持使用默认的用户密码

3. 默认系统账户名：**pi**  ，密码：*raspberry*

4. 首次登录必须修改默认的密码，总共需要输入4次密码：

      - 第一次是默认密码 **raspberry**  - *PS: 登录认证*
      - 第二次也是默认密码 **raspberry**  - *PS: 修改密码的操作认证*
      - 第三次设置新密码  - *PS: 设置密码*
      - 第四次确认新密码  - *PS: 必须和新设置的密码一致*
      - **修改密码操作请务必在完成初始安装的3次重启后再进行！**

5. 首次登录系统后，需要打开终端，执行以下命令以开启GPU硬件加速支持

        enableV3D

6. 首次安装系统会自动重启3次
      - 第一次检查文件系统
      - 第二次自动扩展根分区
      - 第三次自动生成Swap交换文件并初始化系统
      - **系统初始安装可能会消耗较长的时间，请耐心等待**

----

## 下载地址

点击[此处](https://pan.baidu.com/s/1dJk5uCQq8o0eRyW5Edtkzg)前往下载

# [捐赠](../donation/README.md)
