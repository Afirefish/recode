THEOS_DEVICE_IP=root@localhost -p 2222
ARCHS=armv7 arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AddWCV1Contact
AddWCV1Contact_FILES = Tweak.xm
AddWCV1Contact_FRAMEWORK=UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 WeChat"
SUBPROJECTS += ftnetwork
include $(THEOS_MAKE_PATH)/aggregate.mk
