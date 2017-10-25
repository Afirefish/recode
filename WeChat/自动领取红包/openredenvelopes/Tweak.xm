#import "OpenRedEnvelopes.h"

// %hook MicroMessengerAppDelegate
// // // - (void)didFinishLoad {
// // // 	%log;
// // // 	%orig;
// // // }

// // - (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {
// // 	%log;
// // 	_Bool r = %orig;
// // 	return r;
// // }

// - (void)applicationDidBecomeActive:(id)arg1 {
// 	%log;
// 	%orig;
// 	OpenRedEnvelopes *openRedEnvelopes = [[OpenRedEnvelopes alloc] init]; 
// 	[openRedEnvelopes firstOpen];
// }
// %end

%hook NewMainFrameViewController
- (void)updateSession:(id)arg1 { 
	%log; 
	%orig;
	OpenRedEnvelopes *openRedEnvelopes = [[OpenRedEnvelopes alloc] init]; 
	[openRedEnvelopes openStart:arg1];
}
%end