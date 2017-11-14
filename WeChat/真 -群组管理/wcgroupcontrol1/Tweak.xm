#import "WCGroupControl.h"

%hook NewMainFrameViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	WCGroupControl *c = [[WCGroupControl alloc] init];
	[c runTask];
}
%end;

%hook CGroupMgr
- (id)HandleCreateChatRoomOK:(id)arg1 {
	%orig;
	id r = %orig;
	return r;
}
%end
