# Overview

This repo utilizes buildroot to build cusotm linux images and then builds the application in "Video streaming repo" to come up with one ready binary to be flashed on rpi4

## Building the image

 make image

 ## Flash the SD card
run this from the root folder. and make sure to change the X in sdX to the right value. In my case, it was sdb.

 sudo dd if=buildroot/output/images/sdcard.img of=/dev/sdX conv=fsync status=progress
