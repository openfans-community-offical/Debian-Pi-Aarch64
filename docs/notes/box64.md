Box64 build:
```
cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DARM_DYNAREC=1
```

Install Wine:
```
apt install lib64gcc1-i386-cross libc6-amd64-i386-cross -y
ln -sf /opt/wine64/bin/wine64 /usr/local/bin/wine64
```
