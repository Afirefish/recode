#import "VPNMonitor.h"

%hook SpringBoard
//- (void)applicationDidFinishLaunching:(id)application {
- (void)_menuButtonDown:(id)down {
	%log;
	%orig;
	VPNMonitor *monitor = [[VPNMonitor alloc] init];
	BOOL status = [monitor checkVPNStatus];
	NSLog(@"getHere---%@",status?@"CONNECTED":@"NOT CONNECTED");
}
%end