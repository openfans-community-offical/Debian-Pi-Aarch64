![openfans](/images/openfans.png)&nbsp;&nbsp;&nbsp;&nbsp;![amatfan.png](/images/amatfan.png)

# Debian Pi Aarch64 - 基础系统 + 深度桌面 + Xfce桌面

**[OPENFANS开源社区](http://www.openfans.org)&nbsp;&nbsp; && &nbsp;&nbsp;[树莓派爱好者基地](http://www.pifan.org/)&nbsp;&nbsp;荣誉出品**

###  再次重申！我们是团队，企业级的专业团队出品的系统，不要拿个人作品来和我们比较

----

# 如何设置VNC远程访问 

使用root账户登录并执行下列操作

## 安装 RealVNC

```shell
apt update
cd ~ ; wget https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.5.0-Linux-ARM.deb
apt install ./VNC-Server-6.5.0-Linux-ARM.deb
rm -rf ./VNC-Server-6.4.0-Linux-ARM.deb
```

然后注销或退出登录，在目录菜单 "**其他**" 里面可以找到 "**VNC Server**"

### 设置root用户VNC密码

VNC默认设置访问密码为你的账户密码，用户名为你的账户名

### 设置成服务的方式启动

```shell
## 一些说明介绍:

Installed systemd unit for VNC Server in Service Mode daemon
Start or stop the service with:
  systemctl (start|stop) vncserver-x11-serviced.service

Mark or unmark the service to be started at boot time with:
  systemctl (enable|disable) vncserver-x11-serviced.service

Installed systemd unit for VNC Server in Virtual Mode daemon

Start or stop the service with:
  systemctl (start|stop) vncserver-virtuald.service

Mark or unmark the service to be started at boot time with:
  systemctl (enable|disable) vncserver-virtuald.service
```

- 首先杀死进程，确保用户手动没有启动VNC

```shell
killall vncserver-x11-core vncserver-x11 vncagent vncserverui
```

- 然后根据提示，设置成服务并运行

```shell
systemctl enable vncserver-x11-serviced.service ; systemctl start vncserver-x11-serviced.service
```

- 运行后默认端口为：**5900**

现在，你 **必须** 使用 **RealVNC** 客户端来进行连接，有关RealVNC的客户端，点击 此处 [前往](https://www.realvnc.com/en/connect/download/viewer/) 下载

下载RealVNC客户端，直接输入**IP地址**即可，**不需要填写端口**

推荐使用**RealVNC** ，客户端支持广泛： windows, Linux, 安卓, 苹果 ...

----

## XRDP SERVER

如果要安装XRDP 执行下面命令，除非你知道XRDP是做什么的，否则不需要 !!

```shell
apt install xrdp -y ; systemctl enable xrdp.service
```
