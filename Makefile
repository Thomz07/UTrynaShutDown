ARCHS= armv7 arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

TWEAK_NAME = UTrynaShutDown

UTrynaShutDown_FILES = Tweak.xm
UTrynaShutDown_CFLAGS = -fobjc-arc

include ~/theos/makefiles/tweak.mk
SUBPROJECTS += utrynashutdown
include ~/theos/makefiles/aggregate.mk
