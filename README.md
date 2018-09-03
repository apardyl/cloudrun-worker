# cloudrun-worker
Worker for cloudrun

**WARNING: this project is under development,, there are many issues to be
addressed (including major security vulnerabilities), DO NOT USE IN PRODUCTION ENVIRONMENT**

## Requirements
* lxc >= 3.0.0
* bash, sed, iproute2, coreutils (installed by default by most distributions)
* [cloudrun-fs](https://github.com/apardyl/cloudrun-fs)

## Install
```bash
git clone --recurse-submodules https://github.com/apardyl/cloudrun-worker.git
cd cloudrun-client
make -j"$(nproc)"
sudo make install
```

## Configuration
All configuration is located in `/etc/cloudrun`. Things you most likely want to change:
* `/etc/cloudrun/worker.conf`
  * HASH_STORE_DIR - this defines hash-based file cache, for most setups
       this will be shared between every running worker (likely on a network storage).
  * PRIVATE_STORE_DIR - private cache, **unique for every client** *WARNING: current version does not support auto-mounting, place it on a temporary storage!*
* `/etc/cloudrun/lxc/cloudrun/config` - configure internet access, consult lxc documentation for more info.
* `/etc/cloudrun/override` - directory contains files to be placed in worker's rootfs, overriding those provided by the client.
  * `/etc/cloudrun/override/etc/resolv.conf` - set DNS server.

Beside of the worker's configuration you must also enable ssh access for the client to connect.

## Usage
Connect with the [cloudrun-client](https://github.com/apardyl/cloudrun-client) and run your tasks in cloud seamlessly!
