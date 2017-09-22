THEOS_DEVICE_IP = 192.168.0.142
TARGET = iPhone:latest:9.0
ARCHS = armv7 arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WCVideoDownload
WCVideoDownload_FILES = Tweak.xm
WCVideoDownload_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 WeChat"
