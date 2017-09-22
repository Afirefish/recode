//
//  brand.h
//  
//
//  Created by 戴曦嘉 on 2017/8/8.
//
//

#ifndef brand_h
#define brand_h

@interface NewMainFrameViewController:UIViewController
- (void)openBrandSessionView;//显示订阅号

@end

@interface MMTableView:UITableView
@end

@interface MicroMessengerAppDelegate :NSObject<UIApplicationDelegate>

@end

@interface MMTabBarController : UITabBarController

@end


@interface ChatTableViewCell:UITableViewCell

@end

@interface BrandSessionViewController:UIViewController
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (void)viewDidLayoutSubviews;
- (void)onBrandSessionsChanged;


@end

@interface BaseMessageCellView:UITableView

@end


@interface BaseMsgContentViewController:UIViewController
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (void)viewDidLayoutSubviews;

@end

@interface BaseChatCellView:UIView
- (void)resetLayoutCache;

@end

@interface ReaderMessageCellView:UITableView
- (void)onClicked;
@end

@interface MultiReaderMessageCellView:UITableView
- (void)onReaderItemClick:(unsigned int)arg1;//open the link
@end

@interface MMUINavigationController:UINavigationController
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
@end

@interface MMWebViewController:UIViewController

@end

#endif /* brand_h */






