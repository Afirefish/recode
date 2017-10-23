//
//  NewMsgRespHelp.h
//  firstoc
//
//  Created by 戴曦嘉 on 2017/10/23.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#ifndef NewMsgRespHelp_h
#define NewMsgRespHelp_h


@interface MMServiceCenter : NSObject
+ (id)defaultCenter;
- (id)getService:(Class)className;

@end

@interface WCFacade : NSObject

@end


//接受消息模块

@interface WCNotificationCenterMgr : NSObject
- (id)init;
- (unsigned int)getUnReadMessageCount;
- (id)getUnReadMessages;
- (void)markMessageAllReadBeginWithMessage:(id)arg1;
- (void)saveSetting;

@end


@interface WCUserComment : NSObject
@property(nonatomic) int type; // @synthesize type;
@property(retain, nonatomic) NSString *username; // @synthesize username;
@property(nonatomic) unsigned int createTime; // @synthesize createTime;
@property(retain, nonatomic) NSString *commentID; // @synthesize commentID;
@property(retain, nonatomic) NSString *nickname; // @synthesize nickname;
@property(retain, nonatomic) NSString *content; // @synthesize content;

@end

@interface WCSNSMessage : NSObject
@property(retain, nonatomic) NSString *msgID; // @synthesize msgID;
@property(retain, nonatomic) NSString *objID; // @synthesize objID;
@property(retain, nonatomic) NSString *parentObjID; // @synthesize parentObjID;
@property(retain, nonatomic) WCUserComment *refComment; // @synthesize refComment;
@property(retain, nonatomic) WCUserComment *comment; // @synthesize comment;
@property(nonatomic) _Bool hasRead; // @synthesize hasRead;

@end


//发送消息模块

@interface WCCommentUploadMgr : NSObject
- (void)addCommentToWCObjectCache:(id)arg1;
- (void)tryStartNextTask;

@end

@interface FIFOFileQueue : NSObject
-(id)getAll;
-(BOOL)push:(id)push;
@end

@interface WCCommentItem : NSObject
@property(retain, nonatomic) NSString *itemID; // @synthesize itemID;
@property(retain, nonatomic) NSString *toUserName; // @synthesize toUserName;
@property(nonatomic) int type; // @synthesize type;
@property(retain, nonatomic) NSString *content; // @synthesize content;
@property(nonatomic) unsigned int createTime; // @synthesize createTime;
@property(retain, nonatomic) WCUserComment *refComment; // @synthesize refComment;
@property(nonatomic) unsigned int inQueueTime; // @synthesize inQueueTime;
@property(retain, nonatomic) NSString *clientID; // @synthesize clientID;

@end

@interface SettingUtil : NSObject
+ (id)getCurUsrName;

@end

#endif /* NewMsgRespHelp_h */
