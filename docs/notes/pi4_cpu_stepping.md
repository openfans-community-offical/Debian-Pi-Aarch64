# BCM2711 SoC Version about stepping

## 2711ZPKFSB06B0T & 2711ZPKFSB06C0T

The new stepping is "**C0T**" than "**B0T**".

Run the command to check:

```
od -An -tx1 /proc/device-tree/emmc2bus/dma-ranges
```

It will show different output depending on the stepping:

#### B0

````
pi@raspberrypi:~$ od -An -tx1 /proc/device-tree/emmc2bus/dma-ranges
 00 00 00 00 c0 00 00 00 00 00 00 00 00 00 00 00
 40 00 00 00
````

#### C0

```
pi@raspberrypi:~$ od -An -tx1 /proc/device-tree/emmc2bus/dma-ranges
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 fc 00 00 00
 ```
 
In the case of the BCM2711, it looks like the two main fixes are related to RAM addressing:

- 1.The EMMC2 bus can only directly address the first 1GB.
- 2.The PCIe interface can only directly address the first 3GB.

