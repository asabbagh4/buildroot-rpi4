# Overview

This repo utilizes buildroot to build cusotm linux images and then builds the application in "Video streaming repo" to come up with one ready binary to be flashed on rpi4

## Building the image

 make image

 ## Flash the SD card
run this from the root foldeR:
 sudo dd if=buildroot/output/images/sdcard.img of=/dev/sdX bs=4M conv=fsync status=progress
