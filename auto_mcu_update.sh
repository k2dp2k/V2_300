#!/bin/sh
sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.octopus
#make menuconfig KCONFIG_CONFIG=config.octopus
make KCONFIG_CONFIG=config.octopus

make flash KCONFIG_CONFIG=config.octopus FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f446xx_0D0026000650534E4E313120-if00

make clean KCONFIG_CONFIG=config.host

make KCONFIG_CONFIG=config.host
make flash KCONFIG_CONFIG=config.host

sudo service klipper start
