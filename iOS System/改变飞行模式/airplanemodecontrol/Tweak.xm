#import "AirPlaneModeControl.h"

%hook SpringBoard
- (void)_menuButtonDown:(id)down {
	%log;
	%orig; 
	AirPlaneModeControl *airPlaneModeControl = [[AirPlaneModeControl alloc] init];
	[airPlaneModeControl changeAirPlaneMode];
}
%end
