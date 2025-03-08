# Get the absolute path of the directory containing external.mk
EXTERNAL_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# Include the external.mk files from the package and board directories
include $(EXTERNAL_DIR)package/my-video-app/my-video-app.mk
include $(EXTERNAL_DIR)board/raspberrypi4/external.mk