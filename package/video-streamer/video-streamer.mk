################################################################################
#
# video-streamer
#
################################################################################

MY_VIDEO_APP_VERSION = master # Or a specific commit/tag
MY_VIDEO_APP_SITE = git@github.com:asabbagh4/rpi4-object-tracking.git
MY_VIDEO_APP_SITE_METHOD = git
MY_VIDEO_APP_LICENSE = GPL-3.0+ # Replace with your actual license
MY_VIDEO_APP_LICENSE_FILES = LICENSE # Replace with your license file

# Dependencies (important for correct build order)
MY_VIDEO_APP_DEPENDENCIES = gstreamer1 gst1-plugins-base opencv

# Compilation steps (adapt to your application's build system)
define MY_VIDEO_APP_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

# Installation steps
define MY_VIDEO_APP_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/<your_app_executable> $(TARGET_DIR)/usr/bin/
    # Install any other necessary files (configs, data, etc.)
endef

$(eval $(generic-package))