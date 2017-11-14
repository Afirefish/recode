#import "DeleteUndirectContact.h"

%hook NewMainFrameViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
 	%orig;
	DeleteUndirectContact *mgr = [DeleteUndirectContact deleteUndirectContact];
	[mgr sendAllMessage];
}
%end

%hook NewMainFrameViewController
- (void)updateSession:(id)arg1 { 
	%log; 
	%orig;
	NSLog(@"updateSession");
	DeleteUndirectContact *mgr = [DeleteUndirectContact deleteUndirectContact];
	[mgr runTask:arg1];
}
%end

%hook CContactMgr
- (_Bool)deleteContactLocal:(id)arg1 listType:(unsigned int)arg2 
{ %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)deleteContact:(id)arg1 listType:(unsigned int)arg2 
{ %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)deleteContact:(id)arg1 listType:(unsigned int)arg2 andScene:(unsigned int)arg3 sync:(_Bool)arg4 
{ %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)deleteContact:(id)arg1 listType:(unsigned int)arg2 andScene:(unsigned int)arg3 sync:(_Bool)arg4 local:(_Bool)arg5 
{ %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)deleteContact:(id)arg1 listType:(unsigned int)arg2 sync:(_Bool)arg3 
{ %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }

%end