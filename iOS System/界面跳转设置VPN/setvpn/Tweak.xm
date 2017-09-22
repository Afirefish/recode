#import "VpnHelp.h"

%hook PSListController
- (void)viewDidAppear:(BOOL)animated {
	%log;
	%orig;
	NSLog(@"----tableis----%@",[self class]);
	if ([self isKindOfClass:NSClassFromString(@"VPNController")]) {
		NSLog(@"finds!");
		UITableView *addVPN = (UITableView *)[self valueForKey:@"_table"];
		NSInteger section = [addVPN numberOfSections];
		//NSIndexPath *addPath = [NSIndexPath indexPathForRow:0 inSection:section-1];
		//[self tableView:addVPN didSelectRowAtIndexPath: addPath];
		if (section == 3) {
			for (NSInteger row = 0; row < [addVPN numberOfRowsInSection:1];row++) {
				NSIndexPath *vpnPath = [NSIndexPath indexPathForRow:row inSection:1];
				UITableViewCell *vpnCell = [self tableView:addVPN cellForRowAtIndexPath: vpnPath];
				if ([[[vpnCell textLabel] text]  isEqualToString:@"baka"]) {
					[self tableView:addVPN didSelectRowAtIndexPath: vpnPath];
				}
			}



			NSIndexPath *openPath = [NSIndexPath indexPathForRow:0 inSection:0];
			UITableViewCell *toggleCell = [self tableView:addVPN cellForRowAtIndexPath: openPath];
			UIView *openSwitch = [[toggleCell subviews] objectAtIndex:[[toggleCell subviews] count]-2];
			[self startEnterpriseConnection: openSwitch];
		}
	}
	if ([self isKindOfClass:NSClassFromString(@"VPNSetupListController")]) {
		[self setVPNType:@"PPTP" forSpecifier:nil];
		[self setDisplayName:@"baka" forSpecifier:nil];
		[self setServer:@"123" forSpecifier:nil];	
		[self setUsername:@"123" forSpecifier:nil];
		[self setPassword:@"123" forSpecifier:nil];
		UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
		UISplitViewController *rootVC = (UISplitViewController *)keyWindow.rootViewController;
		UINavigationController *navigationController = [[rootVC viewControllers] firstObject];
		UINavigationBar *navigationBar = [navigationController navigationBar];
		NSLog(@"whatareyoursubviews----%@",[navigationBar subviews]);
		UIView *targetView = [[navigationBar subviews] objectAtIndex:[[navigationBar subviews] count]-2];
		NSLog(@"----whatareyou--%@",[targetView class]);
		[self saveButtonClicked: targetView];
		NSLog(@"gettheButton");
		
		//[self saveConfigurationSettings];
	}

	
}

%end