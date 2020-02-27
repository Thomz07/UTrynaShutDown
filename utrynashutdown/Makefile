include $(THEOS)/makefiles/common.mk

ARCHS = armv7 arm64 arm64e

BUNDLE_NAME = UTrynaShutDown

UTrynaShutDown_FILES = TOMRootListController.m 
UTrynaShutDown_INSTALL_PATH = /Library/PreferenceBundles
UTrynaShutDown_FRAMEWORKS = UIKit
UTrynaShutDown_PRIVATE_FRAMEWORKS = Preferences
UTrynaShutDown_CFLAGS = -fobjc-arc
UTrynaShutDown_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/UTrynaShutDown.plist$(ECHO_END)
