#!/bin/sh

set -eu

rootfs=$1
genimg_in=$2

cat "$LAYER_DIR/genimage.cfg.in" | sed \
   -e "s|<IMAGE_DIR>|$IGconf_image_outputdir|g" \
   -e "s|<IMAGE_NAME>|$IGconf_image_name|g" \
   -e "s|<IMAGE_SUFFIX>|$IGconf_image_suffix|g" \
   -e "s|<FW_SIZE>|$IGconf_image_boot_part_size|g" \
   -e "s|<ROOT_SIZE>|$IGconf_image_system_part_size|g" \
   > ${genimg_in}/genimage.cfg
