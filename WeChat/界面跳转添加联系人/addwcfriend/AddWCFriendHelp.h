//
//  AddWCFirendHelp.h
//  
//
//  Created by 戴曦嘉 on 2017/8/28.
//
//

#ifndef AddWCFirendHelp_h
#define AddWCFirendHelp_h

@interface MMTabBarController : UITabBarController

@end

@interface MMUINavigationController : UINavigationController

@end

@interface NewMainFrameViewController : UIViewController
- (void)removeMainFrameTip;//调出+号

@end

@interface NewMainFrameRightTopMenuBtn : UIView
- (void)onItemAction:(id)arg1;
- (void)showRightTopMenuBtn;//显示btn


@end

@interface MMUIHookView : UIView

@end

@interface MainFrameActionFloatView : UIView

@end

@interface MMUINavigationBar : UINavigationBar

@end

@interface MMSearchBar : UISearchBar

@end

@interface MMUISearchBar : UISearchBar

@end

@interface RightTopMenuItemBtn : UIView

@end

@interface FindContactSearchViewCellInfo : NSObject
- (void)doSearch;

@end

@interface ContactInfoViewController
- (void)onSendVerifyMsg;//send

@end
#endif /* AddWCFirendHelp_h */
