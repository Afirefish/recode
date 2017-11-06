//
//  WXGroupControl.m
//  firstoc
//
//  Created by 戴曦嘉 on 2017/11/3.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import "WXGroupControl.h"


@implementation WXGroupControl

- (void)runTask:(NSString *)task {//根据传入不同的参数执行任务
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    CGroupMgr *gMgr = [serviceCenter getService:[NSClassFromString(@"CGroupMgr") class]];
    NSString *room = [NSString string];//聊天室名
    NSMutableArray *members = [NSMutableArray array];//群组成员 wxid
    [members addObject:@"wxid_j79te0rwqh0d22"];
    [members addObject:@"wxid_wh8nzjjts08822"];
    NSString *topic = [NSString string];//聊天室话题
    NSString *member = [NSString string];//要添加的群组成员
    if ([task isEqualToString:@"createGroup"]) {
        [self createGroup:members mgr:gMgr];
    } else if ([task isEqualToString:@"addGroupMem"]) {
        [self addGroupMem:member room:room mgr:gMgr];
    } else if ([task isEqualToString:@"changeGroupName"]) {
        [self changeGroupName:room topic:topic mgr:gMgr];
    }
}


- (void)createGroup:(NSArray *)memArr mgr:(CGroupMgr *)gMgr{//创建群聊,第一个参数传一个wxid数组
    NSMutableArray *friendArr = [NSMutableArray array];
    for (NSInteger i = 0; i < [memArr count]; i ++) {
        GroupMember *member = [[NSClassFromString(@"GroupMember") alloc] init];
        [member setValue:[memArr objectAtIndex:i] forKey:@"m_nsMemberName"];
        [friendArr addObject:member];
    }
    [gMgr CreateGroup:nil withMemberList:friendArr];

}

- (void)addGroupMem:(NSString *)wxid room:(NSString *)room mgr:(CGroupMgr *)gMgr {//添加成员，第一个参数传一个wxid 第二个传房间名字
    CGroupDB *gDB = [gMgr valueForKey:@"m_oGroupDB"];
    NSArray *nameList = [[NSArray alloc] initWithArray:(NSArray *)[gDB GetGroupMember:room]];
    for (NSInteger i = 0; i < [nameList count]; i ++) {
        if ([[nameList objectAtIndex:i] isEqualToString:wxid]) {//判断群组是否有该联系人
            NSLog(@"群组里已经有这个联系人了");
            return;
        }
    }
    GroupMember *member = [[NSClassFromString(@"GroupMember")  alloc] init];
    [member setValue:wxid forKey:@"m_nsMemberName"];
    [gMgr AddGroupMember:room withMemberList:member withDesp:nil];
}

- (void)changeGroupName:(NSString *)room topic:(NSString *)topic mgr:(CGroupMgr *)gMgr{//改变群名字
    [gMgr SetGroupTopic:room withTopic:topic];
}




@end
