################################################################################
#
# ldd
#
################################################################################

LDD_VERSION = 8448dc2a33951689d208a220d5fe2be1d804c438
LDD_SITE = https://github.com/cu-ecen-aeld/assignment-7-prudhvibelide.git
LDD_SITE_METHOD = local
LDD_DEPENDENCIES = linux

define LDD_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M="$(LDD_SITE)/scull" modules
	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M="$(LDD_SITE)/misc-modules" modules
endef

define LDD_INSTALL_TARGET_CMDS
	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) \
		M="$(LDD_SITE)/scull" \
		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) \
		M="$(LDD_SITE)/misc-modules" \
		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef



$(eval $(generic-package))
