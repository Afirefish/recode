#import "AddWCFriendHelp.h"

%hook NewMainFrameViewController
- (void)updateAllItemTimeLabel {
	%log;
	%orig;
	MMTabBarController *appRootVC = (MMTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
	MMUINavigationController *navigationController = (MMUINavigationController *)[appRootVC selectedViewController];
	NewMainFrameViewController *currentVC = (NewMainFrameViewController *)[navigationController visibleViewController];
	MMUINavigationBar *navigationBar = (MMUINavigationBar *)[navigationController navigationBar];
	NSInteger count = [[navigationBar subviews] count];
	NewMainFrameRightTopMenuBtn *mainBtn = (NewMainFrameRightTopMenuBtn *)[[navigationBar subviews] objectAtIndex:count-2];;
if([mainBtn isKindOfClass:[%c(NewMainFrameRightTopMenuBtn) class]]){
	[mainBtn showRightTopMenuBtn];
	MMUIHookView *rootView = (MMUIHookView *)[currentVC view];
	MainFrameActionFloatView *floatView = (MainFrameActionFloatView *)[[rootView subviews] lastObject];
	UIView *btnView = [floatView valueForKey:@"m_viewContent"];
	RightTopMenuItemBtn *targetBtn = [[btnView subviews] objectAtIndex:2];
	[mainBtn onItemAction:targetBtn];
	}
}
%end


%hook AddFriendEntryViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	/*UIView *contentView = [self view];
	MMTableView *tableView = (MMTableView *)[[contentView subviews] objectAtIndex:1];
	NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0]
	MMTableViewInfo *tableViewInfo = (MMTableViewInfo *)[self valueForKey:@"m_tableViewInfo"];
	[tableViewInfo tableView:tableView didSelectRowAtIndexPath:index];*/

	
	FindContactSearchViewCellInfo *findContactSearchViewCellInfo = [self valueForKey:@"m_headerSearchView"];
	MMSearchBar *searchBar = (MMSearchBar *)[findContactSearchViewCellInfo valueForKey:@"m_searchBar"];
	MMUISearchBar *contentBar = [searchBar valueForKey:@"m_searchBar"];
	//这里可以输入短点的v1数据，微信号都可以查询到
	[contentBar setText:@"babi10961096"];
	[findContactSearchViewCellInfo doSearch];
}

%end

%hook MMSearchBar
- (_Bool)searchBar:(id)arg1 shouldChangeTextInRange:(struct _NSRange)arg2 replacementText:(id)arg3 {
	%log;
	return YES;
}
%end



%hook ContactInfoViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	[self onSendVerifyMsg];
}
%end

%hook SendVerifyMsgViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	[self onSendVerifyMsg];
}
%end
