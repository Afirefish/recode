//
//  AddPhoneContact.h
//  firstoc
//
//  Created by 戴曦嘉 on 2017/11/1.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPhoneContact : NSObject
- (void)runTask:(NSString *)phoneNum;
@end


@interface NewMainFrameViewController : UIViewController
- (void)onShowPhoneFriend;

@end

@interface AddressBookFriendViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (void)onContactsItemViewRightButtonClick:(id)arg1;

@end

@interface MMTableView : UITableView

@end

@interface ContactsItemView : UIView

@end

@interface AddressBookFriend : NSObject

@end

@interface MMAddressBook : NSObject

@end

@interface SendVerifyMsgViewController : UIViewController
- (void)onSendVerifyMsg;

@end
