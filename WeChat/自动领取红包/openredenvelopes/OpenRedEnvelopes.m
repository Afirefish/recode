//
//  OpenRedEnvelopes.m
//  firstoc
//
//  Created by 戴曦嘉 on 2017/10/23.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import "OpenRedEnvelopes.h"
#import "OpenRedEnvelopesHelp.h"

@interface OpenRedEnvelopes()

@end

@implementation OpenRedEnvelopes

//ChatTableViewCell UITableViewCellContentView WCPayC2CMessageCellView - (void)onTouchDown; - (void)onTouchUpInside;
//WCRedEnvelopesReceiveHomeView - (void)OnOpenRedEnvelopes;

- (UIViewController *)checkNewMainFrameVC {//检查是否是主视图
    UIViewController *vc1 = [[UIApplication sharedApplication] keyWindow].rootViewController;
    if ([vc1 isKindOfClass:[NSClassFromString(@"UITabBarController") class]]) {
        UITabBarController *rootVC = (UITabBarController *)vc1;
        UIViewController *vc2 = [rootVC selectedViewController];
        if ([vc2 isKindOfClass:[NSClassFromString(@"UINavigationController") class]]) {
            UINavigationController *navigationVC = (UINavigationController *)vc2;
            UIViewController *targetVC = [navigationVC visibleViewController];
            if ([targetVC isKindOfClass:[NSClassFromString(@"NewMainFrameViewController") class]]) {
                return targetVC;
            } else {
                return nil;
            }//end if
        } else {
            return nil;
        }//end if
    } else {
        return nil;
    }//end if
}


- (void)firstOpen {//每次打开微信都遍历一遍是否有红包
    if ([self checkNewMainFrameVC] != nil) {
        [self checkRedEnvelopes:nil];
        NSLog(@"第一次打开");
    } else {
        NSLog(@"不进行操作");
    }
}

- (void)openStart:(MMSessionInfo *)cellInfo {//随着每次有新消息查看是否是红包
    if ([self checkNewMainFrameVC] != nil) {
        [self checkRedEnvelopes:cellInfo];
    } else {
        NSLog(@"不进行操作");
    }
}

- (void)checkRedEnvelopes:(MMSessionInfo *)newMsgCellInfo{
    //这里通过微信自己的新消息提醒，检测一下新消息是不是红包消息，如果是则进入去领红包
    UIViewController *targetVC = [self checkNewMainFrameVC];
    if (targetVC != nil) {
        NewMainFrameViewController *mainVC = (NewMainFrameViewController *)targetVC;
        MMMainTableView *tableView = (MMMainTableView *)[mainVC valueForKey:@"m_tableView"];
        NSInteger rowCount = [tableView numberOfRowsInSection:1];//获得聊天的rows
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            for (NSInteger i = 0; i < rowCount; i ++) {//遍历所有cell 找到有消息的cell,或者直接点所有cell 查看历史消息是否有红包
                NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:1];
                NewMainFrameCell *cell = (NewMainFrameCell *)[mainVC tableView:tableView cellForRowAtIndexPath:index];
                MainFrameCellData *cellData = (MainFrameCellData *)[cell valueForKey:@"m_cellData"];
                MMSessionInfo *cellInfo = (MMSessionInfo *)[cellData valueForKey:@"m_sessionInfo"];
                CMessageWrap *msg = [cellInfo valueForKey:@"m_msgWrap"];
                NSString *name = cellInfo.m_nsUserName;
                NSLog(@"第%ld次账号名字 %@",(long)i,name);
                if ([name isEqualToString:@"weixin"]) {//微信团队
                    NSLog(@"这个是微信团队账号");
                    continue;
                }
                if ([name isEqualToString:@"newsapp"]) {//腾讯新闻
                    NSLog(@"这是腾讯新闻账号");
                    continue;
                }
                if ([name isEqualToString:@"brandsessionholder"]) {//订阅号
                    NSLog(@"这是订阅号账号");
                    continue;
                }
                if (newMsgCellInfo == nil) {//如果没有传值，则直接进入
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self enterRERoom:index fromVC:mainVC tableView:tableView checkAll:YES userName:name];
                    });
                    sleep(30);
                } else {
                    if ([self checkCellInfo:cellInfo fromCellInfo:newMsgCellInfo]) {//找到了接受新消息的cell
                        //检查是否是红包信息
                        NSLog(@"new msg %@ detail %@ info %@",msg,[msg valueForKey:@"m_uiMessageType"],newMsgCellInfo);
                        if (msg.m_uiMessageType == 49) {//这里没有处理不在订阅号里面的公众号,留给点进去处理吧
                            dispatch_async(dispatch_get_main_queue(), ^{
                                NSLog(@"红包来了！%@",[msg valueForKey:@"m_uiMessageType"]);
                                [self enterRERoom:index fromVC:mainVC tableView:tableView checkAll:NO userName:name];
                            });
                        } else {
                            NSLog(@"%@ 的新消息不是红包消息",name);
                        }//end if
                    } else {
                        NSLog(@"不是新消息的聊天室");
                    }//end if
                }//end if
            }//end for
        });
        
    } else {
        NSLog(@"没有位于主视图");
    }//end if
}


- (BOOL)checkCellInfo:(MMSessionInfo *)cellInfo fromCellInfo:(MMSessionInfo *)targetCellInfo {//检查是哪一个
    NSLog(@"cell info %@ new info %@ cellname %@,newcellname %@",cellInfo,targetCellInfo,cellInfo.m_nsUserName,targetCellInfo.m_nsUserName);
    if ([cellInfo.m_nsUserName isEqualToString:targetCellInfo.m_nsUserName]) {
        return YES;
    } else {
        return NO;
    }
}

- (UIViewController *)checkBaseMsgVC {//检查是否是聊天室
    UIViewController *vc1 = [[UIApplication sharedApplication] keyWindow].rootViewController;
    if ([vc1 isKindOfClass:[NSClassFromString(@"UITabBarController") class]]) {
        UITabBarController *rootVC = (UITabBarController *)vc1;
        UIViewController *vc2 = [rootVC selectedViewController];
        if ([vc2 isKindOfClass:[NSClassFromString(@"UINavigationController") class]]) {
            UINavigationController *navigationVC = (UINavigationController *)vc2;
            UIViewController *targetVC = [navigationVC visibleViewController];
            if ([targetVC isKindOfClass:[NSClassFromString(@"BaseMsgContentViewController") class]]) {
                return targetVC;
            } else {
                return nil;
            }//end if
        } else {
            return nil;
        }//end if
    } else {
        return nil;
    }//end if
}

- (void)enterRERoom:(NSIndexPath *)index fromVC:(NewMainFrameViewController *)vc tableView:(MMMainTableView *)tableView checkAll:(BOOL)isAll userName:(NSString *)name{//进入有红包的聊天室 搜索是否有红包，有的话领取，之后重新回到刚进来微信的那个视图
    NSLog(@"进入聊天视图");
    [vc tableView:tableView didSelectRowAtIndexPath:index];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(1);
        NSLog(@"%@聊天室进入",name);
        UIViewController *targetVC = [self checkBaseMsgVC];
        if (targetVC != nil) {
            BaseMsgContentViewController *chatVC = (BaseMsgContentViewController *)targetVC;
            MMTableView *tableView = (MMTableView *)[chatVC valueForKey:@"m_tableView"];
            NSInteger sectionCount = [tableView numberOfSections];
            if (isAll) {
                NSLog(@"遍历%@聊天视图全部%ldcell",name,(long)sectionCount);
                [self clickRECell:0 totalSection:sectionCount tableView:tableView fromVC:chatVC];//如果想要全部遍历一遍就用这个
            } else {
                NSLog(@"点击最新消息的红包");
                [self clickRECell:sectionCount - 1 totalSection:sectionCount tableView:tableView fromVC:chatVC];//查看最新消息是否是红包
            }//end if
        } else {
            NSLog(@"can not click the wrong base vc");
        }
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(1);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self backToMainVC];
                NSLog(@"程序结束");
            });
        });
    });
}



- (void)clickRECell:(NSInteger)section totalSection:(NSInteger)sectionCount tableView:(MMTableView *)tableView fromVC:(BaseMsgContentViewController *)chatVC {//在聊天室点击有红包的cell 查看最新的消息。。领取红包，最终位于聊天室
    NSLog(@"检查红包cell");
    for (NSInteger i = section; i < sectionCount; i ++) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:i];
        UITableViewCell *cell = (UITableViewCell *)[chatVC tableView:tableView cellForRowAtIndexPath:index];
        UIView *contentView = [cell contentView];
        UIView *targetView = [[contentView subviews] firstObject];
        if ([targetView isKindOfClass:[NSClassFromString(@"WCPayC2CMessageCellView") class]]) {
            NSLog(@"true view");
            WCPayC2CMessageCellView *payView = (WCPayC2CMessageCellView *)targetView;
            dispatch_async(dispatch_get_main_queue(), ^{
                [payView onTouchDown];
                [payView onTouchUpInside];
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    sleep(1);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self openRE];
                    });
                });
            });
            sleep(10);
            sectionCount = [tableView numberOfSections];//如果领取的过程中又来了新红包的话也继续领取
        } else {
            NSLog(@"不是红包的视图");//这里一般是公众号发文章 或者别人发网站链接啥的
        }//end if
    }//end for
}

- (void)backToMainVC {//回到微信刚进来的那个视图
    NSLog(@"回到主视图");
    if ([self checkBaseMsgVC] != nil) {
        UITabBarController *rootVC = (UITabBarController *)([[UIApplication sharedApplication] keyWindow].rootViewController);
        UINavigationController *navigationVC = (UINavigationController *)[rootVC selectedViewController];
        [navigationVC popViewControllerAnimated:YES];
    } else {
        NSLog(@"不是聊天室视图,无法返回主视图");
    }//end if
}

- (void)openRE {//打开红包 如果是打开过的或者被领完了的处理 最终都回到聊天室
    NSLog(@"点开红包");
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if ([[window subviews] count] == 1) {//红包领过了,直接回到聊天室
        NSLog(@"这个红包领过了");
        [self backToVC];
    } else if ([[window subviews] count] == 2) {
        UIView *targetView = [[window subviews] lastObject];
        if ([targetView isKindOfClass:[NSClassFromString(@"WCRedEnvelopesReceiveHomeView") class]]) {
            WCRedEnvelopesReceiveHomeView *envelopesView = (WCRedEnvelopesReceiveHomeView *)targetView;
            UIView *imageView = [[envelopesView subviews] lastObject];
            if ([[imageView subviews] count] != 12) {
                NSLog(@"领取结束 %lu",(unsigned long)[[imageView subviews] count]);
                [envelopesView OnCancelButtonDone];
                return;
            }
            [envelopesView OnOpenRedEnvelopes];//领取红包
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                sleep(2);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self backToVC];//回到聊天室
                });
            });
        } else {
            NSLog(@"不能点开不是红包的视图");
        }//end if
    } else {
        NSLog(@"当前window可能错了");
    }//end if
}

- (UIViewController *)checkREVC {
    UIViewController *vc1 = [[UIApplication sharedApplication] keyWindow].rootViewController;
    if ([vc1 isKindOfClass:[NSClassFromString(@"UITabBarController") class]]) {
        UITabBarController *rootVC = (UITabBarController *)vc1;
        UIViewController *vc2 = [rootVC selectedViewController];
        if ([vc2 isKindOfClass:[NSClassFromString(@"UINavigationController") class]]) {
            UINavigationController *navigationVC = (UINavigationController *)vc2;
            UIViewController *targetVC = [navigationVC visibleViewController];
            if ([targetVC isKindOfClass:[NSClassFromString(@"WCRedEnvelopesRedEnvelopesDetailViewController") class]]) {
                return targetVC;
            } else {
                return nil;
            }//end if
        } else {
            return nil;
        }//end if
    } else {
        return nil;
    }//end if
}

- (void)backToVC {//领取红包成功，或者领取过了，回到聊天室
    NSLog(@"回到聊天室");
    UIViewController *targetVC = [self checkREVC];
    if (targetVC != nil) {
        WCRedEnvelopesRedEnvelopesDetailViewController *REDtail = (WCRedEnvelopesRedEnvelopesDetailViewController *)targetVC;
        [REDtail OnLeftBarButtonDone];
    } else {
        NSLog(@"不是红包领取结束视图");
    }//end if
}

@end
