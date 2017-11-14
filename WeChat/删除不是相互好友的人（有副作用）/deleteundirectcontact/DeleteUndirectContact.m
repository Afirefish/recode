//
//  DeleteUndirectContact.m
//  firstoc
//
//  Created by 戴曦嘉 on 2017/11/14.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import "DeleteUndirectContact.h"

@interface DeleteUndirectContact ()
@property (strong,nonatomic) NSMutableArray *contactArr;//联系人数组
@property (strong,nonatomic) NSMutableArray *friendArr;//所有好友
@property (strong,nonatomic) NSMutableSet *undirectFriend;//不是互相是好友的好友

@end

@implementation DeleteUndirectContact

+ (instancetype)deleteUndirectContact {//因为hook多个函数，要用单例
    static DeleteUndirectContact *deleteUndirectContact = nil;
    if (deleteUndirectContact == nil) {
        deleteUndirectContact = [[DeleteUndirectContact alloc] init];
    }
    return deleteUndirectContact;
}

- (instancetype)init {
    if (self = [super init]) {
        [self reloadData];
    }
    return self;
}

- (void)reloadData {//加载数据
    self.contactArr = [[NSMutableArray alloc] init];
    self.friendArr = [[NSMutableArray alloc] init];
    self.undirectFriend = [[NSMutableSet alloc] init];
    [self obtainAllFriend];
}

- (void)sendAllMessage {//运行发消息的任务
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (CContact *contact in self.friendArr) {
            NSString *wxid = [contact valueForKey:@"m_nsUsrName"];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self sendMessage:wxid];
            });
            sleep(5);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self deleteFriend];
        });
    });
}

- (void)runTask:(MMSessionInfo *)newMsgCellInfo {//检查新消息是不是系统提示
    [self checkStranger:newMsgCellInfo];
}

- (void)checkStranger:(MMSessionInfo *)newMsgCellInfo{
    //这里通过微信自己的新消息提醒，检测一下新消息是不是系统提示
    UIViewController *targetVC = [self checkNewMainFrameVC];
    if (targetVC != nil) {
        CMessageWrap *msg = [newMsgCellInfo valueForKey:@"m_msgWrap"];
        NSString *name = newMsgCellInfo.m_nsUserName;
        if (msg.m_uiMessageType == 10000 && [msg.m_nsContent containsString:@"开启了朋友验证"]) {//如果等于10000的话，就是系统提示,做的简单了一点，如果想要更加确认一些的话，应该检查一下提示内容
            [self.undirectFriend addObject:name];
            NSLog(@"或许是系统提示 %@ arr %@",name,self.undirectFriend);
        } else {
            NSLog(@"%@ 的新消息不是系统提示",name);
        }//end if
    } else {
        NSLog(@"没有位于主视图");
    }//end if
}

- (void)deleteFriend {//删除非双向好友
    NSLog(@"the undirectFriend arr %@",self.undirectFriend);
    for (NSString *name in self.undirectFriend) {
        MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
        CContactMgr *cMgr = [serviceCenter getService:[NSClassFromString(@"CContactMgr") class]];
        CContact *contact = [cMgr getContactFromDB:name];
        [cMgr deleteContact:contact listType:2];
        [cMgr deleteContactLocal:contact listType:1];
        [cMgr getContactList:1 contactType:0];
        NSLog(@"删除成功");
    }
    [self reloadData];
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

- (void)sendMessage:(NSString *)wxid {//发送消息
    CMessageWrap *classCMessageWrap = [[NSClassFromString(@"CMessageWrap") alloc] initWithMsgType:1];
    [classCMessageWrap setM_nsToUsr:wxid];
    [classCMessageWrap setM_nsFromUsr:@"wxid_nra30q0yczvf12"];
    [classCMessageWrap setM_uiMessageType:1];
    [classCMessageWrap setM_nsContent:@"你好"];
    MMServiceCenter* serviceCenter = [NSClassFromString(@"MMServiceCenter") defaultCenter];
    [[serviceCenter getService:[NSClassFromString(@"CMessageMgr") class]] AddMsg:@"wxid_nra30q0yczvf12" MsgWrap:classCMessageWrap];
}

- (void)revokeMessage {//撤回消息
    
}

- (void)obtainAllFriend {//获得所有好友
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    CContactMgr *cMgr = [serviceCenter getService:[NSClassFromString(@"CContactMgr") class]];
    self.contactArr = [cMgr getContactList:1 contactType:0];//返回联系人数组
    self.friendArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < [self.contactArr count]; i ++) {
        CContact *user = [self.contactArr objectAtIndex:i];
        NSString *userName = [user valueForKey:@"m_nsUsrName"];
        NSString *myWXID = [NSClassFromString(@"SettingUtil") getCurUsrName];
        if (![userName hasSuffix:@"@chatroom"]) {
            if ([userName isEqualToString:@"masssendapp"] == FALSE &&
                [userName isEqualToString:@"qqmail"] == FALSE &&
                [userName isEqualToString:@"brandsessionholder"] == FALSE &&
                [userName isEqualToString:@"floatbottle"] == FALSE &&
                [userName isEqualToString:@"qqsync"] == FALSE &&
                [userName isEqualToString:@"voipapp"] == FALSE &&
                [userName isEqualToString:@"weixin"] == FALSE &&
                [userName isEqualToString:@"googlecontact"] == FALSE &&
                [userName isEqualToString:@"linkedinplugin"] == FALSE &&
                [userName isEqualToString:@"iwatchholder"] == FALSE &&
                [userName isEqualToString:@"fmessage"] == FALSE &&
                [userName isEqualToString:@"qmessage"] == FALSE &&
                [userName isEqualToString:@"notification_messages"] == FALSE &&
                [userName isEqualToString:@"voiceinputapp"] == FALSE &&
                [userName isEqualToString:@"blogapp"] == FALSE &&
                [userName isEqualToString:@"voiceinputapp"] == FALSE &&
                [userName isEqualToString:@"newsapp"] == FALSE &&
                [userName isEqualToString:@"feedsapp"] == FALSE &&
                [userName isEqualToString:@"medianote"] == FALSE &&
                [userName isEqualToString:@"voicevoipapp"] == FALSE &&
                [userName isEqualToString:myWXID] == FALSE &&
                [userName containsString:@"gh_"] == FALSE &&
                [userName isEqualToString:@"brandsessionholder_weapp"] == FALSE)  {
                if ([userName hasPrefix:@"wxid_"] && isdigit([userName characterAtIndex:5]) == TRUE) {
                    ;
                } else {
                    [self.friendArr addObject:user];
                }
            }
        }
    }
}

@end
