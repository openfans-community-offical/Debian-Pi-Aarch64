![openfans](/images/openfans.png)&nbsp;&nbsp;&nbsp;&nbsp;![amatfan.png](/images/amatfan.png)

# ★ New - Raspberry Pi Debian Pi Aarch 64OS - ★

#### 系统截图：

MacOS_Mojave主题桌面截图

![macos](./images/macos1.png)

无桌面加强版Web管理界面

![loginUI](./images/ui1.png)

无桌面加强版Web管理界面

![WebUI](./images/ui2.png)

无桌面加强版Web管理界面

![Docker](./images/ui3.png)

无桌面加强版Web管理界面

![UI SHELL](./images/uishell.png)

CecOS CaaS 容器云

![CaaS](./images/caas.png)

CecOS CaaS 容器云 集群管理

![CaaS Cluster](./images/caas2.png)

MacOS_Mojave主题桌面截图 多媒体支持

![macos](./images/macos2.png)

深度(Deepin)桌面截图

![Deepin桌面1](./images/deepin_desktop_min.png)

深度(Deepin)桌面截图

![pi4桌面2](./images/p4-2.png)

深度(Deepin)桌面截图

![pi4桌面1](./images/p4-1.png)

MacOS_Mojave主题桌面截图 虚拟机图形化管理器

![pi4VMM](./images/vmm.png)

MacOS_Mojave主题桌面截图 运行 Android App: 刀塔

![pi4Android1](./images/apk0.png)

MacOS_Mojave主题桌面截图 运行 Android App: WPS和刀塔

![pi4Android2](./images/apk1.png)

----

## 2.0 说明文档 

\- **树莓派64位操作系统** - **OPENFANS开源社区 & 树莓派爱好者社区** - **联合出品** -

这是支持树莓派全系列64位CPU的全新的64位2.0系统 **正式版** 的说明文档，系统支持树莓派3B、3B+、3A+、4B。

任何1.0版本及2.0预览版的历史系统版本目前已停止更新和维护，历史说明文档请点击 **[此处](./README_ORGI.md)** 查看。

**在使用前请仔细阅读该文档**，避免重复提问或询问任何在该文档中已说明的内容（我们将拒绝回答任何已说明的问题），除本文档外本Git仓库中的其他任何文档已不再维护，仅作为开发人员存档，特此说明。

----

## 目录

[1.系统介绍](./README_TMEP.md#1%E7%B3%BB%E7%BB%9F%E4%BB%8B%E7%BB%8D)

[2.主要特性说明](./README_TMEP.md#2%E4%B8%BB%E8%A6%81%E7%89%B9%E6%80%A7%E8%AF%B4%E6%98%8E)

[2-1. Web可视化管理Web可视化管理](./README_TMEP.md#2-1web%E5%8F%AF%E8%A7%86%E5%8C%96%E7%AE%A1%E7%90%86)

[2-2. QEMU-KVM 虚拟化支持](./README_TMEP.md#2-2qemu-kvm-%E8%99%9A%E6%8B%9F%E5%8C%96%E6%94%AF%E6%8C%81)

[2-3. Docker 容器支持](./README_TMEP.md#2-3docker-%E5%AE%B9%E5%99%A8%E6%94%AF%E6%8C%81)

[2-4. AUFS文件系统支持](./README_TMEP.md#2-4aufs%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%E6%94%AF%E6%8C%81)

[2-5. TCP加速](./README_TMEP.md#2-5tcp%E5%8A%A0%E9%80%9F)

[2-6. 内存及交换优化（算法级）](./README_TMEP.md#2-6%E5%86%85%E5%AD%98%E5%8F%8A%E4%BA%A4%E6%8D%A2%E4%BC%98%E5%8C%96%E7%AE%97%E6%B3%95%E7%BA%A7)

[2-7. MacOS Mojave 主题桌面](./README_TMEP.md#2-7macos_mojave%E4%B8%BB%E9%A2%98%E6%A1%8C%E9%9D%A2)

[2-8. CecOS CaaS 容器云](./README_TMEP.md#2-8cecos_caas%E5%AE%B9%E5%99%A8%E4%BA%91)

[2-9. 其他特性](./README_TMEP.md#%E5%85%B6%E4%BB%96%E7%89%B9%E6%80%A7)

[3. 使用说明](./README_TMEP.md#3%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E)

[3-1. 系统初始化说明](./README_TMEP.md#3-1%E7%B3%BB%E7%BB%9F%E5%88%9D%E5%A7%8B%E5%8C%96%E8%AF%B4%E6%98%8E)

[3-2. 账户及密码](./README_TMEP.md#3-2%E8%B4%A6%E6%88%B7%E5%8F%8A%E5%AF%86%E7%A0%81)

[3-3. Web登录接口说明](./README_TMEP.md#3-3web%E7%99%BB%E5%BD%95%E6%8E%A5%E5%8F%A3%E8%AF%B4%E6%98%8E)

[3-4. 预配置项](./README_TMEP.md#3-4%E9%A2%84%E9%85%8D%E7%BD%AE%E9%A1%B9)

[3-5. 无线配置说明](./README_TMEP.md#3-5%E6%97%A0%E7%BA%BF%E9%85%8D%E7%BD%AE%E8%AF%B4%E6%98%8E)

[3-6. 有线网络配置](./README_TMEP.md#3-6%E6%9C%89%E7%BA%BF%E7%BD%91%E7%BB%9C%E9%85%8D%E7%BD%AE)

[3-7. 开机自定义启动脚本](./README_TMEP.md#3-7%E5%BC%80%E6%9C%BA%E8%87%AA%E5%AE%9A%E4%B9%89%E5%90%AF%E5%8A%A8%E8%84%9A%E6%9C%AC)

[3-8. 深度桌面禁止自动升级的说明](./README_TMEP.md#3-8%E6%B7%B1%E5%BA%A6%E6%A1%8C%E9%9D%A2%E7%A6%81%E6%AD%A2%E8%87%AA%E5%8A%A8%E5%8D%87%E7%BA%A7%E7%9A%84%E8%AF%B4%E6%98%8E)

[3-9. 中文环境下TTY显示中文字体(非远程方式)](./README_TMEP.md#3-9%E4%B8%AD%E6%96%87%E7%8E%AF%E5%A2%83%E4%B8%8Btty%E6%98%BE%E7%A4%BA%E4%B8%AD%E6%96%87%E5%AD%97%E4%BD%93%E9%9D%9E%E8%BF%9C%E7%A8%8B%E6%96%B9%E5%BC%8F)

[3-10. MacOS_Mojave主题桌面安装VNC远程](./README_TMEP.md#3-10macos_mojave%E4%B8%BB%E9%A2%98%E6%A1%8C%E9%9D%A2%E5%AE%89%E8%A3%85vnc%E8%BF%9C%E7%A8%8B)

[3-11. 切换声音输出通道](./README_TMEP.md#3-11%E5%88%87%E6%8D%A2%E5%A3%B0%E9%9F%B3%E8%BE%93%E5%87%BA%E9%80%9A%E9%81%93)

[3-12. 32位软件armhf支持](./README_TMEP.md#3-1232%E4%BD%8D%E8%BD%AF%E4%BB%B6armhf%E6%94%AF%E6%8C%81)

----

## 1.系统介绍

别问为什么树莓派要用64位系统，64位和32位有什么差别 ？

因为树莓派CPU支持64位，但是官方没有，其他的请自行补脑...

本文所发布的所有版本是已在企业生产环境下使用并验证的正式版本，系统经过严格测试，完全兼容树莓派 3B/3B+/3A+/4B，原生的有线、无线网卡均可正常使用，所有系统软件包数量几乎可以媲美X86的版本，系统基于原生 Debian 64位 从头构建（非任何移植版和官改版本），保证原滋原味。

由于和原生树莓派没有关系，所以没有树莓派的相关专有命令（如 raspi-config ，rpi-update 等 ），请自行修改配置文件（ /boot/config.txt ）

为什么选择Debian?

因为树莓派天生和Debian的系统兼容性最好（这离不开Raspbian的功劳，因为Raspbian也是基于Debian构建的，所以树莓派在Debian系下的测试是最完善最充分的，再加上本身Debian系统的强大和稳定，大名鼎鼎的Ubuntu就是基于Debian系最出名和成功的一个发行版）。

本次系统完全不同于之前我们所发布的所有系统(同样也包括之前的64位的Debian )，此次我们全部从头全新构建在我们的实验室新构建了全新的自动编译和打包、测试系统，同样我们也对系统重新定义了打包流程和调整了所有的相关配置，对内核进行了大量的修改、调整优化和BUG修复，加入了很多新的功能和特性，特别是加入了KVM虚拟化的支持以及重点加强了对Docker的各项特性支持和优化。

2019年6月20日，树莓派基金会发布了全新的第四代树莓派单板机4B，我们在第一时间托人从树莓派官方英国剑桥全球专卖店拿到了4代4G的单板机。

2019年7月6日，历时半个月的努力，OPENFANS和树莓派爱好者基地联合发布了新的Debian-Pi-Aarch64 2.0系统。

这是全球第一个发行的支持树莓派4B的64位系统!

新的2.0正式版开启了全系的3D加速支持，正式引入OPENFANS的容器云管理平台，较1.0系统将更为完善和强大！

秉承我们OPENFANS和树莓派爱好者基地联合发布的Debian-Pi-Aarch64系统一直以来的优良传统！

系统全面兼容树莓派全线64位CPU的单板机：3B、3B+、3A+、4B，并仍然继承1.0稳定版的全部特性。

### 1-1.系统环境（版本介绍）

● 基础系统（无桌面基础版）

标准基础系统镜像，没有X-WINDOWS桌面环境。

● 基础系统Plus++（无桌面加强版）

在标准基础系统之上，加入了可视化的WebUI管理界面支持。

● MacOS_Mojave主题定制桌面（全功能版）

在标准基础系统之上基于XFCE深度定制的树莓派爱好者基地的独家系统镜像，具备所有系统的全部功能！！

● 深度(Deepin)桌面

基于我们自己的基础系统镜像，移植了完整的深度Deepin 15.5专业版桌面，这是目前 **第一个** 基于完整的Debian Aarch64架构而构建的适配于树莓派B/3B+/3A/4B的64位深度ARM64镜像。

----

## 2.主要特性说明

### 2-1.Web可视化管理

![web manage](./images/ui2.png)

全平台Web可视化管理操作（仅桌面版和无桌面增强版提供支持）

全新64位2.0系统上提供了Web管理和操作的支持，至此，全系统平台均实现了可视化的操作管理，不管是标准的桌面图形，还是无桌面的系统(增强版)，Debian Pi Aarch64 正式全面开启可视化时代。

Web管理支持：

```
1.  新增基础镜像U9加强版
2.  全面开启Web管理时代，省去终端工具的麻烦，Anytime,Anywhere, 直接使用浏览器管理
3.  默认开启容器服务，开箱即用 (2.0正式版请通过 CecOS CaaS 容器云 管理和使用容器)
4.  集成WEB界面的全方位监控
5.  支持WEB界面查看系统状况、硬件信息、情况等信息
6.  支持WEB界面设置主机名
7.  支持WEB界面设置主机域
8.  支持WEB界面设置主机时间、NTP服务器，更新方式
9.  支持WEB界面关机、重启
10. 支持WEB界面系统日志管理
11. 支持WEB界面系统存储及相关外设管理，在线分区、挂载设备等功能
12. 支持WEB界面网络管理
13. 支持WEB界面系统账户管理
14. 支持WEB界面系统服务管理
15. 支持WEB界面系统更新管理
16. WEB界面集成Shell终端，可以在网页上直接进行终端相关操作
17. 支持跨节点和统一管理：一个界面管理多台设备，大幅度提升管理和工作效率
18. WEB管理通信使用SSL证书加密，保证会话数据的安全性
```

![shellinabox](./images/shellinabox.jpg)

**WEB SSH** 客户端支持，使用独立的 webshell(ShellinaBox)套件，提供独立的 **web ssh** 登录支持。

### 2-2.QEMU-KVM 虚拟化支持

这是原生Aarch64架构的QEMU虚拟机，支持KVM硬件加速。

我们重新编译了KVM的二进制软件包，解决了在KVM硬件加速环境下 qemu-system-aarch64 的诸多BUG：

开启KVM硬件加速后系统默认版本虚拟机无法运行，无法安装系统，等等...

我们在编译内核时加入了对KVM虚拟机的支持，直接支持全虚拟化的方式运行，添加了支持原生的KVM虚拟硬件内核模块的支持，相关的主要内核模块如下：

```
1.  virtio //标准虚拟磁盘
2.  virtio-scsi //虚拟scsi磁盘
3.  virtio-blk //磁盘直通
4.  virtio-blk-scsi //scsi模式磁盘直通
5.  virtio-net //虚拟网卡
6.  virtio-balloon //内存气泡
7.  virtio-hw-random //虚拟随机数硬件
8.  virtio-console //虚拟终端
9.  virtio-input //虚拟输入设备
10. virtio-crypto-device //虚拟加密设备
12. virtio-drm-gpu //虚拟显卡
13. virtio-9p //目录共享
14. vfio //设备直通
15. vhost //主机数据交互
16. vhost-net  //主机网络数据交互
...
```

**什么是KSM ？**

KSM的原理，是多个进程中，Linux将内核相似的内存页合并成一个内存页 这个特性，被KVM用来减少多个相似的虚拟机的内存占用，提高内存的使用效率由于内存是共享的 所以多个虚拟机使用的内存减少了，这个特性，对于虚拟机使用相同镜像和操作系统时，效果更加明显

为了更好的优化虚拟机的内存使用效率，我们所有系统的内核默认都支持KSM。

目前2.0系统正式版已全部默认开启虚拟化支持，图形桌面提供可视化的“Virt-Manager”虚拟机管理程序。

### 2-3.Docker 容器支持

大名鼎鼎的Docker这里就不做过多介绍了，本次我们重新编译内核，加入了对Dcoker全特性的各项支持，这可能是目前在 **树莓派Aarch64位系统架构** 下对Docker特性支持最完善的版本 ，其他的绝大多数版本都还是32位系统配上32位docker，原生的64位系统内核缺少了很多对Docker特性的内核支持。

就连大名鼎鼎的32位树莓派Docker系统 **hypriot** 最新版也不能完整支持 **Dcoker Swarm** 。

由于 **Hypriot** 不支持 **bridge vlan/vxlan netfiler** , 你将得到以下错误信息:

```
reexec to set bridge default vlan fialed exit status 1
```

这将导致不能完全正常使用Dcoker Swarm集群，网络缺少相关特性支持，会存在一些功能缺失的问题。

你可以通过 **systemctl status containerd** 和 **systemctl status docker** 以及查看日志的方式在原生的64位ARM系统上发现不少错误和警告信息，拒不完全统计，原生的系统内核至少包括以下特性的缺失：

```
 1. cgroup memory limit
 2. cgroup swap limit
 3. cgroup rt period
 4. cgroup rt runtime
 5. cgroup pid support
 6. cgroup memory sysfs
 7. cgroup rdma
 8. cgroup perf
 9. cgroup bridge vlan/vxlan
10. cgroup netfiler
11. cgroup net prio
12. cgroup cfs bandwidth limit
13. bridge vlan ilter
14. ipvs
15. ipvs ipv6
16. memory sysfs
17. kernel KSM
...
```

**Docker Compose**

Docker官方没有提供基于arm的docker-compose可运行二进制程序，因此我们重新编译并提供了可运行的aarch64位二进制程序，现在默认已加入到系统镜像中，你可以直接使用。

### 2-4.AUFS文件系统支持

**什么是AUFS文件系统 ？**

AUFS的全称是 advanced multi-layered unification filesystem ，主要功能是把多个文件夹的内容合并到一起，提供一个统一的视图，主要用于各个Linux发行版的livecd中，以及docker里面用来组织镜像

AUFS曾是Docker默认的首选存储驱动，它非常的稳定、有很多真实场景的部署、很强的社区支持，它有以下几个主要优点：

```
1.极短的容器启动时间
2.有效的存储利用率
3.有效的内存利用率
```

但由于它没有包含在Linux内核主线中，所有很多Linux发行版并不支持AUFS。

最新的Docker默认使用的是更快最新的OverlayFS文件系统 ，本系统保持此官方设置的默认值。

**我们是否需要使用AUFS ？**

由于Docker的镜像文件使用的文件系统是分成多层存储的，OverlayFS只支持2层，使用同样的镜像层时会复制多个副本，而且占用更多的空间和I/O，而对于AUFS则不一样，它同样提供使用多层存储的功能并共享数据，Docker使用AUFS的 CoW（Copy-on-Write）写时复制技术来实现镜像共享和最小化磁盘空间的使用。

对于树莓派这样存储空间较小的设备而言，使用AUFS文件系统能更好的利用我们有限的存储空间资源并降低I/O消耗。

为了用户能够根据自己的情况自由的选择和使用OverlayFS还是AUFS，我们在内核中默认加入了对AUFS模块的支持。

由于AUFS并不在原生的Linux内核支持中，所以我们通过AUFS的PATH，为主线4.14的内核加入了AUFS的内核模块代码并重新编译，现在系统启动会自动加载AUFS模块，无需人工干预，即可直接使用。

### 2-5.TCP加速

内核默认已开启 TCP BBR 拥塞控制算法

**什么是 TCP BBR ？**

我们还是简答来说 TCP BBR 解决了什么问题吧:

```
1. 在有一定丢包率的网络链路上充分利用带宽，非常适合高延迟、高带宽的网络链路
2. 降低网络链路上的 buffer 占用率，从而降低延迟，非常适合慢速接入网络的用户
```

简单来说使用 TCP BBR 拥塞控制算法能够在一定程度上提升TCP传输速度和效率，优化网络传输

**如何关闭**:

编辑 “/mnt/etc/sysctl.conf” 文件，执行命令 "sysctl -p" 查看结果，看不到以下注释掉的内容，代表关闭成功
注释掉以下2行内容： (前面加上#即可)

```
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
```

### 2-6.内存及交换优化（算法级）

- 支持：Swap交换分区

本次新版系统默认增加了对Swap交换缓存的支持，以缓解系统内存不足所造成的死机问题，大大提升了可执行大容量内存需求应用程序的支持和效率，用户无需手动创建系统Swap，我们的系统在安装完成后将自动完成并初始化Swap，Swap文件或分区的位置可以通过查看系统挂载配置文件 /etc/fstab 来调整。

- 支持：zSWAP虚拟内存压缩

本次新版系统内核默认已加入了 **zSWAP** 虚拟内存压缩功能，可为将要交换的页面提供压缩回写缓存，默认占用物理内存上限为系统总内存的 **25%** 。

**zSWAP的好处**：

当内存页将要交换出去时，zSWAP不将其移动到交换设备，而是对其执行压缩，然后存储到系统RAM内动态分配的内存池中，回写到实际交换设备的动作则会延迟，甚至能完全避免，从而显著减少Linux系统用于交换的I/O。对于树莓派这样依托于TF卡的设备，本来I/O就不是很高，减少用于交换的I/O的操作就意味着提高系统性能，把I/O用在系统应用程序等更需要的其他调度上去。

在使用Swap文件/分区的场景下，由于减少了对Swap文件/分区的I/O操作，可以提升TF的使用寿命。

zSWAP并不虚拟一个块设备，而是hook到普通的Swap代码里，在实际发生写入到磁盘/从磁盘读取的操作前，先利用自己管理的内存进行数据的换出/换入，内存不够用以后再使用传统的Swap文件/分区。所以zSWAP适用于本身已经有交换分区的系统，以及树莓派这样本身内存不大的硬件设备。

**为什么不使用zRAM？**

zSWAP同时使用内存和交换分区，并根据实际情况自动调整所占内存的大小，所缓存的数据在系统内存不够用时会自动存入到Swap文件/分区中，大大提高了系统swap交换的效率，更充分的利用了内存空间资源又避免了系统出现内存不够的情况，而zRam完全使用内存来进行操作和存储数据，完全占用内存，一般用在大内存的场景，这对于内存很小的树莓派来说就不合适了

**zSWAP在本系统中使用的内存分配器和数据压缩算法** ：

```
内存分配器zpool框架： smalloc、zbud、z3fold
```

现实表明，zsmalloc虽然压缩率高，但是算法复杂，还需要额外的线程负责内存整理，耗费更多的cpu时间。

而zbud实现简单，以内存page为单位的存储又不会产生内存碎片，但是压缩率低，最高只有2倍，不满足小内存系统的实际需求。

因此，索尼开发了z3fold内存分配器，和zbud的实现完全一致，只是每个page可以存储3个compressed page，最高压缩率有 3 倍，逼近zsmalloc的4倍，该技术在xperia xzp的中使用，使4GB的手机获得超过4GB内存的体验。

我们在系统中选用了z3fold算法，在系统 /boot/cmdline.txt 中可以看到配置：

```
zswap.enabled=1 zswap.zpool=z3fold zswap.compressor=lz4 zswap.max_pool_percent=25
```

**压缩算法**

Linux有很多压缩算法：lz,lzo,xz,gzip,lzma...

我们这里采用了拥有极高压缩速度和较高压缩率的lz4 ，lz4相对于其他压缩算法而言，压缩率不是最高的，但速度确是最快的，在已采用 z3fold 算法的情况下，结合树莓派本身的性能特点和实际的测试，在拥有不错的压缩率的情况下，速度对于树莓派来说才是最重要的（考虑到本身CPU性能开销和内存大小的情况）。

### 2-7.MacOS_Mojave主题桌面

![desktop](./images/apk0.png)

默认桌面主题使用仿 **MacOS Mojave** 主题的桌面。

### 2-8.CecOS_CaaS容器云

![caas-main](./images/caas.png)

![caas-cluster](./images/caas2.png)

我们在2.0正式版的系统中移除了原WebUI管理界面的容器管理支持，而是用了OPENFANS提供的 **CecOS CaaS 容器云** ，这是 **完整的容器云平台** 的支持，完整具备了管理整个 **Docker Swarm** 集群环境的所有功能！

包括但不限于对 **容器节点、集群、存储、网络、镜像仓库、模板、堆栈、任务计划、用户组、权限控制** ... 等太多太多的功能支持！！

### 其他特性

- 支持3D加速，默认所有桌面环境已开启

- 新版2.0特性太多，这里就不再一一举例说明，以上只列举主要说明，请他特性请老铁们自行发掘 :)

## 3.使用说明

### 3-1.系统初始化说明

系统开机将自动扩展根分区，然后会自动进行相关配置，待完成后方可正常使用，此过程中系统将 **自动重启3次** 。

### 3-2.账户及密码

系统默认账户：**pi** ，默认密码：**raspberry**

默认账户pi账户支持ssh登录，root账户密码请登陆后使用命令 **“sudo password root”** 执行设置，

或使用命令 **“sudo -i”** 来切换到root用户。

### 3-3.Web登录接口说明

```
1.Web可视化管理界面
登录地址 https://你树莓派的IP地址:9090
说明：请使用系统默认账户pi登录

2.WEB SSH 客户端 入口界面
登录地址 https://你树莓派的IP地址:4200
说明：请使用系统默认账户pi登录

3.CecOS CaaS 容器云管理平台 登录界面
登录地址 https://你树莓派的IP地址:8443
说明：默认管理账户 admin , 默认密码：password 。请登录后立即修改默认密码！！

```

### 3-4.预配置项

系统提供网络和自动开机任务的预配置，相关配置文件的路径和对应关系如下：

| 预配置项 | 预配置文件路径 | 对应链接到的系统文件路径 |
| --- | --- | --- |
| 无线网络 | /boot/wpa_supplicant.conf | /etc/wpa_supplicant/wpa_supplicant.conf |
| 有线网络 | /boot/interfaces | /etc/network/interfaces |
| DHCP客户端 | /boot/dhclient.conf | /etc/dhcp/dhclient.conf |
| 自定义启动脚本 | /boot/rc-local | /etc/rc.local |

### 3-5.无线配置说明

桌面化环境可以登录到桌面环境后通过图形化界面设置，这里提供配置文件的修改方式。

修改 **/boot/wpa_supplicant.conf** 文件

```
## To use this file, you should run command "systemctl disable network-manager" and reboot system. (Do not uncomment this line!) ##
## 除第一行外，第一行可以删除，去掉以下每行只有单个“#”的注释符号，两个“#”注释符号的行位说明内容，请不要修改
## 中文内容是注释，删除或不要取消前面的“#”符号

## country是设置无线的国家地区，CN是中国
#country=CN
#ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
#update_config=1

## 下面的 "WIFI 1" 、"WIFI 2" 代表多个无线网络的设置
## 除非你要设置多个无线网络，否则只需要设置 "WIFI 1" 这部分的设置即可
## WIFI 1 (Do not uncomment this line!)

## 除了取消需要生效的内容注释以外，以下仅需要修改 "" 和 "psk" 后面引号内的内容即可
## ssid是你的无线Wifi名称，psk是你无线Wifi的密码
#network={
#    ssid="your-wifi1-ssid"
#    psk="wifi1-password"
#    priority=1
#    id_str="wifi-1"
#}


## WIFI 2 (Do not uncomment this line!)

#network={
#    ssid="your-wifi2-ssid"
#    psk="wifi2-password"
#    priority=2
#    id_str="wifi-2"
#}
```

**无线地区码设置：**

编辑 **/etc/default/crda** 文件，编辑 **REGDOMAIN=** 后面的内容，默认已设置为 **“CN”中国** ，一般情况下无需设置。

**附无线常用地区码：**

```
AU 澳大利亚
CA 加拿大
CN 中国
GB 英国
HK 香港
JP 日本
KR 韩国
DE 德国
US 美国
TW 台湾
```

### 3-6.有线网络配置

修改 **/boot/interfaces** 文件

```
# interfaces(5) file used by ifup(8) and ifdown(8)
# Include files from /etc/network/interfaces.d:
source-directory /etc/network/interfaces.d
## Used dhcp ip address set eth0 inet to dhcp,
## or used static ip address set eth0 to static
## and change other ip settings.
## If you wanna let settings to take effect,
## uncomment symbol in front.

#auto eth0
#allow-hotplug eth0

#iface eth0 inet dhcp
#iface eth0 inet static
#address 172.16.192.168
#netmask 255.255.255.0
#gateway 172.16.192.1
#dns-nameservers 8.8.8.8
```
### 3-7.开机自定义启动脚本

系统支持自定义任务自启动脚本，可以在系统启动前预先配置。

编辑脚本文件 **"/boot/rc-local"** ，在 **“exit 0”** 前加入自定义的脚本内容。

### 3-8.深度桌面禁止自动升级的说明

由于 Deepin系统和上游仓库存在一定的兼容性问题(deepin本身的问题)，除非你清楚自己需要做什么，否则强烈建议不要使用以下的任何一条命令或者其他任何会使得系统进行升级的操作！！！所有的Deepin版本系统都需要注意，包括1.0和2.0的所有Deepin版本!

```
apt upgrade
apt-get upgrade
apt dist-upgrade
apt-get dist-upgrade
```

**PS：**

*部分的软件安装由于deepin本身兼容性的问题，可能存在BUG造成系统无法启动或其他任何未知问题，由于软件太多我们无法一一测试，欢迎大家反馈，建议通过源码安装。*

*深度软件商店的软件是由深度提供的，非我们提供，目前深度软件商店暂时没有提供对arm64的软件支持，如有任何需求，请到深度官方论坛寻求帮助。*

*这里我们强烈建议使用我们提供的定制的 MacOS_Mojave主题桌面版本。*

### 3-9.中文环境下TTY显示中文字体(非远程方式)

注意：远程登录的方式无视这个问题，不会存在乱码的问题，仅在通过本地显示器或串口连接使用终端是由于Linux内核本地的标准TTY不支持显示中文字体，会显示乱码时才需要执行相关操作。

我们需要安装fbterm扩展支持，在联网环境下执行如下操作：

```
## 安装fbterm
sudo apt update; sudo apt install fbterm -y
## 添加登录用户到video组
sudo adduser root video ; sudo adduser pi video 
sudo adduser 你自己创建的其他用户名(若果有) video
## 然后每次需要显示时执行以下命令即可（第一次需要等待一些时间）：
fbterm
```

### 3-10.MacOS_Mojave主题桌面安装VNC远程

安装 RealVNC

```
apt update
cd ~ ; wget https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.5.0-Linux-ARM.deb
apt install ./VNC-Server-6.5.0-Linux-ARM.deb
rm -rf ./VNC-Server-6.4.0-Linux-ARM.deb
systemctl enable vncserver-x11-serviced.service ; systemctl start vncserver-x11-serviced.service
```

点击 [此处](https://www.realvnc.com/en/connect/download/viewer/) 前往下载RealVNC的客户端。

安装并运行客户端，直接输入IP地址即可，不需要填写端口，用户名和密码是你系统的登录用户和密码。

PS:

Realvnc的一些高级说明

```
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

Kill All process：
killall vncserver-x11-core vncserver-x11 vncagent vncserverui
```

### 3-11.切换声音输出通道

2.0系统默认声音使用 **HDMI** 输出

切换声音输出的命令：

```
amixer cset numid=3 2
这里将输出设置为2，也就是HDMI。
将输出设置为1将切换到模拟信号（也就是耳机接口）。
默认的设置为0，代表自动选择
```

### 3-12.32位软件armhf支持

```
dpkg --add-architecture armhf
apt update
## 需要先安装32位的ibc6的基础库
apt install ibc6:armhf
apt install 其他软件包名:armhf
## 安装32位软件请在包的名称后加入后缀 ":armhf"
```
