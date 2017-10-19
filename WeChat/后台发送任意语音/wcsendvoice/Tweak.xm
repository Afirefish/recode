#import "SendVoice.h"

%hook NewMainFrameViewController
- (void)viewDidAppear:(BOOL)animated {
	%log;
	%orig;
	SendVoice * sendVoice = [[SendVoice alloc] init];
	[sendVoice runTask];
}
%end