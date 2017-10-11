//
//  RequestOKHelp.h
//  
//
//  Created by 戴曦嘉 on 2017/10/10.
//
//

#ifndef RequestOKHelp_h
#define RequestOKHelp_h

@interface SayHelloDataLogic : NSObject
- (void)loadData:(unsigned int)arg1;
- (id)getChatName:(unsigned int)arg1;
- (id)initWithScene:(unsigned int)arg1 delegate:(id)arg2;
- (id)getContactForUserName:(id)arg1;

@end

@interface MMTableView : UITableView

@end

@interface UITableViewCellContentView : UIView

@end

@interface ContactsItemView : UIView

@end

@interface ContactsItemCell : UITableViewCell

@end

@interface SayHelloViewController : UIViewController
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (void)onContactsItemViewRightButtonClick:(id)arg1;//传入view
- (void)verifyContactWithOpCode:(id)arg1 opcode:(unsigned int)arg2;//验证，第一个传入联系人信息
- (void)initData;
- (void)initTableView;
- (void)initView;
@end
#endif /* RequestOKHelp_h */
