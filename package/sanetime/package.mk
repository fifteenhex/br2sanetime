SANETIME_VERSION = 0.1
SANETIME_SITE = $(BR2_EXTERNAL_SANETIME_PATH)/package/sanetime
SANETIME_SITE_METHOD = local

define SANETIME_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 -D $(@D)/S3sanetime $(TARGET_DIR)/etc/init.d/S3sanetime
endef

define SANETIME_ADDBUILDTIME
	date -u +"%Y-%m-%d %H:%M:%S" > $(TARGET_DIR)/etc/buildtime
endef

SANETIME_TARGET_FINALIZE_HOOKS += SANETIME_ADDBUILDTIME

$(eval $(generic-package))
