#import "WXGroupControl.h"

%hook NewMainFrameViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	WXGroupControl *c = [[WXGroupControl alloc] init];
	[c runTask:@"createGroup"];
}
%end;