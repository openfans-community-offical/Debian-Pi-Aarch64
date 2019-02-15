### dmesg

```shell
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.14.98-OPENFANS+20190213-v8 (root@raspbian) (gcc version 6.3.0 20170516 (Debian 6.3.0-18)) #1 SMP Wed Feb 13 21:23:33 CST 2019
[    0.000000] Boot CPU: AArch64 Processor [410fd034]
[    0.000000] Machine model: Raspberry Pi 3 Model B Plus Rev 1.3
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: EFI v2.70 by Raspberry Pi 3 64-bit UEFI
[    0.000000] efi:  ACPI=0x2c160000  ACPI 2.0=0x2c160014  SMBIOS=0x2c000000  SMBIOS 3.0=0x2bfe0000  MEMATTR=0x2eb8a018
[    0.000000] cma: Reserved 256 MiB at 0x000000001bc00000
[    0.000000] On node 0 totalpages: 258048
[    0.000000]   DMA zone: 4032 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 258048 pages, LIFO batch:31
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] percpu: Embedded 23 pages/cpu @ffffffc16ff6f000 s54040 r8192 d31976 u94208
[    0.000000] pcpu-alloc: s54040 r8192 d31976 u94208 alloc=23*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 845719
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 254016
[    0.000000] Kernel command line: 8250.nr_uarts=1 cma=256M bcm2708_fb.fbwidth=1920 bcm2708_fb.fbheight=1080 bcm2708_fb.fbswap=1 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  dwc_otg.lpm_enable=0 console=ttyS0,115200 console=tty1 root=PARTUUID=6915cae5-02 rootfstype=ext4 elevator=deadline fsck.repair=yes net.ifnames=0 cgroup_enable=1 cgroup_memory=1 cgroup_enable=cpuset cgroup_enable=memory swapaccount=1 zswap.enabled=1 zswap.zpool=z3fold zswap.compressor=lz4 zswap.max_pool_percent=20 quiet rootwait cma=256M
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
[    0.000000] Memory: 478084K/1032192K available (9276K kernel code, 1104K rwdata, 3292K rodata, 3392K init, 1031K bss, 291964K reserved, 262144K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     modules : 0xffffff8000000000 - 0xffffff8008000000   (   128 MB)
[    0.000000]     vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000   (   250 GB)
[    0.000000]       .text : 0xffffff8207c80000 - 0xffffff8208590000   (  9280 KB)
[    0.000000]     .rodata : 0xffffff8208590000 - 0xffffff82088d0000   (  3328 KB)
[    0.000000]       .init : 0xffffff82088d0000 - 0xffffff8208c20000   (  3392 KB)
[    0.000000]       .data : 0xffffff8208c20000 - 0xffffff8208d34200   (  1105 KB)
[    0.000000]        .bss : 0xffffff8208d34200 - 0xffffff8208e35ee8   (  1032 KB)
[    0.000000]     fixed   : 0xffffffbefe7fb000 - 0xffffffbefec00000   (  4116 KB)
[    0.000000]     PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000   (    16 MB)
[    0.000000]     vmemmap : 0xffffffbf00000000 - 0xffffffc000000000   (     4 GB maximum)
[    0.000000]               0xffffffbf05000000 - 0xffffffbf05fc0000   (    15 MB actual)
[    0.000000]     memory  : 0xffffffc140000000 - 0xffffffc17f000000   (  1008 MB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] ftrace: allocating 32768 entries in 129 pages
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] arch_timer: cp15 timer(s) running at 19.20MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000003] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.000105] Console: colour dummy device 80x25
[    0.000113] console [tty1] enabled
[    0.100200] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.40 BogoMIPS (lpj=19200)
[    0.100206] pid_max: default: 32768 minimum: 301
[    0.100350] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
[    0.100360] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes)
[    0.101153] ASID allocator initialised with 32768 entries
[    0.101225] Hierarchical SRCU implementation.
[    0.101535] Remapping and enabling EFI services.
[    0.101555]   EFI remap 0x00000000001e0000 => 0000000020000000
[    0.101566]   EFI remap 0x000000002bf70000 => 0000000020020000
[    0.101575]   EFI remap 0x000000002c010000 => 00000000200c0000
[    0.101581]   EFI remap 0x000000002c0c0000 => 0000000020140000
[    0.101587]   EFI remap 0x000000002c170000 => 0000000020190000
[    0.101590]   EFI remap 0x000000002c1b0000 => 00000000201d0000
[    0.101602]   EFI remap 0x000000002c1d0000 => 00000000201f0000
[    0.101612]   EFI remap 0x000000002f550000 => 0000000020290000
[    0.101632]   EFI remap 0x000000002f5f0000 => 0000000020320000
[    0.101814] smp: Bringing up secondary CPUs ...
[    0.102085] Detected VIPT I-cache on CPU1
[    0.102121] CPU1: Booted secondary processor [410fd034]
[    0.102445] Detected VIPT I-cache on CPU2
[    0.102464] CPU2: Booted secondary processor [410fd034]
[    0.102745] Detected VIPT I-cache on CPU3
[    0.102762] CPU3: Booted secondary processor [410fd034]
[    0.102803] smp: Brought up 1 node, 4 CPUs
[    0.102807] SMP: Total of 4 processors activated.
[    0.102811] CPU features: detected feature: 32-bit EL0 Support
[    0.102813] CPU features: detected feature: Kernel page table isolation (KPTI)
[    0.104843] CPU: All CPU(s) started at EL2
[    0.104853] alternatives: patching kernel code
[    0.105355] devtmpfs: initialized
[    0.109153] random: get_random_u32 called from bucket_table_alloc+0xf8/0x288 with crng_init=0
[    0.109625] Enabled cp15_barrier support
[    0.109631] Enabled setend support
[    0.109753] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.109760] futex hash table entries: 1024 (order: 5, 131072 bytes)
[    0.115757] xor: measuring software checksum speed
[    0.125624]    8regs     :  2864.000 MB/sec
[    0.135649]    8regs_prefetch:  2552.000 MB/sec
[    0.145677]    32regs    :  3384.000 MB/sec
[    0.155706]    32regs_prefetch:  2872.000 MB/sec
[    0.155708] xor: using function: 32regs (3384.000 MB/sec)
[    0.155716] pinctrl core: initialized pinctrl subsystem
[    0.156067] SMBIOS 3.1.1 present.
[    0.156089] DMI: Sony 64-bit Raspberry Pi 3B+ (rev. 2A020D3)/64-bit Raspberry Pi 3B+ (rev. 2A020D3), BIOS Raspberry Pi 64-bit UEFI (434b4c2 on 1
[    0.156234] NET: Registered protocol family 16
[    0.158219] cpuidle: using governor menu
[    0.158788] vdso: 2 pages (1 code @ ffffff8208597000, 1 data @ ffffff8208c24000)
[    0.158797] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.159666] DMA: preallocated 256 KiB pool for atomic allocations
[    0.159710] Serial: AMBA PL011 UART driver
[    0.160555] bcm2835-mbox 3f00b880.mailbox: mailbox enabled
[    0.160740] uart-pl011 3f201000.serial: could not find pctldev for node /soc/gpio@7e200000/uart0_pins, deferring probe
[    0.188903] raid6: int64x1  gen()   546 MB/s
[    0.205885] raid6: int64x1  xor()   558 MB/s
[    0.222987] raid6: int64x2  gen()   867 MB/s
[    0.239963] raid6: int64x2  xor()   751 MB/s
[    0.257040] raid6: int64x4  gen()  1261 MB/s
[    0.274046] raid6: int64x4  xor()   953 MB/s
[    0.291100] raid6: int64x8  gen()  1390 MB/s
[    0.308130] raid6: int64x8  xor()   916 MB/s
[    0.325234] raid6: neonx1   gen()   937 MB/s
[    0.342225] raid6: neonx1   xor()  1076 MB/s
[    0.359293] raid6: neonx2   gen()  1496 MB/s
[    0.376302] raid6: neonx2   xor()  1521 MB/s
[    0.393341] raid6: neonx4   gen()  1941 MB/s
[    0.410396] raid6: neonx4   xor()  1830 MB/s
[    0.427442] raid6: neonx8   gen()  2070 MB/s
[    0.444474] raid6: neonx8   xor()  1910 MB/s
[    0.444476] raid6: using algorithm neonx8 gen() 2070 MB/s
[    0.444479] raid6: .... xor() 1910 MB/s, rmw enabled
[    0.444481] raid6: using neon recovery algorithm
[    0.444675] ACPI: Interpreter disabled.
[    0.444762] bcm2835-dma 3f007000.dma: DMA legacy API manager at ffffff800802d000, dmachans=0x1
[    0.445185] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 32
[    0.445263] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 36
[    0.445316] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 40
[    0.445379] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 42
[    0.445474] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 44
[    0.445531] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 48
[    0.445591] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 32
[    0.445740] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 36
[    0.445920] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 40
[    0.446105] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 42
[    0.446286] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 44
[    0.446477] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 48
[    0.446741] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 32
[    0.447311] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 36
[    0.447879] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 40
[    0.448465] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 42
[    0.449117] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 44
[    0.449807] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 48
[    0.450512] arm-lpae io-pgtable: selftest: completed with 18 PASS 0 FAIL
[    0.450665] vgaarb: loaded
[    0.450910] SCSI subsystem initialized
[    0.451003] usbcore: registered new interface driver usbfs
[    0.451023] usbcore: registered new interface driver hub
[    0.451073] usbcore: registered new device driver usb
[    0.451460] raspberrypi-firmware soc:firmware: Attached to firmware from 2019-02-12 19:42
[    0.451506] Registered efivars operations
[    0.452517] clocksource: Switched to clocksource arch_sys_counter
[    0.491876] VFS: Disk quotas dquot_6.6.0
[    0.491920] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.491995] FS-Cache: Loaded
[    0.492105] CacheFiles: Loaded
[    0.492127] pnp: PnP ACPI: disabled
[    0.495694] NET: Registered protocol family 2
[    0.495976] TCP established hash table entries: 8192 (order: 4, 65536 bytes)
[    0.496024] TCP bind hash table entries: 8192 (order: 5, 131072 bytes)
[    0.496118] TCP: Hash tables configured (established 8192 bind 8192)
[    0.496220] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.496237] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.496344] NET: Registered protocol family 1
[    0.496608] RPC: Registered named UNIX socket transport module.
[    0.496610] RPC: Registered udp transport module.
[    0.496612] RPC: Registered tcp transport module.
[    0.496614] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.496619] PCI: CLS 0 bytes, default 128
[    0.497571] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7 counters available
[    0.497638] kvm [1]: 8-bit VMID
[    0.498138] kvm [1]: Hyp mode initialized successfully
[    0.498960] workingset: timestamp_bits=46 max_order=18 bucket_order=0
[    0.501829] zbud: loaded
[    0.502888] FS-Cache: Netfs 'nfs' registered for caching
[    0.503152] NFS: Registering the id_resolver key type
[    0.503168] Key type id_resolver registered
[    0.503169] Key type id_legacy registered
[    0.503177] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.505464] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    0.505564] io scheduler noop registered
[    0.505566] io scheduler deadline registered (default)
[    0.505653] io scheduler cfq registered
[    0.505656] io scheduler mq-deadline registered
[    0.505658] io scheduler kyber registered
[    0.506928] efifb: probing for efifb
[    0.507022] efifb: framebuffer at 0x3dc0a000, using 8100k, total 8100k
[    0.507024] efifb: mode is 1920x1080x32, linelength=7680, pages=1
[    0.507025] efifb: scrolling: redraw
[    0.507030] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.515361] Console: switching to colour frame buffer device 240x67
[    0.523073] fb0: EFI VGA frame buffer device
[    0.623504] Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled
[    0.624148] bcm2835-rng 3f104000.rng: hwrng registered
[    0.624232] vc-mem: phys_addr:0x00000000 mem_base=0x3ec00000 mem_size:0x40000000(1024 MiB)
[    0.624530] gpiomem-bcm2835 3f200000.gpiomem: Initialised: Registers at 0x3f200000
[    0.624777] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    0.629567] brd: module loaded
[    0.633558] loop: module loaded
[    0.633565] Loading iSCSI transport class v2.0-870.
[    0.633938] libphy: Fixed MDIO Bus: probed
[    0.633985] usbcore: registered new interface driver lan78xx
[    0.634011] usbcore: registered new interface driver smsc95xx
[    0.634017] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
[    0.634186] dwc_otg 3f980000.usb: base=0x082d0000
[    0.834278] Core Release: 2.80a
[    0.834281] Setting default values for core params
[    0.834296] Finished setting default values for core params
[    1.034412] Using Buffer DMA mode
[    1.034414] Periodic Transfer Interrupt Enhancement - disabled
[    1.034416] Multiprocessor Interrupt Enhancement - disabled
[    1.034418] OTG VER PARAM: 0, OTG VER FLAG: 0
[    1.034423] Dedicated Tx FIFOs mode
[    1.034721] WARN::dwc_otg_hcd_init:1046: FIQ DMA bounce buffers: virt = 0x08201000 dma = 0xdbc44000 len=9024
[    1.034733] FIQ FSM acceleration enabled for :
               Non-periodic Split Transactions
               Periodic Split Transactions
               High-Speed Isochronous Endpoints
               Interrupt/Control Split Transaction hack enabled
[    1.034735] dwc_otg: Microframe scheduler enabled
[    1.034759] WARN::hcd_init_fiq:486: MPHI regs_base at 0x08055000
[    1.034787] dwc_otg 3f980000.usb: DWC OTG Controller
[    1.034800] dwc_otg 3f980000.usb: new USB bus registered, assigned bus number 1
[    1.034814] dwc_otg 3f980000.usb: irq 15, io mem 0x00000000
[    1.034847] Init: Port Power? op_state=1
[    1.034849] Init: Power Port (0)
[    1.034998] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    1.035002] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.035005] usb usb1: Product: DWC OTG Controller
[    1.035008] usb usb1: Manufacturer: Linux 4.14.98-OPENFANS+20190213-v8 dwc_otg_hcd
[    1.035011] usb usb1: SerialNumber: 3f980000.usb
[    1.035288] hub 1-0:1.0: USB hub found
[    1.035312] hub 1-0:1.0: 1 port detected
[    1.035569] dwc_otg: FIQ enabled
[    1.035571] dwc_otg: NAK holdoff enabled
[    1.035573] dwc_otg: FIQ split-transaction FSM enabled
[    1.035580] Module dwc_common_port init
[    1.035702] usbcore: registered new interface driver usb-storage
[    1.035794] IR NEC protocol handler initialized
[    1.035796] IR RC5(x/sz) protocol handler initialized
[    1.035798] IR RC6 protocol handler initialized
[    1.035800] IR JVC protocol handler initialized
[    1.035801] IR Sony protocol handler initialized
[    1.035803] IR SANYO protocol handler initialized
[    1.035805] IR Sharp protocol handler initialized
[    1.035806] IR MCE Keyboard/mouse protocol handler initialized
[    1.035808] IR XMP protocol handler initialized
[    1.036403] bcm2835-wdt 3f100000.watchdog: Broadcom BCM2835 watchdog timer
[    1.036534] bcm2835-cpufreq: min=1500000 max=1500000
[    1.036718] sdhci: Secure Digital Host Controller Interface driver
[    1.036720] sdhci: Copyright(c) Pierre Ossman
[    1.036882] mmc-bcm2835 3f300000.mmc: could not get clk, deferring probe
[    1.037007] sdhost-bcm2835 3f202000.mmc: could not get clk, deferring probe
[    1.037047] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.038070] ledtrig-cpu: registered to indicate activity on CPUs
[    1.038184] hidraw: raw HID events driver (C) Jiri Kosina
[    1.038246] usbcore: registered new interface driver usbhid
[    1.038248] usbhid: USB HID core driver
[    1.038722] vchiq: vchiq_init_state: slot_zero = ffffff80082ed000, is_master = 0
[    1.039929] Initializing XFRM netlink socket
[    1.039945] NET: Registered protocol family 17
[    1.040001] Key type dns_resolver registered
[    1.040545] registered taskstats version 1
[    1.040749] zswap: loaded using pool lz4/z3fold
[    1.041537] Btrfs loaded, crc32c=crc32c-generic
[    1.044373] uart-pl011 3f201000.serial: cts_event_workaround enabled
[    1.044433] 3f201000.serial: ttyAMA0 at MMIO 0x3f201000 (irq = 72, base_baud = 0) is a PL011 rev2
[    1.045186] console [ttyS0] disabled
[    1.045202] 3f215040.serial: ttyS0 at MMIO 0x0 (irq = 151, base_baud = 70000000) is a 16550
[    1.045228] console [ttyS0] enabled
[    1.045643] mmc-bcm2835 3f300000.mmc: mmc_debug:0 mmc_debug2:0
[    1.045646] mmc-bcm2835 3f300000.mmc: DMA channel allocated
[    1.069866] sdhost: log_buf @ ffffff80080cd000 (dbc43000)
[    1.112059] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
[    1.113551] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    1.115039] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    1.115515] mmc0: sdhost-bcm2835 loaded - DMA enabled (>1)
[    1.116134] of_cfs_init
[    1.116160] of_cfs_init: OK
[    1.116405] Waiting for root device PARTUUID=6915cae5-02...
[    1.137708] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
[    1.207607] random: fast init done
[    1.212283] mmc1: new high speed SDIO card at address 0001
[    1.241554] Indeed it is in host mode hprt0 = 00021501
[    1.415520] usb 1-1: new high-speed USB device number 2 using dwc_otg
[    1.415595] Indeed it is in host mode hprt0 = 00001101
[    1.601666] usb 1-1: New USB device found, idVendor=0424, idProduct=2514
[    1.601670] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.601925] hub 1-1:1.0: USB hub found
[    1.601979] hub 1-1:1.0: 4 ports detected
[    1.885514] usb 1-1.1: new high-speed USB device number 3 using dwc_otg
[    1.973656] usb 1-1.1: New USB device found, idVendor=0424, idProduct=2514
[    1.973660] usb 1-1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.973868] hub 1-1.1:1.0: USB hub found
[    1.973922] hub 1-1.1:1.0: 3 ports detected
[    2.261517] usb 1-1.1.2: new low-speed USB device number 4 using dwc_otg
[    2.359229] usb 1-1.1.2: New USB device found, idVendor=046d, idProduct=c016
[    2.359233] usb 1-1.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.359236] usb 1-1.1.2: Product: Optical USB Mouse
[    2.359239] usb 1-1.1.2: Manufacturer: Logitech
[    2.383214] input: Logitech Optical USB Mouse as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:046D:C016.0001/input/input0
[    2.383295] hid-generic 0003:046D:C016.0001: input,hidraw0: USB HID v1.10 Mouse [Logitech Optical USB Mouse] on usb-3f980000.usb-1.1.2/input0
[    2.536223] random: crng init done
[    2.594514] usb 1-1.1.3: new low-speed USB device number 5 using dwc_otg
[    2.699606] usb 1-1.1.3: New USB device found, idVendor=1c4f, idProduct=0002
[    2.699610] usb 1-1.1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.699613] usb 1-1.1.3: Product: USB Keyboard
[    2.699616] usb 1-1.1.3: Manufacturer: SIGMACHIP
[    2.708018] input: SIGMACHIP USB Keyboard as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.3/1-1.1.3:1.0/0003:1C4F:0002.0002/input/input1
[    2.759716] hid-generic 0003:1C4F:0002.0002: input,hidraw1: USB HID v1.10 Keyboard [SIGMACHIP USB Keyboard] on usb-3f980000.usb-1.1.3/input0
[    2.762518] usb 1-1.2: new high-speed USB device number 6 using dwc_otg
[    2.767890] input: SIGMACHIP USB Keyboard as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.3/1-1.1.3:1.1/0003:1C4F:0002.0003/input/input2
[    2.819583] hid-generic 0003:1C4F:0002.0003: input,hidraw2: USB HID v1.10 Device [SIGMACHIP USB Keyboard] on usb-3f980000.usb-1.1.3/input1
[    2.931195] usb 1-1.2: New USB device found, idVendor=0080, idProduct=a001
[    2.931199] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    2.931202] usb 1-1.2: Product: External USB 3.0
[    2.931205] usb 1-1.2: Manufacturer: TOSHIBA
[    2.931208] usb 1-1.2: SerialNumber: 2015033100063
[    2.931473] usb 1-1.2: The driver for the USB controller dwc_otg_hcd does not support scatter-gather which is
[    2.931477] usb 1-1.2: required by the UAS driver. Please try an other USB controller if you wish to use UAS.
[    2.931480] usb-storage 1-1.2:1.0: USB Mass Storage device detected
[    2.931721] scsi host0: usb-storage 1-1.2:1.0
[    3.006515] usb 1-1.1.1: new high-speed USB device number 7 using dwc_otg
[    3.094747] usb 1-1.1.1: New USB device found, idVendor=0424, idProduct=7800
[    3.094751] usb 1-1.1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    3.357867] libphy: lan78xx-mdiobus: probed
[    3.361360] lan78xx 1-1.1.1:1.0 (unnamed net_device) (uninitialized): int urb period 64
[    3.937868] scsi 0:0:0:0: Direct-Access     TO Exter nal USB 3.0      0203 PQ: 0 ANSI: 6
[    3.938295] sd 0:0:0:0: [sda] 468862128 512-byte logical blocks: (240 GB/224 GiB)
[    3.938543] sd 0:0:0:0: [sda] Write Protect is off
[    3.938548] sd 0:0:0:0: [sda] Mode Sense: 47 00 00 08
[    3.938767] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    3.939983]  sda: sda1 sda2
[    3.940965] sd 0:0:0:0: [sda] Attached SCSI disk
[    3.970436] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
[    3.970471] VFS: Mounted root (ext4 filesystem) readonly on device 8:2.
[    3.971111] devtmpfs: mounted
[    3.974857] Freeing unused kernel memory: 3392K
[    4.249763] systemd[1]: System time before build time, advancing clock.
[    4.322516] NET: Registered protocol family 10
[    4.323117] Segment Routing with IPv6
[    4.329954] ip_tables: (C) 2000-2006 Netfilter Core Team
[    4.368698] systemd[1]: systemd 232 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    4.369116] systemd[1]: Detected architecture arm64.
[    4.369616] systemd[1]: Set hostname to <raspbian>.
[    4.643399] systemd[1]: Created slice User and Session Slice.
[    4.643747] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    4.643815] systemd[1]: Reached target User and Group Name Lookups.
[    4.644004] systemd[1]: Listening on Journal Socket.
[    4.644998] systemd[1]: Created slice System Slice.
[    4.647811] systemd[1]: Starting Restore / save the current clock...
[    4.649114] systemd[1]: Created slice system-serial\x2dgetty.slice.
[    4.781863] aufs 4.14.73+-20181217
[    4.825743] nf_conntrack version 0.5.0 (6144 buckets, 24576 max)
[    4.859777] IPVS: Registered protocols (TCP, UDP, SCTP, AH, ESP)
[    4.859976] IPVS: Connection hash table configured (size=4096, memory=64Kbytes)
[    4.978556] IPVS: ipvs loaded.
[    5.094817] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
[    5.099171] Bridge firewalling registered
[    5.143374] fbtft: module is from the staging directory, the quality is unknown, you have been warned.
[    5.395482] EXT4-fs (sda2): re-mounted. Opts: (null)
[    5.445208] systemd-journald[125]: Received request to flush runtime journal from PID 1
[    5.550009] Adding 1048572k swap on /swapfile.  Priority:-2 extents:6 across:1646588k FS
[    5.730293] rtc-efi rtc-efi: rtc core: registered rtc-efi as rtc0
[    5.733043] EFI Variables Facility v0.08 2004-May-17
[    5.896876] snd_bcm2835: module is from the staging directory, the quality is unknown, you have been warned.
[    5.899079] bcm2835_alsa bcm2835_alsa: card created with 8 channels
[    6.198928] usbcore: registered new interface driver uas
[    6.204934] vc4-drm soc:gpu: bound 3f600000.firmwarekms (ops vc4_fkms_ops [vc4])
[    6.219749] vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
[    6.219800] checking generic (3dc0a000 7e9000) vs hw (0 ffffffffffffffff)
[    6.219802] fb: switching to vc4drmfb from EFI VGA
[    6.219984] Console: switching to colour dummy device 80x25
[    6.225440] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
[    6.225450] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    6.225452] [drm] Driver supports precise vblank timestamp query.
[    6.240882] Console: switching to colour frame buffer device 240x67
[    6.250041] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    6.254209] brcmfmac: brcmf_fw_map_chip_to_name: using brcm/brcmfmac43455-sdio.bin for chip 0x004345(17221) rev 0x000006
[    6.254625] usbcore: registered new interface driver brcmfmac
[    6.279378] vc4-drm soc:gpu: fb0:  frame buffer device
[    6.468141] brcmfmac: brcmf_c_preinit_dcmds: Firmware version = wl0: Feb 27 2018 03:15:32 version 7.45.154 (r684107 CY) FWID 01-4fbe0b04
[    6.468829] brcmfmac: brcmf_c_preinit_dcmds: CLM version = API: 12.2 Data: 9.10.105 Compiler: 1.29.4 ClmImport: 1.36.3 Creation: 2018-03-09 18:56:28
[    8.843163] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[    8.843450] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[    8.878183] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[    8.902840] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[    8.902854] brcmfmac: power management disabled
[    9.412287] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[    9.412298] brcmfmac: power management disabled
[    9.621830] NET: Registered protocol family 3
[    9.660152] NET: Registered protocol family 5
[    9.877761] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[   15.573154] uart-pl011 3f201000.serial: no DMA platform data
[   15.672787] Bluetooth: Core ver 2.22
[   15.672943] NET: Registered protocol family 31
[   15.672946] Bluetooth: HCI device and connection manager initialized
[   15.672982] Bluetooth: HCI socket layer initialized
[   15.672998] Bluetooth: L2CAP socket layer initialized
[   15.673044] Bluetooth: SCO socket layer initialized
[   15.688113] Bluetooth: HCI UART driver ver 2.3
[   15.688134] Bluetooth: HCI UART protocol H4 registered
[   15.688137] Bluetooth: HCI UART protocol Three-wire (H5) registered
[   15.688724] Bluetooth: HCI UART protocol Broadcom registered
[   15.720105] brcmfmac: power management disabled
[   16.025789] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   16.025796] Bluetooth: BNEP filters: protocol multicast
[   16.025809] Bluetooth: BNEP socket layer initialized
[   29.920312] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[   29.920323] brcmfmac: power management disabled
[   30.104546] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[   36.684941] Bluetooth: RFCOMM TTY layer initialized
[   36.684969] Bluetooth: RFCOMM socket layer initialized
[   36.685014] Bluetooth: RFCOMM ver 1.11
```
