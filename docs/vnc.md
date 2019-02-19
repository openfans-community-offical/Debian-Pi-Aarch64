#### 再次重申！我们是团队，企业级团队出品的系统，不要拿个人作品来和我们比较。

![openfans](../images/openfans.png)&nbsp;&nbsp;&nbsp;&nbsp;![amatfan.png](../images/amatfan.png)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[OPENFANS开源社区](http://www.openfans.org)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[树莓派爱好者基地](http://rpifans.cn/)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**荣誉出品 ！！**

----

# 如何设置VNC远程访问 

使用root账户登录并执行下列操作：

## 安装VNC

```shell
apt update; sudo apt install tightvncserver -y
```

### 设置root用户VNC密码

```shell
vncserver
You will require a password to access your desktops.
Password:  # 设置你的root账户的VNC访问密码
Verify:    # 再次确认你的root账户的VNC访问密码
## 下面设置仅查看密码(无操作权限)，这里不设置，所以选择"n"
Would you like to enter a view-only password (y/n)? n 
```

### 结束VNC进程

```shell
vncserver -kill :1
```

### 设置root账户VNC配置文件

```shell
mv /root/.vnc/xstartup /root/.vnc/xstartup.bak
## 编辑文件
vim /root/.vnc/xstartup
## 键入下面的内容
```

```shell
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
```

### 启动检验再关闭退出

```shell
vncserver ; vncserver -kill  :1
```

### 设置pi账户VNC配置文件

```shell
mkdir /home/pi/.vnc ; cp ~/.vnc/xstartup /home/pi/.vnc/xstartup ;\
chown -R  pi /home/pi/.vnc ;\
adduser pi bluetooth
```

```shell
## 编辑文件

vim /etc/dbus-1/system.d/bluetooth.conf

#### 在"<!-- allow users of bluetooth group to communicate -->" 一行上加入以下内容
```

```shell

  <policy group="pi">
    <allow send_destination="org.bluez"/>
  </policy>

## 下面一行不要添加，文件中应该存在
<!-- allow users of bluetooth group to communicate -->
```

### 设置pi用户VNC密码

```shell
su - pi

vncserver
You will require a password to access your desktops.
Password:
Verify:
Would you like to enter a view-only password (y/n)? n

vncserver -kill :1
exit
```
### 配置VNC服务文件

```shell
## 编辑文件
vim /lib/systemd/system/vncserver@.service
## 键入下面的内容
```

```shell
[Unit]
Description=Start TightVNC server at startup
After=syslog.target network.target

[Service]
Type=forking
User=pi
Group=sudo
WorkingDirectory=/home/pi

PIDFile=/home/pi/.vnc/%H:%i.pid
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x800 :%i
ExecStop=/usr/bin/vncserver -kill :%i

[Install]
WantedBy=multi-user.target
```

### 激活和启动服务

```shell
systemctl daemon-reload; systemctl enable vncserver@1.service ;\
systemctl start vncserver@1.service ; systemctl status vncserver@1.service
```

### 客户端连接

1. 使用客户端连接到你的服务器：IP地址:5901

2. 然后输入你设置的pi用户的VNC密码

----

## NOVNC

支持使用浏览器作为客户端访问VNC

### 安装并配置

```shell
apt update; apt install novnc python-websockify -y ;\
ln -sf /usr/share/novnc/vnc_auto.html /usr/share/novnc/index.html
```

### 启动服务

```shell
websockify -D --web=/usr/share/novnc/ --cert=/var/lib/shellinabox/certificate.pem 6080 localhost:5901
```

### 开机启动

将上面的命令放入 "/boot/rc-local" 即可

----

## XRDP SERVER

```shell
apt install xrdp -y ; systemctl enable xrdp.service
```
