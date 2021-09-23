## Mount BinderFS

#### 1. Manually mount

```
mkdir /dev/binderfs
mkdir /dev/binder
mount -t binder binder /dev/binderfs
mount -t binder binder /dev/binder
```

#### 2. Auto mount

vim /usr/lib/tmpfiles.d/binder.conf 

```
d!  /dev/binder      0666 root root - -
d!  /dev/binderfs    0666 root root - -
```

Add:

```
none  /dev/binder    binder  nofail  0 0
none  /dev/binderfs  binder  nofail  0 0
```

To **/etc/fstab**
