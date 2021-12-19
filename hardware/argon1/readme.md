## Argon one m.2

- **1. Install** (Also include IR)

```
curl https://download.argon40.com/argon1.sh | bash
reboot
```

- **2. PowerButton**

|ARGON ONE Pi4 STATE|ACTION|FUNCTION|
|----|----|----|
|OFF|Short Press|Turn ON|
|ON|LongPress(>=3s)|Soft Shutdown and Power Cut|
|ON|Shortpress(<3s)|Nothing|
|ON|Double tap|Reboot|
|ON|LongPress(>=5s)|Forced Shutdown|

- **3. Fan Speed**

|CPUTEMP|FANPOWER|
|----|----|
|55C|10%|
|60C|55%|
|65C|100%|

- **4. Commands**

**Config fan**

```
argonone-config
```

**Remove**

```
argonone-uninstall
```

To configure the **Infrared Receiver ON/OFF signal of Argon ONEV2 andM.2** type in the Terminal App:

```
argonone-ir
```

- **IR Kodi Add-ons**

Install zip file: **ArgonRemote.zip**
