
##############################################################
#
# AESDCHAR make file - nonsense add to trigger test
#
##############################################################


AESDCHAR_VERSION = '1c965669fe34c30b0f2b01a8d4713b0bc8e299a5'
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESDCHAR_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-vinnyaa.git'
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES


$(eval $(kernel-module))

AESDCHAR_MODULE_SUBDIRS = aesd-char-driver
AESDCHAR_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)


define AESDCHAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
	#$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar-start-stop $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
