//
//  BrowseBrand.m
//  
//
//  Created by 戴曦嘉 on 2017/8/10.
//
//
#import <UIKit/UIKit.h>
#import "BrowseBrand.h"
#import "brand.h"

@implementation BrowseBrand

static BrowseBrand *_ins = nil;
+ (instancetype)singleInstance {
    //create a single instance
    if (_ins == nil) {
        _ins = [[BrowseBrand alloc] init];
    }
    return _ins;
}

static int flag = 1;

+ (void)changeFlag {
    if(flag == 1){
        flag = 0;
    } else if (flag == 0) {
        flag = 1;
    }
}

+ (int)flag {
    return flag;
}

static int autoCount = 0;

+ (int)autoCount {
    return autoCount;
}

- (void)setAutoCount:(UIViewController *)brandSessionController {
    if ([self isTrueBrandSession:brandSessionController]) {
        MMTableView *contentView = [brandSessionController valueForKey:@"m_tableView"];
        autoCount = [contentView numberOfRowsInSection:0];
    } else {
        NSLog(@"wrong brand session");
    }//end if
}

+ (void)reduceCount {
    autoCount--;
}

static int articleCount = 0;

+ (int)articleCount {
    return articleCount;
}

+ (void)reduceArticleCount {
    articleCount-=2;
}

- (void)setArticleCount:(UIViewController *)messageController {
    if ([messageController isKindOfClass:[NSClassFromString(@"BaseMsgContentViewController") class]]) {
        BaseMsgContentViewController *targetController = (BaseMsgContentViewController *)messageController;
        MMTableView *contentView = [targetController valueForKey:@"m_tableView"];
        articleCount=[contentView numberOfSections];
    } else {
        NSLog(@"wrong controller!");
    }//end if
}
    

- (BOOL)openBrandView:(UIViewController *)brandViewController {
    //return whether open sucess
    if ([brandViewController isKindOfClass:[NSClassFromString(@"NewMainFrameViewController") class]]) {
        NewMainFrameViewController *targetController = (NewMainFrameViewController *)brandViewController;
        [targetController openBrandSessionView];
        NSLog(@"openBrandView was called");
        return YES;
    } else {
        NSLog(@"wrong controller!");
        return NO;
    }//end if
}

- (BOOL)isTrueBrandSession:(UIViewController *)brandSessionController {
    //judge whether correct brand session
    if ([brandSessionController isKindOfClass:[NSClassFromString(@"BrandSessionViewController") class]]) {
        BrandSessionViewController *targetController = (BrandSessionViewController *)brandSessionController;
        MMTableView *contentView=[targetController valueForKey:@"m_tableView"];
        NSInteger numOfSections=[contentView numberOfSections];
        if (numOfSections == 0) {
            NSLog(@"no brand!");
            return NO;
        } else if (numOfSections == 1) {
            NSLog(@"correct brand session");
            return YES;
        } else {
            NSLog(@"We May meet a Cronk WeChat!");
            return NO;
        }//end if
    } else {
        NSLog(@"wrong controller!");
        return NO;
    }//end if
}

- (NSInteger)viewBrandRow:(UIViewController *)brandSessionController {
    //view brand row, return the total number
    NSInteger numOfRows = 0;
    if ([self isTrueBrandSession:brandSessionController]) {
        MMTableView *contentView = [brandSessionController valueForKey:@"m_tableView"];
        numOfRows = [contentView numberOfRowsInSection:0];
    } else {
        NSLog(@"wrong brand session");
    }//end if
    return numOfRows;
}

- (void)selectOneBrand:(unsigned int)indexRow inController:(UIViewController *)brandSessionController {
    //pass the index of brand session, open the brand session
    if ([self isTrueBrandSession:brandSessionController]) {
        BrandSessionViewController *targetController = (BrandSessionViewController *)brandSessionController;
        MMTableView *contentView = [targetController valueForKey:@"m_tableView"];
        NSInteger numOfRows = [self viewBrandRow:brandSessionController];
        if(numOfRows > 0){
            if (indexRow <= numOfRows-1) {
                NSIndexPath *targetIndex = [NSIndexPath indexPathForRow:indexRow inSection:0];
                [targetController tableView:contentView didSelectRowAtIndexPath:targetIndex];
                NSLog(@"You select %zd row",indexRow);
            } else {
                NSLog(@"You may send a wrong index");
            }//end if
        } else {
            NSLog(@"there is no brand session");
        }//end if
    } else {
        NSLog(@"wrong brand session");
    }//end if
    
}

- (NSInteger)viewBrandSession:(UIViewController *)messageController {
    //view articles of the brand, return the number
    NSInteger numOfSections = 0;
    if ([messageController isKindOfClass:[NSClassFromString(@"BaseMsgContentViewController") class]]) {
        BaseMsgContentViewController *targetController = (BaseMsgContentViewController *)messageController;
        MMTableView *contentView = [targetController valueForKey:@"m_tableView"];
        numOfSections=[contentView numberOfSections];
    } else {
        NSLog(@"wrong controller!");
    }//end if
    return numOfSections;
}

- (BaseChatCellView *)getVisibleLastView:(UIViewController *)messageController {
    //get the last visible cell from the view
    if ([messageController isKindOfClass:[NSClassFromString(@"BaseMsgContentViewController") class]]) {
        BaseMsgContentViewController *targetController = (BaseMsgContentViewController *)messageController;
        MMTableView *contentView=[targetController valueForKey:@"m_tableView"];
        [contentView reloadData];
        NSArray *cells = [contentView visibleCells];
        ChatTableViewCell * chatMessage=[cells lastObject];
        UIView *cellView = chatMessage.contentView;
        BaseChatCellView *msgView=[[cellView subviews] lastObject];
        return msgView;
    } else {
        NSLog(@"wrong controller");
        return nil;
    }
    return nil;
}

- (unsigned int)isMsgView:(BaseChatCellView *)msgView {
    //judge the view class
    if([msgView isKindOfClass:[NSClassFromString(@"MultiReaderMessageCellView") class]]) {
        return 2;
    } else if([msgView isKindOfClass:[NSClassFromString(@"ReaderMessageCellView") class]]) {
        return 1;
        
    } else {
        NSLog(@"This may be time");
        return 3;
    }
    return 0;
    
}


- (unsigned int)isVisibleMsgView:(UIViewController *)messageController {
    //judge the view class:0 is wrong, 1 is ReaderMessageCellView,2 is MultiReaderMessageCellView,3 is ChatTimeCellView
    if ([messageController isKindOfClass:[NSClassFromString(@"BaseMsgContentViewController") class]]) {
        BaseMsgContentViewController *targetController = (BaseMsgContentViewController *)messageController;
        MMTableView *contentView=[targetController valueForKey:@"m_tableView"];
        [contentView reloadData];
        NSArray *cells = [contentView visibleCells];
        for (int i= (int)[cells count]-1; i >= 0; i--) {
            ChatTableViewCell * chatMessage=[cells objectAtIndex:i];
            UIView *cellView = chatMessage.contentView;
            BaseChatCellView *view=[[cellView subviews] lastObject];
            if ([view isKindOfClass:[NSClassFromString(@"MultiReaderMessageCellView") class]]) {
                return 2;
            } else if([view isKindOfClass:[NSClassFromString(@"ReaderMessageCellView") class]]) {
                return 1;
            } else {
                NSLog(@"This may be time");
                return 3;
            }
        }
    } else {
        NSLog(@"wrong controller");
        return 0;
    }
    return 0;
    
}

- (NSInteger)countSubView:(BaseChatCellView *)msgView {
    //count the subView for the chatcell
    if ([self isMsgView:msgView] == 1) {
        return 1;
    } else if ([self isMsgView:msgView] == 1) {
        UIView *litleView=[[msgView subviews] lastObject];
        NSLog(@"mutismallView-----------%@",[litleView subviews]);
        NSInteger count = [[litleView subviews] count];
        return count;
    } else {
        NSLog(@"This may be time");
        return 0;
    }
    return 0;
}

- (void)selectOneArticle:(unsigned int)section inSubView:(unsigned int)indexSubview inBrandSession:(UIViewController *)messageController {
    //open the article,return the index
    if ([messageController isKindOfClass:[NSClassFromString(@"BaseMsgContentViewController") class]]) {
        BaseMsgContentViewController *targetController = (BaseMsgContentViewController *)messageController;
        MMTableView *contentView=[targetController valueForKey:@"m_tableView"];
        NSIndexPath *targetIndex=[NSIndexPath indexPathForRow:0 inSection:section];
        ChatTableViewCell *chatMessage=(ChatTableViewCell *)[targetController tableView:contentView cellForRowAtIndexPath:targetIndex];
        UIView *cellView= chatMessage.contentView;
        BaseChatCellView *view=[[cellView subviews] lastObject];
        //[contentView reloadData];
        //NSArray *cells = [contentView visibleCells];
        //ChatTableViewCell * chatMessage=[cells objectAtIndex:section];
        //UIView *cellView = chatMessage.contentView;
        //BaseChatCellView *view=[[cellView subviews] lastObject];
        if ([self isMsgView:view] == 1) {
            ReaderMessageCellView *targetView = (ReaderMessageCellView *)view;
            [targetView onClicked];
        } else if ( [self isMsgView:view] == 2) {
            MultiReaderMessageCellView *targetView = (MultiReaderMessageCellView *)view;
            [targetView onReaderItemClick:indexSubview];
        } else {
            NSLog(@"This may be time");
        }
    } else {
        NSLog(@"wrong controller");
    }
    
}



- (void)popViewController:(UINavigationController *)navigationController {
    //return the previous view
    [navigationController popViewControllerAnimated:YES];
   /* if([viewController isKindOfClass:[NSClassFromString(@"MMWebViewController") class]]) {
        [navigationController popViewControllerAnimated:YES];
    } else if ([viewController isKindOfClass:[NSClassFromString(@"BaseMsgContentViewController") class]]) {
        [navigationController popViewControllerAnimated:YES];
    } else if ([viewController isKindOfClass:[NSClassFromString(@"BrandSessionViewController") class]]) {
        [navigationController popViewControllerAnimated:YES];
    } else {
        NSLog(@"May be I don't need to pop");
    }*/
}



@end
