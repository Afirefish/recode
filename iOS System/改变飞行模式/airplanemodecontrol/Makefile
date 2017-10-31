THEOS_DEVICE_IP=root@localhost -p 2222
ARCHS=armv7 arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AirPlaneModeControl
AirPlaneModeControl_FILES = Tweak.xm AirPlaneModeControl.m
AirPlaneModeControl_FRAMEWORK = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
