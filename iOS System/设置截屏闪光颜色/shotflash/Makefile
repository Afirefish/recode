THEOS_DEVICE_IP=192.168.0.142
ARCHS=armv7 arm64
TARGET=iphone:latest:9.0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = shotFlash
shotFlash_FILES = Tweak.xm
shotFlash_FRAMEWORKS=UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
