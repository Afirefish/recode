THEOS_DEVICE_IP=root@localhost -p 2222
ARCHS=armv7 arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LowVerAddContact
LowVerAddContact_FILES = Tweak.xm *.m
LowVerAddContact_FRAMEWORK=UIKit Contacts AddressBook
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
