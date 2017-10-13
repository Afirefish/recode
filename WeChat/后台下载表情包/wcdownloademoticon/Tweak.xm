#import "DownloadEmoticon.h"

%hook BaseMsgContentViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	DownloadEmoticon *downloadEmoticon = [[DownloadEmoticon alloc] init];
	[downloadEmoticon runTask];
	NSLog(@"what happened?");
}
%end