#import "NewMsgResp.h"

%hook WCTimeLineViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	NewMsgResp *newMsgResp = [[NewMsgResp alloc] init];
	[newMsgResp runTask];
}
%end
