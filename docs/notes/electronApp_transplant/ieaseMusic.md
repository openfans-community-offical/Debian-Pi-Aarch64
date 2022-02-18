## ieaseMusic
 
**repo** [https://github.com/trazyn/ieaseMusic](https://github.com/trazyn/ieaseMusic)
 
#### Note

```
apt install -y nodejs npm fakeroot
```

**[Upgrade nodejs]**

```
wget -q0- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm ls
nvm ls-remote
nvm install [version.number]
```

```
npm --registry https://registry.npmmirror.com install -g npm
npm  --registry https://registry.npmmirror.com install -g electron-installer-debian --arch=arm64
npm  --registry https://registry.npmmirror.com install -g electron-packager --arch=arm64
npm  --registry https://registry.npmmirror.com install -g electron-builder --arch=arm64
npm  --registry https://registry.npmmirror.com install -g electron-userland --arch=arm64
npm  --registry https://registry.npmmirror.com install -g electron --save-dev --unsafe-perm=true --allow-root --arch=arm64

npm --registry https://registry.npmmirror.com install --production --legacy-peer-deps
//npm  --registry https://registry.npmmirror.com install -D electron-builder  electron-userland --arch=arm64
npm  --registry https://registry.npmmirror.com install -D electron --save-dev --unsafe-perm=true --allow-root --arch=arm64 --legacy-peer-deps
```

```
export "NODE_OPTIONS=--max_old_space_size=2000"

npm run lint //check
//edit     .eslintignore 
//add:    src/js/components/Ripple/VolumeUpDown.js

apt-get install --no-install-recommends -y ruby-full bsdtar rpm libopenjp2-tools -y
gem install fpm -v 1.10.1
export USE_SYSTEM_FPM="true" ; npm run package-linux --electron  --arch=arm64 --legacy-peer-deps
//electron-packager . app --platform linux --arch arm64 --out dist/
//electron-installer-debian --src dist/app-linux-arm64/ --dest dist/installers/ --arch arm64
```
