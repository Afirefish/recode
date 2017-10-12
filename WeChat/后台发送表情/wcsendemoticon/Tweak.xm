#import "SendEmoticon.h"
#import "SendEmoticonHelp.h"

%hook NewMainFrameViewController
- (void)viewDidAppear:(BOOL)animated {
	%log;
	%orig;
	SendEmoticon *send = [[SendEmoticon alloc] init];
	[send startTask];	
}

%end
