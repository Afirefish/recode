//
//  OpenRedEnvelopesHelp.h
//  firstoc
//
//  Created by 戴曦嘉 on 2017/10/23.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#ifndef OpenRedEnvelopesHelp_h
#define OpenRedEnvelopesHelp_h

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

@interface CContact : NSObject

@end

@interface CMessageWrap : NSObject
@property(nonatomic) unsigned int m_uiMessageType; // @synthesize m_uiMessageType;

@end

@interface BaseMsgContentViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@end

@interface MMTableView : UITableView

@end

@interface WCPayC2CMessageCellView : UIView
- (void)onTouchDown;
- (void)onTouchUpInside;
@end

@interface WCRedEnvelopesReceiveHomeView : UIView
 - (void)OnOpenRedEnvelopes;
- (void)OnCancelButtonDone;

@end

@interface WCRedEnvelopesRedEnvelopesDetailViewController : UIViewController
- (void)OnLeftBarButtonDone;

@end

#endif /* OpenRedEnvelopesHelp_h */
