![openfans](/images/openfans.png)&nbsp;&nbsp;&nbsp;&nbsp;![amatfan.png](/images/amatfan.png)

# Debian Pi Aarch64 - 基础系统 + 深度桌面 + Xfce桌面

**[OPENFANS开源社区](http://www.openfans.org)&nbsp;&nbsp; && &nbsp;&nbsp;[树莓派爱好者基地](http://www.pifan.org/)&nbsp;&nbsp;荣誉出品**

###  再次重申！我们是团队，企业级的专业团队出品的系统，不要拿个人作品来和我们比较

----

# 如何扩展虚拟机的磁盘大小

首先确认你的虚拟机已正常关闭或没有运行

本文虚拟机磁盘以 **bt.qcow2.disk** 为例

### 1. 磁盘扩容

**查看磁盘大小**

执行命令：

```shell
qemu-img info bt.qcow2.disk
```

得到如下信息:

```shell
image: bt.qcow2.disk
file format: qcow2
virtual size: 10G (10737418240 bytes) # 磁盘总大小
disk size: 6.4 # 已用容量
cluster_size: 65536
Format specific information:
    compat: 1.1
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
```  
**磁盘扩容**

本例我们的目标是为虚拟机磁盘增加10G的容量

执行下面的命令：

```shell
qemu-img resize bt.qcow2.disk +10G
```

然后再次查看磁盘大小

执行命令：

```shell
qemu-img info bt.qcow2.disk
```

结果如下：

```shell
image: bt.qcow2.disk
file format: qcow2
virtual size: 20G (21474836480 bytes) # 容量增加成功，总大小为20G
disk size: 6.4G
cluster_size: 65536
Format specific information:
    compat: 1.1
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
```

### 2. 扩展分区

**扩展已增加的容量至系统分区**

首先，启动虚拟机，并登陆虚拟机

```shell
ssh -p 2222 root@localhost
```

**查看磁盘大小**

执行命令：
```shell
fdisk -l /dev/sda
```
结果如下：

```shell
Disk /dev/sda: 20 GiB, 21474836480 bytes, 41943040 sectors        # 已增加到20G
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xcd0e4df1

Device     Boot Start      End  Sectors Size Id Type
/dev/sda1  *     2048 20969471 20967424  10G 83 Linux             # 分区容量还未扩展
```

**查看分区大小**

执行命令：

```shell
df -hT
```
结果如下：

```shell
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  496M     0  496M   0% /dev
tmpfs          tmpfs     103M  1.5M  101M   2% /run
/dev/sda1      btrfs      10G  4.7G  4.7G  50% /                  # 分区容量还未扩展
tmpfs          tmpfs     513M  4.0K  513M   1% /dev/shm
tmpfs          tmpfs     5.0M     0  5.0M   0% /run/lock
tmpfs          tmpfs     513M     0  513M   0% /sys/fs/cgroup
tmpfs          tmpfs     103M     0  103M   0% /run/user/0
```

**安装** *parted* **磁盘管理工具**

```shell
apt update ; apt install parted -y
```

**扩展分区**

输入下面的命令：**parted** ，然后按下列步骤操作：

```shell 
parted
```

此时可以看到磁盘信息如下

```shell
GNU Parted 3.2
Using /dev/sda                                                   # 这是我们需要操作的磁盘
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) print                                                   # 输入"print",查看当前操作的磁盘信息
Model: QEMU QEMU HARDDISK (scsi)
Disk /dev/sda: 21.5GB                                            # 总大小已增加至20G
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:
Number  Start   End     Size    Type     File system  Flags
 1      1049kB  10.7GB  10.7GB  primary  btrfs        boot       # 此处的“1”是磁盘分区编号，此时分区容量还没有变化
```

接下来输入如下命令 **resizepart** :

```shell
(parted) resizepart        # 输入命令 "resizepart" 进行分区扩展
Partition number? 1        # 输入需要扩展的分区编号，由于我们这里的磁盘只有一个分区，所以输入 “1”
Warning: Partition /dev/sda1 is being used. Are you sure you want to continue?
Yes/No? yes                # 确认继续，输入 "yes"
End?  [10.7GB]? 100%       # 输入“100%”，将所有可用容量全部扩展到上一步指定的分区 
(parted) print             # 输入 "print" ,查看当前操作的磁盘信息    
Model: QEMU QEMU HARDDISK (scsi)
Disk /dev/sda: 21.5GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:
Number  Start   End     Size    Type     File system  Flags
 1      1049kB  21.5GB  21.5GB  primary  btrfs        boot     # 可以看到增加的磁盘容量已扩展成功

(parted) quit              # 输入 "quit" , 退出
Information: You may need to update /etc/fstab.
```

**更新分区表**

执行下面的命令

```shell
partprobe /dev/sda
partprobe /dev/sda1
```

**扩展文件系统**

我们的虚拟机默认的是 *btrfs* 文件系统，相关的 *btrfs* 文件系统扩容的操作如下：

执行命令

```shell
btrfs filesystem resize max /
```

将得到如下提示

```shell
Resize '/' of 'max'
```

**重新挂载分区**

本文扩展的是根分区 **“/”** ，所以接下来我们重新挂载 **“/”** 根分区

执行命令:

```shell
mount -o remount,rw /  
```

**同步数据**

执行命令：

```shell
sync
```

**验证结果**

检查分区大小

输入命令

```shell
df -hT
```
结果如下：

```shell
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  496M     0  496M   0% /dev
tmpfs          tmpfs     103M  1.5M  101M   2% /run
/dev/sda1      btrfs      20G  4.7G   15G  25% /                # 分区已成功扩展
tmpfs          tmpfs     513M  4.0K  513M   1% /dev/shm
tmpfs          tmpfs     5.0M     0  5.0M   0% /run/lock
tmpfs          tmpfs     513M     0  513M   0% /sys/fs/cgroup
tmpfs          tmpfs     103M     0  103M   0% /run/user/0
```

重启虚拟机，再次登录，并执行命令 **df -hT** 已确定结果
