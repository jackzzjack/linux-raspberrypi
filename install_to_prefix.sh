#!/bin/bash
KERNEL=kernel7

export PATH=../tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/:$PATH

# make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=prefix/modules modules_install

cp arch/arm/boot/zImage prefix/
scripts/mkknlimg arch/arm/boot/zImage prefix/$KERNEL.img

cp -ra arch/arm/boot/dts/*.dtb prefix/

mkdir prefix/overlays
cp -ra arch/arm/boot/dts/overlays/*.dtb* prefix/overlays/
cp -ra arch/arm/boot/dts/overlays/README prefix/overlays/
