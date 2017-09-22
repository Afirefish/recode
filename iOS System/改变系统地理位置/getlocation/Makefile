THEOS_DEVICE_IP=root@localhost -p 2222
ARCHS=armv7 arm64
TARGET=iphone:latest:9.0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = GetLocation
GetLocation_FILES = Tweak.xm
NoteCount_FRAMEWORK=UIKit CoreIndoor
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
