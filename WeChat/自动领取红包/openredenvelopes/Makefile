THEOS_DEVICE_IP=root@localhost -p 2222
ARCHS=armv7 arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = OpenRedEnvelopes
OpenRedEnvelopes_FILES = Tweak.xm OpenRedEnvelopes.m
OpenRedEnvelopes_FRAMEWORK = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 WeChat"
