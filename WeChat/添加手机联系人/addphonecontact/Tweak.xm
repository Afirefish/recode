#import "AddPhoneContact.h"

%hook NewMainFrameViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	AddPhoneContact *addPhoneContact = [[AddPhoneContact alloc] init];
	[addPhoneContact runTask:@"18804205069"];
}
%end
