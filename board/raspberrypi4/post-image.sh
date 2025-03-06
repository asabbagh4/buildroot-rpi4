#!/bin/sh

# 1. Resize the image:
# Example: Resize the image to 4GB (adjust as needed)
truncate -s 4G ${BINARIES_DIR}/sdcard.img

# 2. Work with partitions (using sfdisk or parted):
# Example: Add a new partition to the image (ADVANCED!)
# (Requires careful calculation of partition sizes and offsets)
# sfdisk ${BINARIES_DIR}/sdcard.img << EOF
# ,,,L
# EOF

# 3. Mount the image and modify files within it (ADVANCED!):
# (Requires careful handling of mount points and potential root privileges)
# Example: Mount the root filesystem of the image and copy a file
# mkdir -p /tmp/mnt
# losetup -P -f ${BINARIES_DIR}/sdcard.img
# loopdev=$(losetup -j ${BINARIES_DIR}/sdcard.img | cut -d : -f 1)
# mount ${loopdev}p2 /tmp/mnt  # Mount the root filesystem (usually partition 2)
# cp /path/to/my/file /tmp/mnt/path/in/image/
# umount /tmp/mnt
# losetup -d ${loopdev}

# 4. Generate checksums:
# Example: Create an MD5 checksum of the image
md5sum ${BINARIES_DIR}/sdcard.img > ${BINARIES_DIR}/sdcard.img.md5

# Enables adb over network
echo "service.adb.tcp.port=5555" >> ${BINARIES_DIR}/build.prop