## Full KMS Support

Require Kernel Version >= **5.10.79-Release-OPENFANS+20211117-v8**

1.Edit Config.txt, change all "**dtoverlay=vc4-fkms-v3d,cma-256**" to "**dtoverlay=vc4-kms-v3d,cma-256**" ;

2.Add "**disable_fw_kms_setup=1**" to Config.txt

----

#### Note:

The log of dmesg:

```
...
vc4_hdmi fef00700.hdmi: Could not register sound card: -517
...
hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_startup on i2s-hifi: -19
...
```

These "**errors**" are expected and can be **ignored**.
