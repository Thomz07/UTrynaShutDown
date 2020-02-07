export THEOS = /theos/

ARCHS= armv7 arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = UTrynaShutDown

UTrynaShutDown_FILES = Tweak.xm
UTrynaShutDown_CFLAGS = -fobjc-arc
UTrynaShutDown_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += utrynashutdown
include $(THEOS_MAKE_PATH)/aggregate.mk
