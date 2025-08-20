# ProvisionOS

Kiwix Hotspot H1 Bootable disk image running [provisioner](https://github.com/offspot/provisioner).

[![CodeFactor](https://www.codefactor.io/repository/github/offspot/provision-os/badge)](https://www.codefactor.io/repository/github/offspot/provision-os)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## What's this?

It's goal is to *simplify* the process of *provisioning* a Kiwix Hotspot H1.
We call *provisioning* the act of flashing a Kiwix Hotspot OS onto the disk and making some other adjustments.

Most likely **you don't need this tool** as this is specific to the H1 device and process.
It's only useful for those flashing Kiwix Hotspot in a row from a batch of pre-assembled devices.

Feel free to use and customize it though 😊. You're welcome to contribute as well ([contributing guidelines](https://github.com/openzim/overview/wiki/Contributing)).

## Usage

The image is built using [`rpi-image-gen`](https://github.com/raspberrypi/rpi-image-gen) and only works on Linux.

> [!NOTE]
> If not building on aarch64, install QEMU first
> `❯ modprobe binfmt_misc && apt install qemu-user-static`

```sh
# clone rpi-image-gen repository (or download it)
# git clone https://github.com/raspberrypi/rpi-image-gen.git
wget https://github.com/raspberrypi/rpi-image-gen/archive/refs/heads/master.zip && unzip ./master.zip && rm -f ./master.zip && mv rpi-image-gen-master rpi-image-gen
cd rpi-image-gen

# make sure to install its dependencies
sudo ./install_deps.sh

# add a symlink to our recipe and files
ln -sf ../provisioner ./provisioner

# build the image
./build.sh -c provisioner -D provisioner -o provisioner/provisioner.options

# find the resulting image
ls -l ./work/kiwix-provisioner/deploy/kiwix-provisioner.img
```

## Key Components

- A copy of `debian/bookworm/arm64/base-apt` that downloads debian keys and is required if building on non-debian.
- `en_US.UTF-8` locale setup
- [provisioner](https://github.com/offspot/provisioner/) install with all its dependencies
- Custom `config.txt` to enable PCIeGen3
- Custom `cmdline.txt` to disable cgroupsv2 (for balena engine)
- Autologin for getty
- Custom `.bash_profile` to automatically start `provisioner-script`
- A `kiosk` service that starts a [cage](https://github.com/cage-kiosk/cage) (Wayland) session itself starting a [foot](https://github.com/yonasBSD/foot) terminal.

Using a (lightweight) graphical terminal allows use of 24b colors, full unicode and emojis which is a good quality boost, even for a terminal UI.