#### sysbench-1.0.17 build

```
./autogen.sh
./configure --build=aarch64-unknown-linux-gnu \
--with-mysql-libs=/usr/lib/aarch64-linux-gnu \
--with-mysql-includes=/usr/include/mariadb \
--with-mysql
make
```
