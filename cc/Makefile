TARGET := iphone:clang:14.5:11.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Powercuff
Powercuff_BUNDLE_EXTENSION = bundle
Powercuff_FILES = Powercuff.m
Powercuff_CFLAGS = -fobjc-arc
Powercuff_FRAMEWORKS = UIKit
Powercuff_PRIVATE_FRAMEWORKS = ControlCenterUIKit
Powercuff_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
