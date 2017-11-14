//
//  WCGroupControl.h
//  firstoc
//
//  Created by 戴曦嘉 on 2017/11/8.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WCGroupControl : NSObject
- (void)runTask;
@end

@interface MMServiceCenter : NSObject
+ (id)defaultCenter;
- (id)getService:(Class)className;
@end


@interface CGroupMgr : NSObject
- (_Bool)AddGroupMember:(id)arg1 withMemberList:(id)arg2 withDesp:(id)arg3;//邀请成员
- (_Bool)CreateGroup:(id)arg1 withMemberList:(id)arg2;//创建群聊
- (_Bool)SetGroupTopic:(id)arg1 withTopic:(id)arg2;
- (_Bool)ShowInContactBook:(id)arg1 sync:(_Bool)arg2;

@end

@interface CContactMgr : NSObject
- (id)getContactList:(unsigned int)arg1 contactType:(unsigned int)arg2;

@end

@interface CGroupDB : NSObject
- (id)GetGroupMember:(id)arg1;

@end

@interface GroupMember : NSObject
@end

@interface CContact : NSObject

@end

@interface SettingUtil : NSObject
+ (id)getCurUsrName;

@end
