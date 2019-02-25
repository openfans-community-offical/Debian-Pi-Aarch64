![openfans](/images/openfans.png)&nbsp;&nbsp;&nbsp;&nbsp;![amatfan.png](/images/amatfan.png)

# Debian Pi Aarch64 - 基础系统 + 深度桌面 + Xfce桌面

**[OPENFANS开源社区](http://www.openfans.org)&nbsp;&nbsp; && &nbsp;&nbsp;[树莓派爱好者基地](http://www.pifan.org/)&nbsp;&nbsp;荣誉出品**

###  再次重申！我们是团队，企业级的专业团队出品的系统，不要拿个人作品来和我们比较

----

# BIOS设置

## 开启KVM硬件加速支持

### 1. 开机按住 "ESC"

![boot_loader_screen](/images/boot_loader_screen.png)

### 2. 进入 "BIOS设置"

![bios_main](/images/bios_main.png)

### 3. 选择 "Device Manager"

![bios_s1](/images/bios_s1.png)

### 4. 选择 "Raspberry Pi Configuration"

![bios_s2](/images/bios_s2.png)

### 5. 选择 "HypDxe Configuration"

![bios_s3](/images/bios_s3.png)

### 6. 选择 "System Boot Mode"

![bios_s4](/images/bios_s4.png)

### 7. 选择 "Boot in EL2" 开启 "KVM硬件加速"

![bios_s5](/images/bios_s5.png)

### 8. 按 "F10" 再按 "Y" 保存设置

![bios_s6](/images/bios_s6.png)

### 9. 连续按 "ESC" 直到返回BIOS主界面，选择 "Continue" 继续

![bios_s7](/images/bios_s7.png)

### 10. 配置完成，系统将自动重启
