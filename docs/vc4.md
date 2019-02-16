# VideocoreIV Glamor on your Raspberry Pi

Running an X (Xorg) server on your Raspberry Pi is frustrating. You can either use the fbdev or fbturbo driver which will give an un-accelerated 2D environment with swrast 3D (OpenGL) all beating your poor RPi’s CPU. Overclocking it will only help you so much which is a pity considering that there is another layer on the SoC that would be perfect for that but is now unused.

Enter the VideocoreIV (VC4) and Eric Anholt (formally of Intel, now of Broadcom), who are going to breath new life into the RPi. The idea is to offload the 2D rendering, via Glamor, to the VC4 with OpenGL calls. Since a OpenGL stack needs to exist, that means there will be a Direct Rendering Manager (DRM) Linux kernel module and Gallium/DRI module in Mesa.

This is happening now, here is the current status of support via the Piglit test-suite: skip 19102, fail 3866, pass 3146, crash 153, total 26267

While we skip a great deal of tests, they are because some extensions are not yet implemented. Of those implemented, almost half of the tests are passing! Wrapping up the crashed and failed tests will help add stability to the OpenGL stack that will lead to the eventual use of the VC4 as an everyday use of the RPi.

If you would like to follow along from home, and I suggest you do as there are updates almost every day, then you can see the progress for yourself! The end result, at least for me, is to see OpenMW running on the RPi with full OpenGL acceleration under X. Eric has left some low-hanging fruit for new and would be contributors to help out! I’ll provide a check-list of things you’ll need, best practices and ways that you can help too.

## Phase 1: Setting up your RPi workbench

You’ll need an RPi, running the latest Raspbian “Jessie” release. Setup a ‘dev’ directory under your account. Optionally, but highly recommended is to set this dev directory up as an NFS mountpoint so that your compiling/working is not ruining your SD-card with constant writes.

## Phase 2: Getting the VC4 kernel driver

At this point, you’ll need to git clone Eric’s fork of the kernel and get familiar with building your own kernel. You’ll need do the following:


- sudo apt-get install git build-essential ncurses-dev
- git clone -b vc4 –depth=10 https://github.com/anholt/linux.git
- cd linux; zcat /proc/config.gz > .config; make oldconfig

The basic idea is that you are cloning his specific branch and not the whole tree, otherwise your just wasting time. You’ll pull in your running kernel’s config and bring it up to date with what is new in Eric’s VC4 branch.

You’ll also need to modify a few things in the .config file, first:
CONFIG_CMA_SIZE_MBYTES=5 –> CONFIG_CMA_SIZE_MBYTES=64
This needs to be set to, at least, 64 since 5 is NOT enough for the VC4 kernel module. The VC4 DRM module on the other hand is best, currently at least, to be built into the kernel. You’ll need to turn on DRM and VC4 like below.

```shell
#
# Direct Rendering Manager
#
CONFIG_DRM=y
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_KMS_FB_HELPER=y
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_KMS_CMA_HELPER=y

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
# CONFIG_DRM_I2C_SIL164 is not set
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_UDL is not set
# CONFIG_DRM_ARMADA is not set
# CONFIG_DRM_RCAR_DU is not set
# CONFIG_DRM_SHMOBILE is not set
# CONFIG_DRM_PTN3460 is not set
CONFIG_DRM_VC4=y
```

If you don’t wish to do this by hand, just give the ‘make menuconfig’ a spin and you’ll work through the options available there. A this point, you should be ready to build your kernel. The first time around will take a while.

```shell
make; make modules; make modules_install
```

After it is finished, time to copy your newly baked kernel and copy it to /boot to be usable. If you screw up, and your RPi no longer boots, just insert your SD-card into a FAT readable machine and edit the config.txt file to point to the old kernel since we’ll be moving it out-of-the-way first.

```shell
sudo mv /boot/kernel.img /boot/kernel.img.orig; sudo cp arch/arm/boot/zImage /boot/kernel.img; sync
```

At this point, cross your fingers and reboot your RPi. If it comes back online, check your dmesg for the following output:

```shell
[ 1.267449] BCM2708FB: allocated DMA memory 58400000
[ 1.272631] BCM2708FB: allocated DMA channel 0 @ f2007000
[ 1.298488] Console: switching to colour frame buffer device 200×75
[ 1.320303] uart-pl011 dev:f1: no DMA platform data
[ 1.325906] vc-cma: Videocore CMA driver
[ 1.330043] vc-cma: vc_cma_base = 0x00000000
[ 1.334843] vc-cma: vc_cma_size = 0x00000000 (0 MiB)
[ 1.340424] vc-cma: vc_cma_initial = 0x00000000 (0 MiB)
[ 1.346345] [drm] Initialized drm 1.1.0 20060810
[ 1.361836] vc4-drm vc4-drm.0: fb1: frame buffer device
[ 1.367283] vc4-drm vc4-drm.0: registered panic notifier
[ 1.372819] [drm] Initialized vc4 0.0.0 20140616 on minor 0
```

At this point, you are good to go! The glue between VC4 and userland is ready to be abused! Keep in mind, if there are updates on the linux side, git pull and rebuild your kernel and modules. Don’t forget to install both! Thankfully this doesn’t happen often as most of the work happens in Mesa.

## Phase 3: Getting Mesa and building the VC4 Gallium DRM

This is pretty straight forward, if you know the right magic during configuration. We’ve (Eric and I) finally nailed with is necessary to build and get working.

```shell
sudo apt-get install xorg-dev libgl1-mesa-dev libgles1-mesa-dev libgles2-mesa-dev libglu1-mesa-dev xutils-dev xserver-xorg-dev
git clone –depth=10 git://anongit.freedesktop.org/mesa/mesa
cd mesa; autoreconf -v –install
./autogen.sh \
--prefix=$HOME/prefix \
--with-gallium-drivers=vc4,swrast \
--enable-gles1 \
--enable-gles2 \
--with-egl-platforms=x11,drm \
--enable-glx-tls \
--enable-dri \
--with-dri-drivers=swrast \
--enable-shared-glapi \
--enable-texture-float \
--with-log-dir=/var/log \
--prefix=/usr \
--libdir=/usr/lib/arm-linux-gnueabihf

make; sudo make install
```

What is going on here is that you need to install some development headers so that you can build your Mesa drivers that will be used with Xorg. You might need to install more packages, if so, please notify me but these should work and configuration shouldn’t fail. At the end of the configuration, it should give you an output of everything it will do during compilation. Yours should look like mine:

```shell
prefix: /usr
exec_prefix: ${prefix}
libdir: ${exec_prefix}/lib
includedir: ${prefix}/include

OpenGL: yes (ES1: yes ES2: yes)
OpenVG: no

OSMesa: no

DRI platform: drm
DRI drivers: swrast
DRI driver dir: ${libdir}/dri
GLX: DRI-based

EGL: yes
EGL platforms: x11 drm
EGL drivers: builtin:egl_dri2

llvm: no

Gallium: yes

Shared libs: yes
Static libs: no
Shared-glapi: yes

CFLAGS: -g -O2 -Wall -std=c99 -Werror=implicit-function-declaration -Werror=missing-prototypes -fno-strict-aliasing -fno-builtin-memcmp
CXXFLAGS: -g -O2 -Wall -fno-strict-aliasing -fno-builtin-memcmp
Macros: -DUSE_EXTERNAL_DXTN_LIB=1 -D_GNU_SOURCE -DTEXTURE_FLOAT_ENABLED -DHAVE_DLOPEN -DHAVE_POSIX_MEMALIGN -DHAVE_LIBDRM -DGLX_USE_DRM -DHAVE_LIBUDEV -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_TLS -DHAVE_ALIAS -DHAVE_DRI3 -DHAVE_MINCORE

PYTHON2: python2
```

## Phase 4: Piglit testing

This is the part that will tell you that everything you’ve done up to this point hasn’t been in vain. Piglit is a OpenGL test-suite that is very thorough. You’ll use this when developing, to test against.

```shell
sudo apt-get install libwaffle-dev python-dev
git clone –depth=10 git://anongit.freedesktop.org/git/piglit
cd piglit; cmake -DPIGLIT_BUILD_GLES2_TESTS=TRUE .
PIGLIT_PLATFORM=gbm ./bin/shader_runner tests/shaders/glsl-algebraic-add-add-1.shader_test -auto -fbo
```

After running the individual test, you should get something like this:

```shell
PIGLIT: {“result”: “pass” }
```

Don’t mind the rather noisy MESA-LOADER issues, the RPi doesn’t have a PCI bus. Congratulations, you’re now utilizing your VC4! Happy hacking!

For additional output, debug information and trace level QIR calls, try running the former command like this:

```shell
PIGLIT_PLATFORM=gbm VC4_DEBUG=qir ./bin/shader_runner tests/shaders/glsl-algebraic-add-add-1.shader_test -auto -fbo
```

```shell
MESA-LOADER: malformed or no PCI ID
MESA-LOADER: malformed or no PCI ID
libEGL debug: Native platform type: drm (environment overwrite)
libEGL debug: EGL search path is /usr/lib/arm-linux-gnueabihf/egl
libEGL debug: added /usr/lib/arm-linux-gnueabihf/egl/egl_gallium.so to module array
libEGL debug: added egl_dri2 to module array
libEGL debug: dlopen(/usr/lib/arm-linux-gnueabihf/egl/egl_gallium.so)
libEGL info: use DRM for display 0x16a1568
libEGL debug: EGL user error 0x3001 (EGL_NOT_INITIALIZED) in eglInitialize(no usable display)

libEGL debug: the best driver is DRI2
QIR:
mov t2, u2
mov t3, u3
mov t4, u4
mov t5, u5
fadd t6, u0, t2
fadd t7, u1, t3
fadd t8, u1, t4
fadd t9, u1, t5
pack_colors t15, t6, t7, t8, t9
tlb_color null, t15
…
PIGLIT: {“result”: “pass” }
```

Now on to the real work, as Eric describes it in his LJ article helping out with VC4:

>Now the actual work: I’ve left some of the TGSI opcodes unfinished (SCS, DST, DPH, and XPD, for example), so the driver just aborts when a shader tries to use them. How they work is described in src/gallium/docs/source/tgsi.rst. The TGSI-to_QIR code is in vc4_program.c (where you’ll find all the opcodes that are implemented currently), and vc4_qir.h has all the opcodes that are available to you and helpers for generating them. Once it’s in QIR (which I think should have all the opcodes you need for this work), vc4_qpu_emit.c will turn the QIR into actual QPU code like you find described in the chip specs.

## Phase 5: Bonus Round — Modesetting Xorg driver

You’re likely thinking, right… all this work and how do I get it into Xorg’s driver seat? The answer is the ‘modesetting’ driver which acts as the glue to getting X talking with Glamor. Be warned though, there isn’t anything usable yet. This might change though in a month or two so keep an eye on this. Who knows, glxgears might be just around the corner!

- git clone git://people.freedesktop.org/~anholt/xf86-video-modesetting
- ./configure –prefix=/usr
- make; sudo make install

You’ll need to create an xorg.conf file and run startx to see anything. However, be again warned, if you do this, the VC4 will be in an unknown state afterwards and likely need a reboot of your RPi.

sudo vim /etc/X11/xorg.conf

```shell
Section "Module"
  Load "glamoregl"
  Load "glx"
EndSection

Section "Device"
  Identifier "Default screen"
  Driver "modesetting" # you can change this back to fbdev
  Option "ForceGallium" "True"
  Option "AccelMethod" "glamor"
EndSection

Section "dri"
  Mode 0666
EndSection
```

As always, you should also keep up to date with what Eric has been up to here: http://anholt.livejournal.com/

This wraps up hacking the VC4 on your Raspberry Pi boot-camp and I hope it was useful enough to get you started in the right direction.
