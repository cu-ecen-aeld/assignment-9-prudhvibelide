AESDSOCKET_VERSION = 1.0
AESDSOCKET_SITE = $(TOPDIR)/../base_external/source/aesdsocket
AESDSOCKET_SITE_METHOD = local

define AESDSOCKET_BUILD_CMDS
	$(TARGET_CC) -DUSE_AESD_CHAR_DEVICE=1 -o $(@D)/aesdsocket $(@D)/aesdsocket.c -lpthread
endef

define AESDSOCKET_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
endef

$(eval $(generic-package))
