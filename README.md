# provision-os
Bootable disk image running provisionner

## Usage

The image is built using `rpi-image-gen`:

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
ll ./work/kiwix-provisioner/deploy/kiwix-provisioner.img
```
