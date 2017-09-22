#import "SetVPN.h"


%hook PSListController
- (void)viewDidAppear:(BOOL)animated {
	%log;
	%orig;
	NSLog(@"what happened----------%@?",[self class]);
	SetVPN *setVPN = [[%c(SetVPN) alloc] init];
	NSLog(@"---%@ isull?", setVPN);
	[setVPN runTask:@"closeVPN" inContoller:self];
}
%end