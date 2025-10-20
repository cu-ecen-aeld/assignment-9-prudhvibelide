LDD_VERSION = 8448dc2a33951689d208a220d5fe2be1d804c438
LDD_SITE = https://github.com/cu-ecen-aeld/assignment-7-prudhvibelide.git
LDD_SITE_METHOD = git
LDD_DEPENDENCIES = linux

# Build kernel modules for scull and misc-modules using the correct cross-compiler
define LDD_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) \
		ARCH=arm64 \
		CROSS_COMPILE=$(TARGET_CROSS) \
		M="$(@D)/scull" \
		EXTRA_CFLAGS="-I$(@D)/include" \
		modules

	$(MAKE) -C $(LINUX_DIR) \
		ARCH=arm64 \
		CROSS_COMPILE=$(TARGET_CROSS) \
		M="$(@D)/misc-modules" \
		EXTRA_CFLAGS="-I$(@D)/include" \
		modules
endef

# Install modules into the target filesystem
define LDD_INSTALL_TARGET_CMDS
	$(MAKE) -C $(LINUX_DIR) \
		ARCH=arm64 \
		CROSS_COMPILE=$(TARGET_CROSS) \
		M="$(@D)/scull" \
		INSTALL_MOD_PATH=$(TARGET_DIR) \
		modules_install

	$(MAKE) -C $(LINUX_DIR) \
		ARCH=arm64 \
		CROSS_COMPILE=$(TARGET_CROSS) \
		M="$(@D)/misc-modules" \
		INSTALL_MOD_PATH=$(TARGET_DIR) \
		modules_install
endef

$(eval $(generic-package))

