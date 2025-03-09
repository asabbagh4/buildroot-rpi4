# Makefile for the Raspberry Pi 4 Buildroot project (Custom Tree Method)

# Buildroot directory
BUILDROOT_DIR = buildroot
CUSTOM_DEFCONFIG = $(PWD)/configs/raspberrypi4_defconfig
OUTPUT_DIR = $(abspath $(BUILDROOT_DIR)/output)

.PHONY: all image clean distclean config menuconfig rebuild-app

all: image

image:
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR) BR2_EXTERNAL=$(PWD) BR2_DEFCONFIG=$(CUSTOM_DEFCONFIG) defconfig
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR)

config:
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR) BR2_EXTERNAL=$(PWD) BR2_DEFCONFIG=$(CUSTOM_DEFCONFIG) defconfig

menuconfig:
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR) BR2_EXTERNAL=$(PWD) menuconfig
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR) savedefconfig

linux-menconfig:
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR) BR2_EXTERNAL=$(PWD) linux-menuconfig
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR) savedefconfig


clean:
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR) clean

distclean:
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR) distclean
	rm -rf $(OUTPUT_DIR)

rebuild-app:
	rm -rf $(OUTPUT_DIR)/build/my-video-app-*
	rm -rf $(BUILDROOT_DIR)/dl/my-video-app
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR) my-video-app
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR) target-finalize
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_DIR)