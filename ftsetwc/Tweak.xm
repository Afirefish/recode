#import "SetWCNetWork.h"

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)application {
	%log;
	%orig;
	SetWCNetWork *setWCNetWork = [[SetWCNetWork alloc] init];
	[setWCNetWork openWCNetwork];
}
%end
