# Makefile for the Raspberry Pi 4 Buildroot project (Custom Tree Method)

# Buildroot directory
BUILDROOT_DIR = buildroot
CUSTOM_DEFCONFIG = $(PWD)/configs/raspberrypi4_defconfig

.PHONY: all image clean distclean config menuconfig rebuild-app

all: image

image:
	$(MAKE) -C $(BUILDROOT_DIR) O=output BR2_EXTERNAL=$(PWD) BR2_DEFCONFIG=$(CUSTOM_DEFCONFIG) defconfig
	$(MAKE) -C $(BUILDROOT_DIR) O=output

config:
	$(MAKE) -C $(BUILDROOT_DIR) O=output BR2_EXTERNAL=$(PWD) BR2_DEFCONFIG=$(CUSTOM_DEFCONFIG) defconfig

menuconfig:
	$(MAKE) -C $(BUILDROOT_DIR) O=output BR2_EXTERNAL=$(PWD) menuconfig
	$(MAKE) -C $(BUILDROOT_DIR) O=output savedefconfig

clean:
	$(MAKE) -C $(BUILDROOT_DIR) O=output clean

distclean:
	$(MAKE) -C $(BUILDROOT_DIR) O=output distclean
	rm -rf $(PWD)/output

rebuild-app:
	$(MAKE) -C $(BUILDROOT_DIR) O=output -C package/my-video-app-dirclean
	$(MAKE) -C $(BUILDROOT_DIR) O=output -C package/my-video-app-rebuild
	$(MAKE) -C $(BUILDROOT_DIR) O=output
