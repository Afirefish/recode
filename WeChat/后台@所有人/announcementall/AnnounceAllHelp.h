//
//  AnnounceAllHelp.h
//  firstoc
//
//  Created by 戴曦嘉 on 2017/10/27.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#ifndef AnnounceAllHelp_h
#define AnnounceAllHelp_h

@interface MMServiceCenter : NSObject
+ (id)defaultCenter;
- (id)getService:(Class)className;
@end

@interface SettingUtil : NSObject
+ (id)getCurUsrName;

@end

@protocol IMsgExtendOperation <NSObject>

@end

@interface CMessageWrap : NSObject
@property(retain, nonatomic) NSString *m_nsToUsr; // @synthesize m_nsToUsr;
@property(retain, nonatomic) NSString *m_nsFromUsr; // @synthesize m_nsFromUsr;
@property(nonatomic) unsigned int m_uiMessageType; // @synthesize m_uiMessageType;
@property(retain, nonatomic) NSString *m_nsContent; // @synthesize m_nsContent;
@property(retain, nonatomic) id <IMsgExtendOperation> m_extendInfoWithMsgType; // @synthesize m_extendInfoWithMsgType;
@property(nonatomic) unsigned int m_uiMsgFlag; // @synthesize m_uiMsgFlag;
- (id)initWithMsgType:(long long)arg1;
@property(retain, nonatomic) NSString *m_nsMsgSource; // @synthesize m_nsMsgSource;
@property(nonatomic) unsigned int m_uiStatus; // @synthesize m_uiStatus;


@end

@interface BaseMsgContentViewController : UIViewController

@end

@interface BaseMsgContentLogicController : NSObject
- (void)ResendMsg:(id)arg1 MsgWrap:(id)arg2;
- (void)initViewController;
- (void)initControllers;
- (void)initProperties;
- (void)OnAddMsg:(id)arg1 MsgWrap:(id)arg2;
- (void)DidAddMsg:(id)arg1;


@end

@interface CGroupMgr : NSObject
- (_Bool)SetChatRoomDesc:(id)arg1 Desc:(id)arg2 Flag:(unsigned int)arg3;//群主才好用。。

@end

@interface CGroupDB : NSObject
- (id)GetGroupMember:(id)arg1;

@end

@interface CMessageMgr : NSObject
- (id)GetMsg:(id)arg1 LocalID:(unsigned int)arg2;
- (void)AsyncOnAddMsg:(id)arg1 MsgWrap:(id)arg2;
- (void)CheckMessageStatus:(id)arg1 Msg:(id)arg2;
- (void)AddMsg:(id)arg1 MsgWrap:(id)arg2;

@end



@interface CContact : NSObject
@property(retain, nonatomic) NSString *m_nsOwner; // @synthesize m_nsOwner;

@end

@interface ChatRoomDetail : NSObject
@property(retain, nonatomic) NSString *m_nsChatRoomDescModer; // @synthesize m_nsChatRoomDescModer;


@end

#endif /* AnnounceAllHelp_h */
