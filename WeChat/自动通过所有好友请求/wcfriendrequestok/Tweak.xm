#import "RequestOK.h"

%hook NewMainFrameViewController
- (void)viewDidAppear:(BOOL)animated {
	%log;
	%orig;
	RequestOK *requestOK = [[RequestOK alloc] init];
	[requestOK runTask];
}
%end