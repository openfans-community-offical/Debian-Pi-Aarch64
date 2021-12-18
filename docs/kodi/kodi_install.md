- **Just run commands bellow with root user:**

```shell
version=$(apt-cache madison kodi|awk '{print $3}'|sort|tail -n1); \
echo "Check kodi backports version is :$version"; \
apt install -y kodi=$version kodi-bin=$version kodi-data=$version \
libspdlog1=$(apt-cache madison libspdlog1|awk '{print $3}'|sort|tail -n1) \
libfmt-dev=$(apt-cache madison libfmt-dev|awk '{print $3}'|sort|tail -n1); \
apt install -y kodi-pvr-iptvsimple
```

Enjoy :)
