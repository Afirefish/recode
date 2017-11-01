//
//  AnnounceAll.m
//  firstoc
//
//  Created by 戴曦嘉 on 2017/10/27.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import "AnnounceAll.h"
#import "AnnounceAllHelp.h"

@implementation AnnounceAll

- (void)runTask {
    [self notifyContact];
}

- (UIViewController *)checkBaseChatFrameVC {//检查是否是主视图
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

- (NSInteger)getChatMemName:(NSString *)chatRoom {//获得群聊数量
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    CGroupMgr *gMgr = [serviceCenter getService:[NSClassFromString(@"CGroupMgr") class]];
    CGroupDB *gDB = [gMgr valueForKey:@"m_oGroupDB"];
    NSArray *nameList = [[NSArray alloc] initWithArray:(NSArray *)[gDB GetGroupMember:chatRoom]];
    NSInteger count = [nameList count];
    return count;
}

- (void)notifyContact {//通知所有人
    UIViewController *targetVC = [self checkBaseChatFrameVC];
    if ([targetVC isKindOfClass:[NSClassFromString(@"BaseMsgContentViewController") class]]) {
        BaseMsgContentViewController *baseVC = (BaseMsgContentViewController *)targetVC;
        BaseMsgContentLogicController *baseLogic = (BaseMsgContentLogicController *)[baseVC valueForKey:@"m_delegate"];
        CContact *chatRoom = (CContact *)[baseLogic valueForKey:@"m_contact"];
        NSString *RoomName = (NSString *)[chatRoom valueForKey:@"m_nsUsrName"];
        NSString *members = (NSString *)[chatRoom valueForKey:@"m_nsChatRoomMemList"];
        //NSLog(@" member string1 %@",members);
        NSString *trueMem = [members stringByReplacingOccurrencesOfString:@";" withString:@","];
        //NSLog(@"member string2 %@",trueMem);
        NSString *finalStr = [NSString stringWithFormat:@"<msgsource><atuserlist>%@</atuserlist></msgsource>",trueMem];
        //NSLog(@"final str %@",finalStr);
        CMessageWrap *wrap = [[NSClassFromString(@"CMessageWrap") alloc] initWithMsgType:1];
        [wrap setM_uiMessageType:1];
        [wrap setM_nsMsgSource:trueMem];
        [wrap setM_nsMsgSource:finalStr];
        //[wrap setM_nsAtUserList:trueMem];
        [wrap setM_uiStatus:1];
        [wrap setM_nsToUsr:RoomName];
        NSString *myWXID = [NSClassFromString(@"SettingUtil") getCurUsrName];
        [wrap setM_nsFromUsr:myWXID];
        NSInteger count = [self getChatMemName:RoomName];
        NSString *content = [[NSString alloc] init];
        for (NSInteger i = 0 ; i < count; i ++) {
            content = [content stringByAppendingString:@"@"];
        }
        NSLog(@"content %@",content);
        [wrap setM_nsContent:content];
        MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
        CMessageMgr *mMgr = [serviceCenter getService:[NSClassFromString(@"CMessageMgr") class]];
        [mMgr AddMsg:RoomName MsgWrap:wrap];
    }
}

;






@end
