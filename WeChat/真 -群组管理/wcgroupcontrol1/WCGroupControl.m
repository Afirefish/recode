//
//  WCGroupControl.m
//  firstoc
//
//  Created by 戴曦嘉 on 2017/11/8.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import "WCGroupControl.h"

@interface WCGroupControl ()
- (void)addContactToChatRoom;//添加好友进群
- (CContact *)noFullChatRoom:(NSInteger)fullNum;//返回一个没有加满的聊天室
- (void)obtainNoChatRoomContact;//获得没有群组的联系人数组
- (void)createChatRoom:(NSArray *)memArr; //建立群组,传成员wxid数组
- (void)addMem:(NSString *)contactName ToChatRoom:(NSString *)chatRoomName;//添加好友入群
- (void)changeChatRoom:(NSString *)chatRoomName topic:(NSString *)topic; //修改群聊名称
- (void)obtainAllChatRoomContact;//获得所有已经加入群的好友
- (BOOL)isAddToChatRoom:(NSString *)contactName;//判断某人是否加入到群组 只要在任意群组找到了这个wxid，就返回yes
- (void)obtainMyChatRoom;//获得我是群主的聊天室
- (BOOL)isChatRoomOwner:(CContact *)chatRoom;//判断是否是当前群组的群主
- (NSArray *)obtainChatMemName:(NSString *)chatRoomName;//获得群聊内的人
- (void)obtainAllChatRoom;//这里获得所有聊天室
- (void)obtainAllFriend;//获得所有好友
@property (strong,nonatomic) NSMutableArray *contactArr;//联系人数组
@property (strong,nonatomic) NSMutableArray *allChatRoomArr;//所有聊天室
@property (strong,nonatomic) NSMutableArray *friendArr;//所有好友NSString
@property (strong,nonatomic) NSMutableArray *chatRoomArr;//群组数据，存储群组的ccontact数据
@property (strong,nonatomic) NSMutableArray *myChatRoom;//我是群主的群组 ccontact
@property (strong,nonatomic) NSMutableArray *allChatRoomContact;//已经加入群的好友NSString
@property (strong,nonatomic) NSMutableArray *noChatRoomContact;//未加入群的好友NSString
@property (strong,nonatomic) NSMutableArray *addedContact;//添加了的好友
@property (strong,nonatomic) NSMutableArray *previousChatRoomArr;//之前的聊天室

@end

@implementation WCGroupControl

- (void)runTask {
    NSLog(@"为什么没有执行？");
    [self addContactToChatRoom];
}

- (instancetype)init {
    if (self = [super init]) {
        self.addedContact = [[NSMutableArray alloc] init];
        [self reloadData];

    }
    return self;
}

- (void)reloadData {
    [self obtainAllContact];
    [self obtainAllChatRoom];
    [self obtainAllFriend];
    [self obtainMyChatRoom];
    [self obtainAllChatRoomContact];
    [self obtainNoChatRoomContact];
    NSLog(@"reload Data");
}

- (void)addContactToChatRoom {//添加好友进群
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSInteger value = 0;
        NSInteger i = 0;
        for (i = 0; i < [self.noChatRoomContact count]; i ++) {
            NSLog(@" 第 %ld 次循环",(long)value ++);
            NSInteger count = [self.noChatRoomContact count];
            NSLog(@"count %ld",(long)count);
            CContact *chatRoom = [self noFullChatRoom:10];
            if (chatRoom != nil) {
                NSString *member = [self.noChatRoomContact objectAtIndex:i];
                NSString *chatRoomName = [chatRoom valueForKey:@"m_nsUsrName"];
                [self.addedContact addObject:member];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self addMem:member ToChatRoom:chatRoomName];
                    NSLog(@"添加群成员 %@ 群组名 %@",member,chatRoomName);
                });
                sleep(3);
                [self reloadData];
                i = -1;
            } else {
                if (count - i < 2 ) {//如果还剩一个人就结束
                    NSLog(@"还剩一个人不能加群");
                } else {//否则将数组之后的二个人一起在建一个新群
                    NSMutableArray *memArr = [[NSMutableArray alloc] init];
                    NSString *member1 = [self.noChatRoomContact objectAtIndex:i];
                    NSString *member2 = [self.noChatRoomContact objectAtIndex:i+1];
                    [memArr addObject:member1];
                    [memArr addObject:member2];
                    [self.addedContact addObject:member1];
                    [self.addedContact addObject:member2];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self createChatRoom:memArr];//建立了新群之后要刷新各种数组
                        NSLog(@"建立新群");
                    });
                    sleep(3);
                    self.previousChatRoomArr = self.myChatRoom;
                    [self reloadData];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        NSString *newChatRoom = [self getNewChatRoomName];
                        NSDate *senddate=[NSDate date];
                        NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
                        [dateformatter setDateFormat:@"YYYY-MM-dd-HH-mm-ss"];
                        NSString *topic=[dateformatter stringFromDate:senddate];
                        NSLog(@"topic %@",topic);
                        [self changeChatRoom:newChatRoom topic:topic];
                    });
                    sleep(3);
                    i = -1;
                }
            }
        }
    });
}

- (CContact *)noFullChatRoom:(NSInteger)fullNum {//返回一个没有加满的聊天室
    for (CContact *chatRoom in self.myChatRoom) {
        NSString *chatRoomName = [chatRoom valueForKey:@"m_nsUsrName"];
        NSInteger count = [[self obtainChatMemName:chatRoomName] count];
        if (count < fullNum) {
            NSLog(@"noFullChatRoom %@",chatRoom);
            return chatRoom;
        }
    }
    NSLog(@"noFullChatRoom");
    return nil;
}

- (NSString *)getNewChatRoomName {//获得新创建的群
    NSPredicate * filterPredicate1 = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",self.previousChatRoomArr];
    NSArray *filter = [self.myChatRoom filteredArrayUsingPredicate:filterPredicate1];
    //NSLog(@"filter count %@",[filter count]);
    NSLog(@" new name %@",[[filter firstObject] valueForKey:@"m_nsUsrName"]);
    return [[filter firstObject] valueForKey:@"m_nsUsrName"];
}

- (void)obtainNoChatRoomContact {//获得没有群组的联系人数组
    self.noChatRoomContact = [[NSMutableArray alloc] init];
    if (self.allChatRoomContact == nil) {
        self.noChatRoomContact = self.friendArr;
    }
    NSLog(@"allChatRoomContact %@ friendArr %@",self.allChatRoomContact,self.friendArr);
    for (NSString *allMem in self.friendArr) {
        BOOL flag1 = NO;
        for (NSString *member in self.allChatRoomContact) {
            if ([allMem isEqualToString:member]) {
                NSLog(@"%@联系人已经在群里了",member);
                flag1 = YES;
                break;
            }
        }
        if (flag1 == NO) {
            BOOL flag2 = NO;
            for (NSString *member in self.addedContact) {
                if ([member isEqualToString:allMem]) {
                    flag2 = YES;
                    break;
                }
            }
            if (flag2 == NO) {
                NSLog(@"没有进群的联系人 %@",allMem);
                [self.noChatRoomContact addObject:allMem];
            }
        }
    }
}

- (void)createChatRoom:(NSArray *)memArr {//建立群组,传成员wxid数组
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    CGroupMgr *gMgr = [serviceCenter getService:[NSClassFromString(@"CGroupMgr") class]];
    NSMutableArray *memList = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < [memArr count]; i ++) {
        GroupMember *member = [[NSClassFromString(@"GroupMember") alloc] init];
        [member setValue:[memArr objectAtIndex:i] forKey:@"m_nsMemberName"];
        [memList addObject:member];
    }
    [gMgr CreateGroup:nil withMemberList:memList];
    NSLog(@"createChatRoom");
}

- (void)addMem:(NSString *)contactName ToChatRoom:(NSString *)chatRoomName {//添加好友入群
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    CGroupMgr *gMgr = [serviceCenter getService:[NSClassFromString(@"CGroupMgr") class]];
    GroupMember *member = [[NSClassFromString(@"GroupMember")  alloc] init];
    [member setValue:contactName forKey:@"m_nsMemberName"];
    NSMutableArray *memList = [[NSMutableArray alloc] init];
    [memList addObject:member];
    [gMgr AddGroupMember:chatRoomName withMemberList:memList withDesp:nil];
    NSLog(@"AddtoChatRoom %@",memList);
}

- (void)changeChatRoom:(NSString *)chatRoomName topic:(NSString *)topic {//修改群聊名称
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    CGroupMgr *gMgr = [serviceCenter getService:[NSClassFromString(@"CGroupMgr") class]];
    [gMgr SetGroupTopic:chatRoomName withTopic:topic];
    [gMgr ShowInContactBook:chatRoomName sync:YES];
    NSLog(@"changeChatRoom");
}


- (void)obtainAllChatRoomContact {//获得所有已经加入群的好友
    self.allChatRoomContact = [[NSMutableArray alloc] init];
    for (NSString *friendName in self.friendArr) {
        if ([self isAddToChatRoom:friendName]) {
            NSLog(@"加入了群的好友 %@",friendName);
            [self.allChatRoomContact addObject:friendName];
        }
    }
    NSLog(@"obtainAllChatRoomContact");
}


- (BOOL)isAddToChatRoom:(NSString *)contactName {//判断某人是否加入到群组 只要在任意群组找到了这个wxid，就返回yes
    for (CContact *myChatRoom in self.myChatRoom) {
        NSArray *memList = [self obtainChatMemName:[myChatRoom valueForKey:@"m_nsUsrName"]];
        for (NSString *member in memList) {
            if ([member isEqualToString:contactName]) {
                NSLog(@"isAddToChatRoomYES");
                return YES;
            }
        }
    }
    return NO;
}

- (NSArray *)obtainChatMemName:(NSString *)chatRoomName {//获得群聊内的人
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    CGroupMgr *gMgr = [serviceCenter getService:[NSClassFromString(@"CGroupMgr") class]];
    CGroupDB *gDB = [gMgr valueForKey:@"m_oGroupDB"];
    NSArray *nameList = [[NSArray alloc] initWithArray:(NSArray *)[gDB GetGroupMember:chatRoomName]];
    NSLog(@"name list obtainChatMemName %@---%@",nameList,chatRoomName);
    return nameList;
}

- (void)obtainMyChatRoom {//获得我是群主的聊天室
    self.myChatRoom = [[NSMutableArray alloc] init];
    for (CContact *chatRoom in self.chatRoomArr) {
        if ([self isChatRoomOwner:chatRoom]) {
            [self.myChatRoom addObject:chatRoom];
            NSLog(@"obtainMyChatRoom %@",chatRoom);
        }
    }
    NSLog(@"obtainMyChatRoom ");
}

- (BOOL)isChatRoomOwner:(CContact *)chatRoom {//判断是否是当前群组的群主
    NSString *myWXID = [NSClassFromString(@"SettingUtil") getCurUsrName];
    if ([[chatRoom valueForKey:@"m_nsOwner"] isEqualToString:myWXID]) {
        NSLog(@"isChatRoomOwner %@",[chatRoom valueForKey:@"m_nsOwner"]);
        return YES;
    }
    NSLog(@"isChatRoomOwner");
    return NO;
}

- (void)obtainAllContact {//获得所有联系人，这个是第一步要做的
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    CContactMgr *cMgr = [serviceCenter getService:[NSClassFromString(@"CContactMgr") class]];
    self.contactArr = [cMgr getContactList:1 contactType:0];//返回联系人数组
    self.allChatRoomArr = [cMgr getContactList:6 contactType:0];//返回聊天室
    NSLog(@"obtainAllContact");
}

- (void)obtainAllChatRoom {//这里获得所有聊天室
    self.chatRoomArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < [self.allChatRoomArr count]; i ++) {
        CContact *user = [self.allChatRoomArr objectAtIndex:i];
        NSString *userName = [user valueForKey:@"m_nsUsrName"];
        if ([userName containsString:@"@chatroom"]) {
            [self.chatRoomArr addObject:user];
            NSLog(@"obtainAllChatRoom %@",userName);
        }
    }
    
}

- (void)obtainAllFriend {//获得所有好友
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
                [userName isEqualToString:@"wxid_2876568766325"] == FALSE &&
                [userName isEqualToString:myWXID] == FALSE &&
                [userName containsString:@"gh_"] == FALSE &&
                [userName isEqualToString:@"brandsessionholder_weapp"] == FALSE)  {
                if ([userName hasPrefix:@"wxid_"] && isdigit([userName characterAtIndex:5]) == TRUE) {
                    //NSLog(@"这个大概不是联系人%@",userName);
                } else {
                    [self.friendArr addObject:userName];
                    //NSLog(@"obtainAllFriend%@",userName);
                }
            }
        }
    }
    NSLog(@"friendArr %@",self.friendArr);
}

- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}


@end
