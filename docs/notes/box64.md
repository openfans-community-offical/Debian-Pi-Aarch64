Build with:

cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DARM_DYNAREC=1

----

```
Library libgcc_s.so.1 (0x911fa4d0) needs 0x911bca50, but it was not found. Ignoring.
Library libm.so.6 (0x911f9260) needs 0x911bca50, but it was not found. Ignoring.
Library libc.so.6 (0x911ad2a0) needs 0x9128f930, but it was not found. Ignoring.
Library libc.so.6 (0x911ad2a0) needs 0x911bca50, but it was not found. Ignoring.
Library libdl.so.2 (0x911ac0b0) needs 0x9128f930, but it was not found. Ignoring.
Library libdl.so.2 (0x911ac0b0) needs 0x911bca50, but it was not found. Ignoring.
Library libpthread.so.0 (0x911a9aa0) needs 0x911bca50, but it was not found. Ignoring.

apt install lib64gcc1-i386-cross libc6-amd64-i386-cross
cp -rf /usr/i686-linux-gnu/lib64/* /opt/wine64/lib64/
```
