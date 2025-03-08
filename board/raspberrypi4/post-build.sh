#!/bin/sh

# 1. Copy files to the target filesystem:
# Example: Copy a custom script to /usr/local/bin
# Note: TARGET_DIR points to the root of *built* target file system.
# BINARIES_DIR points to output/images
#cp ${TARGET_DIR}/usr/bin/my-video-app ${BINARIES_DIR}/
#
# Example: Create a directory on target
mkdir -p ${TARGET_DIR}/opt/my-custom-data

# 2. Modify files within the target filesystem:
# Example: Add a line to /etc/fstab
echo "/dev/mmcblk0p1 /boot vfat defaults 0 2" >> ${TARGET_DIR}/etc/fstab

# 3. Set file permissions and ownership:
# Example: Make a script executable
chmod +x ${TARGET_DIR}/usr/local/bin/my_custom_script
# Example: Change ownership of a directory
chown root:root ${TARGET_DIR}/opt/my-custom-data

# 4. Install additional files from outside the Buildroot tree:
# (Less common, but possible)
# Example: Copy a pre-built binary from a specific location
# cp /path/to/my/prebuilt/binary ${TARGET_DIR}/usr/bin/

# 5. Clean up unnecessary files (optional):
# Example: Remove documentation to save space
# rm -rf ${TARGET_DIR}/usr/share/doc/*

# Enables adb over network.
echo "service.adb.tcp.port=5555" >> ${TARGET_DIR}/etc/build.prop

# Example: copy compiled libraries and application to host output/target directory
cp -r ${TARGET_DIR}/usr/lib/lib* ${TOPDIR}/output/target/usr/lib
#cp ${TARGET_DIR}/usr/bin/my-video-app ${TOPDIR}/output/target/usr/bin