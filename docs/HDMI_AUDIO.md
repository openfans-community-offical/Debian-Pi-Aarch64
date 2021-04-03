#### Kernel 5.10.x (armhf_test)

KMS also comes with its own arm-side HDMI audio driver. If you want to test this, then remove dtparam=audio=on from config.txt
Replace /usr/share/alsa/cards/vc4-hdmi.conf with the contents here:

```
# Configuration for the VC4-HDMI sound card using software IEC958
# subframe conversion

<confdir:pcm/hdmi.conf>
vc4-hdmi.pcm.hdmi.0 {
	@args [ CARD AES0 AES1 AES2 AES3 ]
	@args.CARD {
		type string
	}
	@args.AES0 {
		type integer
	}
	@args.AES1 {
		type integer
	}
	@args.AES2 {
		type integer
	}
	@args.AES3 {
		type integer
	}
	type iec958
	slave {
		format IEC958_SUBFRAME_LE
		pcm {
			type hooks
			slave.pcm {
				type hw
				card $CARD
				device 0
			}
			hooks.0 {
				type ctl_elems
				hook_args [
				{
					name "IEC958 Playback Default"
					optional true
					lock true
					preserve true
					value [ $AES0 $AES1 $AES2 $AES3 ]
				}
				]
			}
		}
	}
	status [ $AES0 $AES1 $AES2 $AES3 ]
}

# default with plug
vc4-hdmi.pcm.default {
	@args [ CARD ]
	@args.CARD {
		type string
	}
	type plug
	slave.pcm {
		type softvol
		slave.pcm {
			@func concat
			strings [ "hdmi:" $CARD ]
		}
		control {
			name "PCM Playback Volume"
			card $CARD
		}
	}
}
```

and you should havea new alsa device. (Only available when running with dtoverlay=vc4-kms-v3d).

