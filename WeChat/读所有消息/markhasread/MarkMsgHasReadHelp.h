//
//  MarkMsgHasReadHelp.h
//  firstoc
//
//  Created by 戴曦嘉 on 2017/10/25.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#ifndef MarkMsgHasReadHelp_h
#define MarkMsgHasReadHelp_h

@interface NewMainFrameViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@end

@interface MMMainTableView : UITableView

@end

@interface NewMainFrameCell : UITableViewCell

@end

@interface MainFrameCellData : NSObject

@end

@interface MMSessionInfo : NSObject
@property(nonatomic) unsigned int m_uUnReadCount; // @synthesize m_uUnReadCount;

@end

@interface MMServiceCenter : NSObject
+ (id)defaultCenter;
- (id)getService:(Class)className;
@end

@interface CMessageMgr : NSObject
- (void)ClearUnRead:(id)arg1 FromID:(unsigned int)arg2 ToID:(unsigned int)arg3;

@end
#endif /* MarkMsgHasReadHelp_h */
