THEOS_DEVICE_IP=root@localhost -p 2222
ARCHS=armv7 arm64
TARGET=iphone:latest:9.0
include $(THEOS)/makefiles/common.mk

TOOL_NAME = SetContact
SetContact_FILES = main.mm *.m 
SetContact_FRAMEWORK=UIKit Contacts
TARGET_CODESIGN_FLAGS = "-Sentitlements.plist"

include $(THEOS_MAKE_PATH)/tool.mk
