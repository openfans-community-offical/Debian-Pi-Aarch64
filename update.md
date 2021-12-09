![openfans](/images/openfans.png)&nbsp;&nbsp;&nbsp;&nbsp;![amatfan.png](/images/amatfan.png)

## Debian Pi Aarch64 - 树莓派64位系统

**[OPENFANS开源社区](http://www.openfans.org)&nbsp;&nbsp; && &nbsp;&nbsp;[树莓派爱好者基地](http://www.pifan.org/)&nbsp;&nbsp;荣誉出品**

###  再次重申！我们是团队，企业级的专业团队出品的系统，不要拿个人作品来和我们比较

# [打赏](donation/README.md)

----

# 更新说明文档 ( Update Notes )

## 2021.12.09 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel, firmware, bootloader, userland had upgraded to upstream 
as "5.10.83-Release-OPENFANS+20211209-v8" Released now.
2. vc4/drm: Ignore vc4_hdmi->output_enabled for allowing audio.
Evert "Revert "overlays: vc4-kms-v3d: Change composite handling, Reinstates the new handling.
```

## 2021.12.04 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had updated.**

```
1. All systems kernel, firmware, bootloader, userland had updated to upstream 
as "5.10.82-Release-OPENFANS+20211204-v8" Released now.
2. Xhci: add a quirk to work around a suspected cache bug on VLI controllers for usb 2.0.
```

## 2021.12.02 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel, firmware, bootloader, userland had upgraded to upstream 
as "5.10.82-Release-OPENFANS+20211202-v8" Released now.
2. BCM2835_unicam: Add logging message when a frame is dropped.
3. BCM2835-codec: Allow a different stride alignment per role.
4. KMS fixes and ISP pitch fix.
5. Media rpivid: remove min_buffers_needed from src queue.
6. Board_info: Add upstream dtb names for cm1/3/4.
7. Platform: Allow users to disable camera boot HMAC check.
8. Clock BCM2711: Fix potential API issue in 2711 VCO setup.
9. Arm_loader: Enable USB MSD boot mode on Zero 2 W.
10. Isp: Fix Rec.709 colour space problems.
11. Userland: raspicam check system is running legacy camera stack.
12. MMAL: Hack to make mmal core register VideoCore components.
```

## 2021.11.27 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had updated.**

```
1. All systems kernel, firmware, bootloader, userland had updated to upstream 
as "5.10.81-Release-OPENFANS+20211127-v8" Released now.
2. Allow multiple users for the ISP driver of cm2835_isp.
3. Fix PCIe interrupts bcm2711 dts. 
4. Pass V4L2_CID_MPEG_VIDEO_H264_MIN_QP/MAX_QP to bcm2835-v4l2-codec
5. Add support for composite syncs to vc4_dpi for drm/vc4.
6. Ensure vc4_hdmi doesn't use 2711 HPD registers on Pi0-3 for drm/vc4. 
7. Gpio-ranges property is now required for arm dts. 
8. Update rpi-400 and cm4 dts to match 4-b for arm dts.
```

## 2021.11.25 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel, firmware, bootloader, userland had upgraded to upstream 
as "5.10.81-Release-OPENFANS+20211125-v8" Released now.
```

## 2021.11.20 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had updated.**

```
1. All systems kernel, firmware, bootloader, userland had updated to upstream 
as "5.10.79-Release-OPENFANS+20211120-v8" Released now.
```

## 2021.11.17 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel, firmware, bootloader, userland had upgraded to upstream 
as "5.10.79-Release-OPENFANS+20211117-v8" Released now.
```

## 2021.11.12 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had updated.**

```
1. All systems kernel, firmware, bootloader had updated to upstream 
as "5.10.78-Release-OPENFANS+20211112-v8" released now.
2. Change vc4-kms-v3d overlays composite handling.
3. Set TCA8418 to module for kernel.
4. Additional parameters for gpio-poweroff overlays.
```

**Also all of upkgs for all 64bit edtions support for 2Bv1.2,3B/B+/A+,4B,CM3/4,Pi400,Zero2W from now on.**

## 2021.11.11 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All system images had upgraded to upstream Debian Buster 20211111 as "2021-11-11-v2020-2.0-U6-Release".
2. All system images had included newest kernel version "5.10.78-Release-OPENFANS+20211111-v8".
3. All systems kernel, firmware, bootloader, userland "UPKG" had upgraded to upstream version 
   "5.10.78-Release-OPENFANS+20211111-v8" as Released now.
4. All system images and "UPKG" had upgraded to supported Pi Zero 2 W.
```

## 2021.11.06 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel, firmware, bootloader, userland had upgraded to upstream 
as "5.10.77-Release-OPENFANS+20211106-v8" Released now.
2. This kernel and FW had supported for Pi Zero 2 W.
```

## 2021.10.29 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel, firmware, bootloader, userland had upgraded to upstream 
as "5.10.76-Release-OPENFANS+20211029-v8" Released now.
```

## 2021.10.26 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel, firmware, bootloader, userland had upgraded to upstream 
as "5.10.75-Release-OPENFANS+20211026-v8" Released now.
```

## 2021.10.21 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel, firmware, bootloader, userland had upgraded to upstream 
as "5.10.74-Release-OPENFANS+20211021-v8" Released now.
```

## 2021.10.18 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had updated.**

```
1. All systems kernel, firmware, bootloader had upgraded to upstream 
as "5.10.73-Release-OPENFANS+20211018-v8" Released now.
2. Fixed HDMI Audio missing issue (bcm2835_audio missing firmware reference).
```

## 2021.10.15 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel, firmware, bootloader had upgraded to upstream 
as "5.10.73-Release-OPENFANS+20211015-v8" Released now.
```

## 2021.10.07 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel, firmware, bootloader and userland had updated to upstream 
as "5.10.63-Release-OPENFANS+20211007-v8" Released now.
```

## 2021.08.24 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had updated.**

```
1. All systems kernel and firmware version had updated to "5.10.60-Release-OPENFANS+20210824-v8" Released now.
2. Optimized for the kernel build compiler chain-tool had updated.
```

## 2021.08.22 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel and firmware version had updated to "5.10.60-Release-OPENFANS+20210822-v8" Released now.
2. Anbox kernel module remove cuz just for testing before.
3. The anbox needs kernel modules are not modules now, was built into the kernel, such as ashmem and binder.
4. If u wanna use binder fs, mkdir directory under dev and mount used binder fs type by yourself.
```

## 2021.08.21 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**
#### (Add an anbox kernel module pkg, Only for this version)

```
1. All systems kernel and firmware version had upgraded to "5.10.59-Release-OPENFANS+20210821-v8" Released now.
2. Add an anbox kernel module package 'anbox_kmod_5.10.59-Release-OPENFANS+20210821-v8.tar.gz' only for this kernel as a testing.
3. The anbox kernel module used the anbox's officail upstrems (Add the patch for kernel 5.10.x), not used kernel defaults.
4. The anbox kernel module version must be as the same as the upkg/FW/Kernel version.
```

## 2021.08_06~07 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had updated.**

```
1. All systems kernel and firmware version had updated to "5.10.52-Release-OPENFANS+20210806-v8" Released now.
2. Upkg name is: upkg-2021-08-07-v2021-2.0-U6-Release.zip.
```

## 2021.07.28 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had updated.**

```
1. All systems kernel and firmware version had updated to "5.10.52-Release-OPENFANS+20210728-v8" Released now.
2. Fixted some VC4 and issues, revert drm/vc4: increase the core clock to a minimum of 500MHZ.
3. overlays: Set CMA to 512MB on Pi 4 for vc4:
```

Can be overridden by appending a parameter to the dtoverlay line, e.g.

```
dtoverlay=vc4-fkms-v3d,cma-256
```

## 2021.07.23 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel and firmware version had upgraded to "5.10.52-Release-OPENFANS+20210723-v8" Released now.
```

## 2021.07.22 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had updated.**

```
1. All systems kernel and firmware version had updated to "5.10.50-Release-OPENFANS+20210722-v8" Released now.
2. Add support GUD USB Display DRM driver
```

## 2021.07.19 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel and firmware version had upgraded to "5.10.50-Release-OPENFANS+20210719-v8" Released now.
```

## 2021.07.10 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel and firmware version had upgraded to "5.10.48-Release-OPENFANS+20210710-v8" Released now.
2. Upgrade the newest 5GHz wifi firmware brcmfmac43455-sdio.clm_blob.
```

## 2021.06.20 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel and firmware had upgraded.**

```
1. All systems kernel and firmware version had upgraded to "5.10.44-Release-OPENFANS+20210620" Released now.
```

## 2021.06.11 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;System Images had upgraded.**

```
1.  Main stable kernel & FW had upgraded to "5.10.42-Release-OPENFANS+20210611-v8" now.

2.  The system had upgraded to upstream Debian Buster upstream and update to 2021-06-11.

3.  The Docker-CE had upgrade to version "20.10.7~3".

4.  Upgrade Mesa package to newest version "21.1.0-4".

5.  The Mesa support vulkan driver for rpi, and FFmpeg suport mmal hardware acceleration.

6.  Add a localhost mesa repo version "21.1.0-4", at "/opt/mesa_ffmpeg_repos_v4/", with other depends or used packages.

7.  Update X86 runtime system env to ubuntu1804, and add a new testing game Aoe2c.

8.  Desktop image had add the Wechat and QQ Music Apps.

9.  Desktop image had upgraded the QQ, WPS version.

10. The new os images support CM4 nvme boot and the upkg support u-boot booting.

11. Default repo URL had changed to huaweicloud (mirrors.huaweicloud.com).
```

## 2021.06.09 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel & FW had upgraded.**

```
1. All systems FW version had upgraded to "5.10.42-Release-OPENFANS+20210609-v8" Released now.

2. Kernel tunning.
```

## 2021.06.07 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel had upgraded.**

```
1. All systems FW version had upgraded to "5.10.39-Release-OPENFANS+20210607-v8" Released now.
```

## 2021.05.25 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel had updated.**

```
1. All systems FW version had updated to "5.10.38-Release-OPENFANS+20210525-v8" Released now.
```

## 2021.05.21 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel had upgraded.**

```
1. All systems kernel version had upgraded to "5.10.38-Release-OPENFANS+20210521-v8" Released now.

2. Add AMD_GPU kernel modules back.

3. Support CM4 NVME boot.
```

## 2021.05.14 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel & FW had upgraded.**

```
1. All systems kernel version had upgraded to "5.10.36-Release-OPENFANS+20210514-v8" Released now.

2. Add ATI kernel modules.
```

## 2021.05.02 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel & FW had upgraded.**

```
1. All systems kernel version had upgraded to "5.10.33-Release-OPENFANS+20210502-v8" Released now.

2. Remove ATI & AMD GPU/DRM kernel modules which is not used for rpi.
```

## 2021.04.11 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel & FW had upgraded.**

```
1. All systems kernel version had upgraded to "5.10.27-Release-OPENFANS+20210411-v8" Released now.
```

## 2021.03.28 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel & FW had updated.**

```
1. All systems kernel version had updated to "5.10.25-Release-OPENFANS+20210328-v8" Released now.
```

## 2021.03.25 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel & FW had upgraded.**

#### Kernel Version: "5.10.25" and New "Graphic_Libs" is supported for testing.

```
1. Main stable kernel & FW had upgraded to "5.10.25-Release-OPENFANS+20210324-v8" now, kernek modules
   and userland had supported mmal H/W acceleration now.

2. 64bit MMAL userland is supported, and used by bundled tools like raspivid and raspistill,
   the "raspivid" and "raspistill" command you can find in path "/opt/vc64/bin/".

3. New H/W codec endpoints had supported for ffmpeg now, also inclue "h264_v4l2m2m" and "h264_mmal".

4. The new "Graphic_Libs" is supported for PI4 testing：
   >>1. Mesa libs has upgraded to version "21.0.0" and also inclue OpenGL/OpenGL ES2 etc.
   >>2. Mesa vulkan driver which is named v3dv support for V3D/VC4 H/W acceleration.
```

## 2021.03.15 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel updated.**

#### Kernel Version: "5.10.22"

```
1. All systems kernel version had updated to "5.10.22-Release-OPENFANS+20210315-v8" Released now.

2. Add BCM2835_Timer and  Android_Binder_Test support for kernel. 
```

## 2021.03.14 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel & FW had updated.**

#### Kernel & FW Version: "5.10.22"

```
1. All systems kernel and FW version had updated to "5.10.22-Release-OPENFANS+20210314-v8" Released now.
```

## 2021.03.12 &nbsp;&nbsp;// **v2.0 U6:&nbsp;&nbsp;Kernel & FW had upgraded to Release version.**

```
1. All systems kernel and FW version had upgraded to "5.10.22-Release-OPENFANS+20210312-v8" Released now.

2.Kernel config updated.
```

## 2021.02.17 &nbsp;&nbsp;// **System v2.0 U6 Release ver. Kernel & FW had upgraded to Release version.**

#### Kernel & FW Version: "5.10.16"

```
1. Testing Kernel & FW version had upgraded to "5.10.16-Release-OPENFANS+20210217-v8" as Released published.

2. All systems kernel and FW version had upgraded to "5.10.16-Release-OPENFANS+20210217-v8" Released now.
```

## 2021.02.10 &nbsp;&nbsp;// **System v2.0 U6 Release ver. Testing kernel & FW upgraded.**

```
1. Testing kernel & FW version had upgraded to "5.10.14-ForTest-OPENFANS+20210210-v8"
```

## 2021.01.31 &nbsp;&nbsp;// **System v2.0 U6 Release ver. Stable kernel & FW updated and testing upgraded.**

```
1. Main stable kernel & FW had upgraded to "5.4.83-OPENFANS+20210131-v8"
2. Testing kernel & FW version had upgraded to "5.10.11-ForTest-OPENFANS+20210131-v8"
```

## 2021.01.30 &nbsp;&nbsp;//Add An Extra Package (OpenCV)

```
1.Add an extra OpenCV Package (Support hardware GPU encoding and acceleration): 
- opencv-4.5.1-org.pifan_20210116-1_arm64.deb
```

## 2021.01.23 &nbsp;&nbsp;// **System v2.0 U6 Release ver. Upkg upgraded.**

```
1. Kernel 5.10.9-ForTest-OPENFANS+20210123-v8 for Testing upgraded.

2. Build change simd -> asimd ,  add evtstrm & cpuid hardware support for stable kernel "5.4.83-OPENFANS+20210122-v8".
```

## 2021.01.13 &nbsp;&nbsp;// **System v2.0 U6 Release ver. 2101013 Kernel Testing Upkg.**

```
1. Kernel 5.10.6-ForTest-OPENFANS+20210112-v8 for Testing.

2. Build change simd -> asimd ,  add evtstrm & cpuid hardware support.
```

## 2021.01.12 &nbsp;&nbsp;// **System v2.0 U6 Release ver. 2101012 Kernel Testing Upkg.**

```
1. Kernel 5.10.6-ForTest-OPENFANS+20210112-v8 for Testing.
```

## 2021.01.11 &nbsp;&nbsp;// **System v2.0 U6 Release ver. 2101011 Kernel Update.**

```
1. Kernel tunning!
```

## 2021.01.06 &nbsp;&nbsp;// **System v2.0 U6 Release ver. 2101006 Kernel and FW Update.**

```
1. 编译工具链调整后专门针对树莓派CPU架构和指令集的特定编译优化的内核和固件。

After the adjustment of the compilation tool chain, the kernel and firmware are specifically compiled 

and optimized for the Raspberry Pi CPU architecture and instruction set.
```

## 2021.01.04 &nbsp;&nbsp;// **System v2.0 U6 Release ver. 2101004 Update.**

```
* 添加向日葵的支持。
```

## 2021.01.03 &nbsp;&nbsp;// **System v2.0 U6 Release ver. 210102/03 Upgraded.**

```
[A Chinese Team]

1. The system had upgraded to upstream Debian Buster upstream and update to 2021-01-02;

2. The Kernel and firmware had upgraded to "5.4.83-OPENFANS+20210102-v8" as support as 
newest LTS main-line;
   
3. Upkg pkg had updated to version "2021.01.02/03-2.0-U6";

4. Wifi 5G DB CN fixted.

5. Kernel tunning!

6. Support run X86 exe (It's not used virtualization for this!!), just include in Full Desktop Version.

7. App a game Diablo for preinstall.

8. Whole system pkg had updated and tuned.
```

## 2020.06.22 &nbsp;&nbsp;// **System v2.0 U4 Release ver. 200622 Upgraded.**

```
[A Chinese Team]

1. All imgs had included U3's featrues.

2. The system had upgraded to upstream Debian Buster upstream and update to 20200622;

3. The Kernel and firmware had upgraded to "5.4.47-OPENFANS+20200622-v8" as support as 
newest LTS main-line;
   
4. Upkg pkg had updated to version "2020.06.22-2.0-U4";

5. Mesa and FFMPEG had changed, and Chromium issue had fixed.
```

## 2020.06.17 &nbsp;&nbsp;// **Updated Desktop (Full-Featured) Version 

## is update to : 2020-06-17 -v2019-2.0-U3.** 20617

```
[A Chinese Team]

1.The video decoding library and graphics library had optimized,

with H264_V4L2M2M decoding and MMAL support.

2. Optimized the Chromium browser the experience when playing web video.
```

## 2020.06.15 &nbsp;&nbsp;// **Updated Desktop (Full-Featured) Version 

## is update to : 2020-06-16 -v2019-2.0-U3.** 20615

```
[A Chinese Team]

1. When HW VC4/3D enabled, the Chromium browser interface display error issue has fixed.
```

## 2020.06.15 &nbsp;&nbsp;// **System v2.0 U3 Release ver. 2-3:0615 upgraded.**

```
[A Chinese Team]

1. The system had upgraded to upstream Debian Buster upstream and update to 20200615;

2. The Kernel and firmware upgraded to "5.4.45-OPENFANS+20200614-v8" as support as 
newest LTS main-line;
   
3. Upkg pkg had upgraded to version "2020.06.15-2.0-U3";

4. Upgrade Docker pkg and docker-compose;

5. Upgrade the Mesa pkg;

6. Upgrade the VC4 FW;

7. Desktop edition upgrade WPS and QQ app;

8. Drop AUFS support prefer overlays;

9. Rebuild kernel config defind;

10. Wifi FW upgrade;

11. Boot FW upgrade support USB BOOT (Must upgrade eeprom first!);

12. ★ The dependency compatibility problems of library environment had solved.

(Deepin version 15.5 has still needs to use "sid-used" command to solve the dependency problem,

the reason: Deepin version 15.5 library environment of system baseline still as the same as the 

debian 9, the base version library was too old)
```

## 2019.12.30 &nbsp;&nbsp;// **System v2.0 U2 Release ver. 1230 Update.**

```
[A Chinese Team]

1. The system had upgrade to upstream Debian Buster 10.2 and update to 1230;

2. The Kernel and firmware upgrade to "4.19.88-OPENFANS+20191230-v8" as support as 
newest LTS main-line;
   
3. Upkg pkg update to version "2019.12.30-2.0-U2";

4. Upgrade Docker pkg.
```

## 2019.11.30 &nbsp;&nbsp;// **System v2.0 U1 Release ver. 1130 Upgraded.**

```
[A Chinese Team]

1. The system had upgraded to upstream Debian Buster 10.2 and update to 1130;

2. The Kernel and firmware upgrade to "4.19.86-OPENFANS+20191130-v8" as support as 
newest LTS main-line;
   
3. Upkg pkg update to version "2019.11.30-2.0-U1";

4. Upgrade the Mesa pkg;

5. Add "sid-used";

6. The **2.0-U1** version is the ending for the lifetime of `final 2.0 main-line`.
```

## 2019.11.25 &nbsp;&nbsp;// **System v2.0 Release ver. 1117 upgraded.**

```
[A Chinese Team]

1. The system had upgraded to upstream Debian Buster 10.2 and update to 1125;

2. The Kernel and firmware upgrade to "4.19.85-OPENFANS+20191125-v8" 
   as support as newest LTS main-line;
   
3. Upkg pkg update to version "2019.11.25";

4. Upgrade Mesa, bluealsa, dhcpcd5, pi-bluetooth, Docker, Wifi-Firmware and etc.

5. A screensaver issue had fixed for Desktop Full-Featured version;

6. Upgrade rpi-eeprom to version 2.4-1;
```

## 2019.11.17 &nbsp;&nbsp;// **System v2.0 Release ver. 1117 upgraded.**

```
[A Chinese and an America Team]

1. The system had upgraded to upstream Debian Buster 10.2 and update to 1117;

2. The Kernel and firmware upgrade to "4.19.83-OPENFANS+20191116-v8" 
   as support as newest LTS main-line;

3. Upkg pkg had upgraded to version "2019.11.16";

4. Add catfish and unrar for Desktop Full-Featured version support;

5. Add a Web VNC interface support for Desktop Full-Featured version;

6. Upgrade QEMU-KVM pkg version to the newest upstream;
```

## 2019.11.10/11 &nbsp;&nbsp;// **System v2.0 Release ver. 1110/1111 Upgraded.**

```
[A Chinese Team]

1. This is the first time we used a real powerfull Arm64-env physical server to build the whole  
   system without ross compilation tools and get better performence with the native performance, 
   a really stronger server Cavium ThunderX which has 96-cores CPU is very fast and quickly;

2. Kernel and firmware upgraded to "4.19.81-OPENFANS+20191013-v8" 
   as support as newest LTS main-line;

3. System update to "2019-11-10" the mainline of upstream;

4. Mesa pkg had upgraded to version "19.2.3";

5. upkg pkg update to version "2019.11.10";

6. Add a command line video player support with H264-V4L2-M2M hardware acceleration,  
   and fixed some issues for hardware acceleration of video stream;

7. Make a new build system on a Arm64-env physical server;

8. Add a new macOS Catalina pic as the default desktop background for 
   Desktop Full-Featured version;

9. QQ and WPS Office are integrated by default in the Desktop Full-Featured version;

10. Rebuild the whole Deepin system and upgrade to the 15.5 SP2 version;

11. Deepin system which version is 2011-11-10 (15.5 SP2) had supported upgrade now.
```

## 2019.10.13 &nbsp;&nbsp;// **System v2.0 Release ver. 1013 upgraded.** 

```
[A Chinese Team]

1. Kernel and firmware had upgraded to "4.19.79-OPENFANS+20191013-v8" as support as newest LTS main-line;

2. CecOS CaaS Container Cloud Platform has upgrade to newest version "2.22.1";

3. Docker-CE upgrade to newest version "19.03.3~3-0";

4. Rebuild FFMPEG and used the main-line release version "4.2.1" to custom version "4.2.1-v4l2", 
   Add "h264_v4l2_m2m" video codec and camera decodec support;

5. Hardware video decodec video player and camera command app support;

6. Mesa pkg had upgraded to version "19.2.1-1";

7. WPS Aarch64 desktop app edition extra pkg support;

8. Add missing LAN shared browsing features：
   add pkg "gvfs-backends" and "gvfs-fuse";

9. Upgrade Wifi firmware to newest main-line version;

10. upkg pkg update to version "2019.10.13".
```

## 2019.10.05 &nbsp;&nbsp;// **Upkg Updated.**
1. 内核及固件同步上游最新稳定版本 *4.19.76* ；
2. 内核及固件更新包更新至**upkg-2019.10.05** ;
3. 更新了部分上游内核的DTB及DTS;
4. **解决部分情况下的卡顿问题** ;
5. 重命名HDMI:ALSA设备名称，检查启用状态;
6. ACPI视频:添加新的hw_changes_brightness怪癖,在PB:Easyno上进行设置;
7. iwlwifi:mvm:始终以20MHz带宽速率初始化rs_fw;
8. iwlwifi:mvm:正确发送BCAST管理帧;
9. clk:bcm2835:添加BCM2711_CLOCK_EMMC2支持; 
10. pinctrl-bcm2835:添加对BCM2838的支持; 
11. ARM:dts:bcm27xx:修复了内存节点的DTC警告;
12. bcm2708_fb:修复结构vc4_display_settings_t的布局;

\*. **建议2.0正式版更新该固件** 。

## 2019.10.03 &nbsp;&nbsp;// **System IMG v2.0 Release Published.**
1. **2.0正式版发布 ！！！**
2. 内核及固件同步上游最新稳定版本 *4.19.75*；
3. 系统更新至上游最新 *2019-10-03*；
4. 全线引入**OPENFANS CecOS CaaS 容器云**的支持；
5. 更新无线WPA包；
6. *桌面版* 升级为 **全功能版** ，包含基地64位系统全栈**所有**功能！
7. **基础虚拟机镜像** 现在可直接用于2.0系统；
8. **宝塔虚拟机镜像** 现在可直接用于2.0系统；
9. 默认所有系统已开启内核硬件虚拟化支持；
10. 除Deepin外，所有系统已默认预置**QEMU-KVM**虚拟机程序，并**支持硬件虚拟化加速**；
11. 剔除WebGUI的鸡肋容器管理插件，使用**CecOS CaaS 容器云**全面替代；
12. 暂停支持所有 **1.0系统** 、**2.0测试版/预览版** 的更新和支持，基地系统全面正式进入**2.0**时代；
13. 全系所有系统默认已开启3D硬件加速支持；
14. 为加快系统启动速度，删除了uEFI BIOS支持，所有uEFI BIOS的配置已全部开启；
15. CPU硬标支持仍然适用于全系系统；
16. 其他若干BUG修正；
17. 编译打包系统的更新；
18. OPENFANS ARM64 自定义交叉编译工具链的再次强度优化和调整。

## 2019.09.10 &nbsp;&nbsp;// **v2.0 RC5 Released.**
1. 内核及固件同步**RC5**升级包，系统更新至最新**2019-09-10, Debian Buster 10.1**
2. Docker同步至上游CE最新**19.03.2~3-0**
3. 修复内核上游无线地区码问题
4. 修复Xfce Panel Length部分配置问题
5. 更新raspberrypi-sys-mods至最新版本
6. mac80211:正确设置PAE帧的noencrypt 
7. mac80211:在PAE拦截之前不要记忆RXCB
8. mac80211:修复可能的sta泄漏
9. cfg80211:非模块化时修复处理地区码的regdomain 
10. 升级bluealsa至0.12

## 2019.09.06 &nbsp;&nbsp;// **v2.0 RC4 Released.**
1. 内核及固件同步**RC3-U1**升级包，系统更新至最新**2019-09-06**
2. **全新的XFCE界面，清新MacOS Mojave主题和背景**
3. 默认全部开启NetworkManager, Web加强版无需再设置NM
4. XFCE增加了更强的播放器SMPlayer
5. 无线稳定和性能持续优化
6. Pluse音量优化
7. XFCE桌面图形界面定制及优化
8. 自动构建系统小调整
9. 开始为正式版发布准备
10. 部分软件包的版本小调整

## 2019.09.06 &nbsp;&nbsp;// **v2.0 UPKG RC3-U2 Released.**
1. 内核及固件独立升级包：升级到 **RC3-U1**
2. 内核模块及固件小调整，加入了新的模块和特性支持(主要针对KVM的特性)
3. cpuinfo固件显示信息优化

## 2019.09.05 &nbsp;&nbsp;// **v1.0 U11 Released.**
1. 将无线区域默认至CN，国内环境无需再次修改
2. BaseOS更新至上游最新2019-09-05

## 2019.09.03 &nbsp;&nbsp;// **2.0 RC3 ( GCC Cross Line Rebuild ) Published.**
1. 基于树莓派硬件定制再次优化GCC(gcc-9.1.0-64)交叉编译工具链重新编译内核及固件
2. Kernel同步上游LTS 4.19.69 及固件主线 4.19.69
2. 将无线区域默认至CN，国内环境无需再次修改
3. 修复Deepin自动升级后崩溃的问题
4. 无线参数调整和优化
5. pulse声音输出优化
6. 移除wicd
7. BaseOS更新至上游20190902
8. 重构升级脚本
9. Docker更新至19.03.1_3

## 2019.09.02 &nbsp;&nbsp;// **2.0 RC2 U5 ( GCC Cross Line Rebuild ) Published.**
1. 基于树莓派硬件定制并优化GCC(gcc-9.1.0-64)交叉编译工具链重新编译 Kernel 4.19.69-OPENFANS+20190902-v8 LTS 内核及固件同步主线4.19.69

## 2019.08.31 &nbsp;&nbsp;// **2.0 RC2 U4 ( Kernel & Firmware ) UPDATE Published.**
1. Kernel upgrade to Mainline 4.19.69-OPENFANS+20190831-v8 LTS, 内核及固件更新至主线4.19.69

## 2019.08.28 &nbsp;&nbsp;// **2.0 RC2 U3 ( Kernel & Firmware ) UPDATE Published.**
1. Kernel upgrade to Mainline 4.19.68-OPENFANS+20190828-v8 LTS, 内核及固件更新至主线4.19.68
2. Kernel support RPS feature, 内核支持RPS特性

## 2019.08.25 &nbsp;&nbsp;// **2.0 RC2 U2 ( Kernel & Firmware ) UPDATE Published.**
1. Kernel upgrade to Mainline 4.19.67-OPENFANS+20190825-v8 LTS, 内核及固件更新至主线4.19.67
2. Fix DMA leaks caused swiotlb bounce buffer overflow errors under heavy wifi usage in bcm2835-mmc, 修复WIFI高数据负载下MMC引起的死机问题

## 2019.08.16 &nbsp;&nbsp;// **2.0 RC2 Published.**
1. 全系64位3D显卡硬件加速支持
4. 基础系统更新至上游8月16日

## 2019.08.15 &nbsp;&nbsp;// **2.0 RC1 Published.**
1. 内核更新至主线 **4.19.65** 版本
2. 固件同步至主线 **4.19.65** 版本
3. 完整支持4B：1G、2G、4G版本均可自动适配识别
4. 基础系统更新至上游8月15日

## 2019.07.24 &nbsp;&nbsp;// **2.0 Beta2 Published.**
1. 内核更新至主线 **4.19.58** 版本
2. 固件同步至主线 **4.19.58** 版本
3. 完整支持4B：1G、2G版本，有限支持4G版本
4. 基础系统更新至上游7月24日

## 2019.07.12 &nbsp;&nbsp;// **v1.0 U10 Released.**
1. 基础 Aarch64(ARM64) 系统镜像(无桌面) U10 [Ext4/Btrfs/F2FS] 全线发布,开放下载
2. 基础 Aarch64(ARM64) 系统镜像(无桌面WebUI增强版) U10 [Ext4/Btrfs/F2FS] 全线发布,开放下载
3. Xface桌面更新至U10
4. Deepin桌面更新U10
5. Docker版本更新至 **18.09.7~3-0**
6. 系统更新至 *Debian Buster* 2019-07-12 最新版本
7. 添加丢失的系统用户组
8. 默认开启NTP服务

* (1): U10将会是V1.0的最后一个版本,在没有重大BUG的情况下将不会再作更新,此版本正式进入锁定状态后的维护序列周期
* (2): V2.0版本未来预计将从Beta升级成为RC候选发布阶段,成为下一个发布的主线版本

## 2019.07.06 &nbsp;&nbsp;// **2.0 Beta Published.**
1. 基础 Aarch64(ARM64) 系统镜像(无桌面)2.0测试版发布
2. 基础 Aarch64(ARM64) 系统镜像(无桌面WebUI增强版)2.0测试版发布
3. 内核更新至长期支持主线最新 *4.19.57*
4. 系统更新至 *Debian Buster* 最新版本
5. WebUI增强版集成tuned
6. 迁移内核修改4.14至4.19.57
7. 优化4.19.57内核
8. 更新自动化构建系统以适应新版需求
9. 修改内核以适应4B单板机硬件
10. 调整内核以适用于全线树莓派64位CPU单板机

## 2019.06.07 &nbsp;&nbsp;// **U9 Plus++ Ext4 Released.**
1. 新增基础镜像U9**加强版**
2. 全面开启Web管理时代，省去终端工具的麻烦，Anytime,Anywhere, 直接使用浏览器管理
3. 默认开启容器服务，开箱即用
4. 集成WEB界面的全方位监控
5. 支持WEB界面查看系统状况、硬件信息、情况等信息
6. 支持WEB界面设置主机名
7. 支持WEB界面设置主机域
8. 支持WEB界面设置主机时间、NTP服务器，更新方式
9. 支持WEB界面关机、重启
10. 支持WEB界面系统日志管理
11. 支持WEB界面系统存储及相关外设管理，在线分区、挂载设备等功能
12. 支持WEB界面网络管理
13. 支持WEB界面系统账户管理
14. 支持WEB界面系统服务管理
15. 支持WEB界面系统更新管理
16. WEB界面集成Shell终端，可以在网页上直接进行终端相关操作
17. 支持跨节点和统一管理：一个界面管理多台设备，大幅度提升管理和工作效率
18. WEB管理通信使用SSL证书加密，保证会话数据的安全性
19. 浏览器使用 **https://你树莓派的IP地址:9090** 访问管理界面
20. 管理界面请使用系统默认账户 **pi** 登录

## 2019.06.02 &nbsp;&nbsp;// *All Released to U9*
1. 内核更新至主线稳定 **4.14.114** 版本
2. 固件更新至主线稳定 **4.14.114** 版本
3. 所有系统升级至主线 **debian 9 arm64 Jun 02 2019**
4. Docker版本更新至 **18.09.6_3**

## 2019.02.24/25 &nbsp;&nbsp;// *All Released to U8*

1. 允许默认**pi**账户直接登录
2. 所有系统升级至主线 **debian 9 arm64 Feb 22 2019**
3. 修正原生蓝牙各种不稳定
4. 裁剪内核 **4.14.98**
5. 修复蓝牙驱动固件补丁路径问题
6. 重新编译并升级Mesa图形库的支持
7. 优化OPEN GLESV2的图形加速支持
8. 优化内核堆栈
9. 优化UDEV的规则支持
10. 所有图形界面系统开启**initrd**支持
11. 修复3B+有线网络Samba速率问题
12. 优化图形化系统plymouth引导画面
13. 图形化系统加入树莓派基地引导画面
14. 基础系统加入基地相关提示信息
15. 优化Xfce图形界面默认设置
16. 修复Xfce图形界面蓝牙、网络图标丢失问题
17. 调整默认CMA内存至64M
18. 调整config.txt默认配置文件设置
19. 调整GPU内核配置默认参数模式
20. 优化GPU 3D加速支持
21. 修复部分状态下系统时间始终为UTC且无法更改的问题
22. 重修矫正系统镜像的4K对齐
23. 修复DNS文件的链接错误问题
24. 更新蓝牙固件
25. 加入蓝牙的管理系统服务守护进程
26. 支持*wpa_supplicant.conf*方式的无线配置
27. 加入dhcpcd5支持
28. *wpa_supplicant.conf* 支持多优先级无线配置和地区码支持
29. 加入bluealsa组件支持
30. 调整图形化系统的语言设置模式
31. 开启Xfce硬件加速窗口合成
32. 开启深度桌面硬件加速窗口合成
33. 优化深度系统的不兼容的硬件加速模式
34. 优化图形化系统Xorg的窗体配置
35. 设置vchiq的权限优化
36. 设置I2C、GPIO的UDEV规则优化
37. 优化蓝牙UDEV规则设置
38. 优化系统默认内存与SWAP交换比例
39. 优化内存使用效率，提升缓存命中率
40. 调整CPU默认模式为动态侦测
41. 添加alsa的vc4-hdmi默认的配置文件支持
42. 优化并调整内核sysctl参数
43. 图形系统默认加入smbclient支持
44. 调整系统*Machine-UUID*初始序列
45. 加入额外的*Xorg Font*字体
46. 加入初始化安装调整脚本
47. 所有镜像已更新至U8版本
48. 调整内核的编译配置的电源选项
49. 调整默认镜像大小
50. 重构镜像文件块生成结构
51. 深度图形界面配置调优
52. Xfce图形界面配置调优

本次更新内容较多，此处仅列出主要内容，不再一一列举
...

## 2019.02.13 &nbsp;&nbsp;// *All Released to U7*

1. 所有镜像已更新至 **U7** 版
2. 内核、固件驱动已更新至 **U7** 版
3. 内核已更新至Linux主线版本: **4.14.98** 
4. 固件驱动已同步更新至主线内核: **4.14.98**
5. 所有系统升级至 **debian 9 arm64** 兼容主线 **Feb 13 2019**
6. **桌面系统**加入终端原生中文实现，使用 **fbterm**
7. **桌面系统**Deepin系统加入 **initrd** 的支持
8. **桌面系统**Deepin系统加入 **引导动画** 支持
9. 优化**基础系统**构建框架
10. **桌面系统**重建 Xface 自动构建系统
11. **桌面系统**重建 Deepin 自动构建系统
12. **桌面系统**调整 Xorg 的结构包

## 2019.02.11 &nbsp;&nbsp;// Deepin Aarch64(ARM64)

1. **Deepin Aarch64(ARM64)** 现已更新至 **2019-02-11-v2019-1.0-U6**
2. 更新内核及固件到 **U6** 版

## 2019.02.07 &nbsp;&nbsp;// Kernel & Firmware

1. 内核已更新至Linux主线版本: **4.14.97** 
2. 固件驱动已同步更新至主线内核: **4.14.97**
3. 修改CMA为默认值

## 2019.02.05 &nbsp;&nbsp;// *All Released to U5*

1. 修复音频热插拔电源问题
2. 去除内核多余的ARMV7支持
3. 调整内核GPU有关CMA的内存交换大小设置
4. 修复bcm2835相关驱动内核重载问题
5. 优化深度桌面rootFS构建结构
6. 优化Xface桌面rootFS构建结构
7. 重新调整构建系统
8. 升级OPENGL驱动
9. 发布基于U5基础系统的深度桌面环境的系统镜像
10. 发布基于U5基础系统的Xface桌面环境的系统镜像
11. 强化内核GPU内存交换效率
12. 优化VC4的内核代码
13. 修正时区设置问题
14. 优化字体缓存
15. 添加对本地终端中文显示的支持
16. 重构桌面系统镜像的构建环境
17. 内核升级至主线 *4.14.95，Jan 30 2019*
18. 系统升级至 *debian 9 arm64* 兼容主线 *Feb 5 2019*

## 2019.02.01 &nbsp;&nbsp;// *Desktop System Image Released U4*

1. **Xface** *Aarch64(ARM64)* 桌面系统镜像U4 **已发布！** (基于U4版基础系统镜像)
2. **Deepin** *Aarch64(ARM64)* 深度桌面系统镜像U4 **已发布！** (基于U4版基础系统镜像)

## 2019-01-31-v2019-1.0-U4 &nbsp;&nbsp;// *Update4*

1. 调整构建系统参数
2. 优化内核GPU驱动
3. 调整内核CMA至32
4. 增大GPU内存交换空间
5. 内核魔改,以兼容深度系统
6. 优化深度系统下内核GPU的效率
7. 系统包更新至Debian稳定主线：2019-01-31

## 2019-01-26-v2019-1.0-U3 &nbsp;&nbsp;// *Update3*

1. 系统内核同步更新至Linux主线长期支持：**4.14.95**
2. 固件 *Firmware *更新至对应内核主线：*4.14.95*
3. 加入内核对 *virtio_pci、virtio_mmio、virtio_gpu* 的支持 
4. 其他内核细微改动
5. 系统包更新至Debian稳定主线：2019-01-26

## 2019-01-18-v2019-1.0-U2 &nbsp;&nbsp;// *Update2*

1. 系统内核同步更新至Linux主线长期支持：**4.14.93**
2. 固件 *Firmware *更新至对应内核主线：*4.14.93*
3. 启用内核对USB连接SCSI设备的支持
4. 更新内核提交内容至0118
5. 增加了对 *shellinabox* 的支持，最新镜像可用
6. 添加了对 *zram* 的支持，以满足一些特殊场景下的需求
7. 最新镜像默认添加了对各类压缩软件格式的支持
8. 最新镜像加入了对vfat分区修复检查工具的支持
9. 新版镜像调整了 *cmdline.txt* 的默认启动参数
10. 新版镜像调整了 *config.txt* 的默认配置模板
11. *Dcoker-CE* 更新至：**18.09.1**
12. 默认开启WebShell，现可以直接使用浏览器登录系统
13. 系统包更新至Debian稳定主线：2019-01-18

## 2019.01.10 &nbsp;&nbsp;// *SoftWare Update*

- **qemu-kvm** 虚拟机更新至 *qemu-2.12+dfsg-3ubuntu9*

## 2019-01-02-v2019-1.0-u1 &nbsp;&nbsp;// *Update1*

1. 系统内核同步更新至Linux主线长期支持：4.14.91
2. 为KVM硬件虚拟化模式加入KSM内核支持（自动开启，无需手动加载）
3. 发布原生Aarch64架构的QEMU虚拟机软件包，支持KVM硬件加速，并提供了默认的*Debian Aarch64*虚拟机镜像
4. 系统包更新至Debian稳定主线：2019-01-02

>**什么是KSM ？**
</br>KSM的原理，是多个进程中，Linux将内核相似的内存页合并成一个内存页
这个特性，被KVM用来减少多个相似的虚拟机的内存占用，提高内存的使用效率由于内存是共享的
所以多个虚拟机使用的内存减少了，这个特性，对于虚拟机使用相同镜像和操作系统时，效果更加明显

## 2018-12-30-v2019-1.0 &nbsp;&nbsp;// *第一版 ( First Edition )*

1. 系统包更新至Debian稳定主线：2018-12-30
2. 使用官方Dcoker-CE 版本已更新至：18.09
3. 固件Firmware已更新至：v1.20181112
4. 无线固件已更新至：2018-08-20官方版
5. 系统内核同步更新至Linux主线长期支持：4.14.90
