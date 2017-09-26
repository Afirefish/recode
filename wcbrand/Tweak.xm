#import "BrowseBrand.h"
#import "brand.h"

%hook MicroMessengerAppDelegate
- (void)applicationDidBecomeActive:(id)arg1 {
	%log;
	%orig;
	NSLog(@"applicationDidBecomeActive?");
	MMTabBarController *rootViewController = (MMTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
	MMUINavigationController *mmNavigation = (MMUINavigationController *)[rootViewController selectedViewController];
	UIViewController *viewController1 = [mmNavigation visibleViewController];
	BrowseBrand *browseBrand = [NSClassFromString(@"BrowseBrand") singleInstance];
	if ([viewController1 isKindOfClass:[NSClassFromString(@"NewMainFrameViewController") class]]) {
	NewMainFrameViewController *newMainFrame = (NewMainFrameViewController *) viewController1;
	[browseBrand openBrandView:newMainFrame];
	NSLog(@"openBrandView success");
	}//end if
}
%end

%hook MMUINavigationController
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
	%log;
	%orig;
	BrowseBrand *browseBrand = [NSClassFromString(@"BrowseBrand") singleInstance];
	if([viewController isKindOfClass:[NSClassFromString(@"BrandSessionViewController") class]]){
	int count = [BrowseBrand autoCount];   
	if( count> 0) {
	NSLog(@"autocount %zd",count);
	[browseBrand selectOneBrand: count-1 inController:viewController];
	[BrowseBrand reduceCount];
	}//end if
	NSLog(@"autocount %zd",count);
	} else if ([viewController isKindOfClass:[NSClassFromString(@"BaseMsgContentViewController") class]]){
	int count = [BrowseBrand articleCount];   
	if( count> 0) {
	NSLog(@"articleCount %zd",count);
	[browseBrand selectOneArticle:count-1 inSubView:0 inBrandSession:viewController];
	}else {
	[browseBrand popViewController:self];
	}//end if
	NSLog(@"reducearticleCount %zd",count);
	}else if ([viewController isKindOfClass:[NSClassFromString(@"MMWebViewController") class]]) {
	//[browseBrand popViewController:self];
	} else{
	NSLog(@"may be I don't need to do something");
	}//end if
	
}

- (id)navigationController:(id)arg1 animationControllerForOperation:(long long)arg2 fromViewController:(id)arg3 toViewController:(id)arg4 {
	%log;
	id x=%orig;
	return x;
}

%end


%hook NewMainFrameViewController
- (void)viewDidAppear:(BOOL)animated {
	%log;
	%orig;	
}
%end

%hook BrandSessionViewController
- (void)viewDidAppear:(BOOL)animated{
	%log;
	%orig;
	static dispatch_once_t disOnce;
	dispatch_once(&disOnce,^ {
	BrowseBrand *browseBrand = [NSClassFromString(@"BrowseBrand") singleInstance];
	[browseBrand setAutoCount:self];
	});
}
%end



%hook BaseMsgContentViewController
- (void)viewDidAppear:(BOOL)animated{
	%log;
	%orig;
	if([BrowseBrand articleCount] <= 0 ){
	BrowseBrand *browseBrand = [NSClassFromString(@"BrowseBrand") singleInstance];
	[browseBrand setArticleCount:self];
	} else {
	[BrowseBrand reduceArticleCount];
	}
	
}
%end

%hook MMWebViewController
- (void)onFinishedHandleJSApi {
	%log;
	%orig;
	BrowseBrand *browseBrand = [NSClassFromString(@"BrowseBrand") singleInstance];
	[browseBrand popViewController:[self parentViewController]];
}
%end



