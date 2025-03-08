################################################################################
#
# video-streamer
#
################################################################################

MY_VIDEO_APP_VERSION = origin/master
MY_VIDEO_APP_SITE = https://github.com/asabbagh4/rpi4-object-tracking.git
MY_VIDEO_APP_SITE_METHOD = git
MY_VIDEO_APP_LICENSE = GPL-3.0+ # Replace with your actual license
MY_VIDEO_APP_LICENSE_FILES = LICENSE # Replace with your license file

# Dependencies (important for correct build order)
MY_VIDEO_APP_DEPENDENCIES = gstreamer1 gst1-plugins-base gst1-plugins-good opencv3

# Compilation steps (adapt to your application's build system)
define MY_VIDEO_APP_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

# Installation steps
define MY_VIDEO_APP_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/my-video-app $(TARGET_DIR)/usr/bin/
endef

$(eval $(cmake-package))