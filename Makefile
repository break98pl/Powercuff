export ARCHS = arm64 arm64e
export TARGET = iphone:clang:14.5:15.0
INSTALL_TARGET_PROCESSES = SpringBoard
export FINALPACKAGE=1
export THEOS_DEVICE_IP=192.168.1.113

TWEAK_NAME = Powercuff
Powercuff_FILES = Powercuff.x
Powercuff_FRAMEWORKS = Foundation
Powercuff_USE_MODULES = false

Powercuff_CFLAGS = -fobjc-arc

INSTALL_TARGET_PROCESSES = thermalmonitord SpringBoard

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += cc
include $(THEOS_MAKE_PATH)/aggregate.mk
