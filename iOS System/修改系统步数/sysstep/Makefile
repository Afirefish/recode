THEOS_DEVICE_IP=root@localhost -p 2222
ARCHS=armv7 arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SysStep
SysStep_FILES = Tweak.xm
SysStep_FRAMEWORK = UIKit HealthKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Health"
