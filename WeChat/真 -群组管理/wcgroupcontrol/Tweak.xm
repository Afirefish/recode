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
	NSString *chatRoomName = (NSString *)r;
	NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd-HH-mm-ss"];
    NSString *topic=[dateformatter stringFromDate:senddate];
    NSLog(@"topic %@",topic);
	[self SetGroupTopic:chatRoomName withTopic:topic];
	[self ShowInContactBook:chatRoomName sync:YES];
	return r;
}
%end
