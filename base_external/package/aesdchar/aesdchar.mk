
##############################################################
#
# AESDCHAR make file
#
##############################################################


LDD_VERSION = '11edecf7996a0a362caf49262c3ef1fd67276219'
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-vinnyaa.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES


$(eval $(kernel-module))

AESDCHAR_MODULE_SUBDIRS = aesd-char-driver
AESDCHAR_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar-start-stop $(TARGET_DIR)/etc/init.d/S97aesdchar
	
endef


$(eval $(generic-package))
