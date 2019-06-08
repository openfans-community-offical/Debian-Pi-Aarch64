#### tuned

```
apt install sysv-rc-conf -y ;\
wget https://mirrors.tuna.tsinghua.edu.cn/debian/pool/main/t/tuned/tuned_2.10.0-1_all.deb ;\
apt install ./tuned_2.10.0-1_all.deb -y ;\
systemctl enable tuned ; systemctl start tuned
```
