#import "MarkMsgHasRead.h"

%hook NewMainFrameViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	MarkMsgHasRead *markMsgHasRead = [[MarkMsgHasRead alloc] init];
	[markMsgHasRead runTask];
}
%end