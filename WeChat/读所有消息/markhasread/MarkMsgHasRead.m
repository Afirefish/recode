//
//  MarkMsgHasRead.m
//  firstoc
//
//  Created by 戴曦嘉 on 2017/10/25.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import "MarkMsgHasRead.h"
#import "MarkMsgHasReadHelp.h"

@implementation MarkMsgHasRead

- (void)runTask {//默认标记所有的为已读
    [self markMsgHasRead:nil];
}

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


- (void)markMsgHasRead:(NSString *)targetChatRoom {//标记所有消息已读,第一个参数传入nil,如果想要某一个聊天室标记已读，传入聊天室的名字
    UIViewController *targetVC = [self checkNewMainFrameVC];
    if (targetVC != nil) {
        NewMainFrameViewController *mainVC = (NewMainFrameViewController *)targetVC;
        MMMainTableView *tableView = (MMMainTableView *)[targetVC valueForKey:@"m_tableView"];
        NSInteger sectionCount = [tableView numberOfSections];
        if (sectionCount == 2) {
            NSInteger rowCount = [tableView numberOfRowsInSection:1];
            NSLog(@"这里有%ld个cell",(long)rowCount);
            for (NSInteger i = 0; i < rowCount; i ++) {
                NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:1];
                NewMainFrameCell *cell = (NewMainFrameCell *)[mainVC tableView:tableView cellForRowAtIndexPath:index];
                MainFrameCellData *data = [cell valueForKey:@"m_cellData"];
                MMSessionInfo *sessionInfo = (MMSessionInfo *)[data valueForKey:@"m_sessionInfo"];
                NSString *chatRoom = [sessionInfo valueForKey:@"m_nsUserName"];
                MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
                CMessageMgr *msgMgr = [serviceCenter getService:[NSClassFromString(@"CMessageMgr") class]];
                if (targetChatRoom == nil) {
                    [msgMgr ClearUnRead:chatRoom FromID:0 ToID:0];
                } else {
                    [msgMgr ClearUnRead:targetChatRoom FromID:0 ToID:0];
                    break;
                }//end if
            }//end for
        } else {
            NSLog(@"当前可能没有聊天信息或者有什么特殊情况");
        }//end if
    } else {
        NSLog(@"当前没有处于聊天主视图");
    }//end if
}

@end
