.PHONY: all clean image update

all:
	$(MAKE) -C buildroot

clean:
	$(MAKE) -C buildroot clean

image:
	$(MAKE) -C buildroot raspberrypi4_defconfig
	$(MAKE) -C buildroot

update:
	git submodule update --init --recursive

# Helper target to quickly rebuild just your application (for development)
rebuild-app:
	$(MAKE) -C buildroot video-streamer

# Helper target to clean just your application
clean-app:
	$(MAKE) -C buildroot video-streamer-dirclean