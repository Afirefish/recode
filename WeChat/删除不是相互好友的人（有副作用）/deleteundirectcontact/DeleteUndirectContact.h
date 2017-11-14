//
//  DeleteUndirectContact.h
//  firstoc
//
//  Created by 戴曦嘉 on 2017/11/14.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMServiceCenter : NSObject
+ (id)defaultCenter;
- (id)getService:(Class)className;
@end

@interface CContactMgr : NSObject
- (id)getContactList:(unsigned int)arg1 contactType:(unsigned int)arg2;
- (id)getContactFromDB:(id)arg1;
- (_Bool)deleteContact:(id)arg1 listType:(unsigned int)arg2;
- (_Bool)deleteContactLocal:(id)arg1 listType:(unsigned int)arg2;
@end

@interface CContact : NSObject

@end

@interface SettingUtil : NSObject
+ (id)getCurUsrName;

@end

@interface CMessageWrap : NSObject
@property(retain, nonatomic) NSString *m_nsToUsr; // @synthesize m_nsToUsr;
@property(retain, nonatomic) NSString *m_nsFromUsr; // @synthesize m_nsFromUsr;
@property(nonatomic) unsigned int m_uiMessageType; // @synthesize m_uiMessageType;
@property(retain, nonatomic) NSString *m_nsContent; // @synthesize m_nsContent;
@property(nonatomic) unsigned int m_uiMsgFlag; // @synthesize m_uiMsgFlag;
- (id)initWithMsgType:(long long)arg1;

@end

@interface CMessageMgr : NSObject
- (void)AddMsg:(id)arg1 MsgWrap:(id)arg2;
- (void)CheckMessageStatus:(id)arg1 Msg:(id)arg2;

@end

@interface NewMainFrameViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@end

@interface MMMainTableView : UITableView

@end

@interface NewMainFrameCell : UITableViewCell

@end

@interface MainFrameCellData : NSObject

@end

@interface MMSessionInfo : NSObject
@property(retain, nonatomic) NSString *m_nsUserName; // @synthesize m_nsUserName;

@end

@interface DeleteUndirectContact : NSObject
+ (instancetype)deleteUndirectContact;
- (void)sendAllMessage;//首先给所有人发信息
- (void)runTask:(MMSessionInfo *)newMsgCellInfo;//在发送信息之后标记系统提示不是好友的好友，删除，然后再发信息，循环完所有好友

@end





