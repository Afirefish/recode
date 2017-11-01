//
//  AddPhoneContact.m
//  firstoc
//
//  Created by 戴曦嘉 on 2017/11/1.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import "AddPhoneContact.h"

@interface AddPhoneContact()
@property (assign,nonatomic) BOOL isFind;
@property (strong,nonatomic) NSMutableArray *phoneFriends;

@end

@implementation AddPhoneContact

- (void)runTask:(NSString *)phoneNum {//运行任务
    [self searchFriends:phoneNum];
}

- (void)searchFriends:(NSString *)phoneNum {//没有添加的通讯录好友赋值到数组中
    __block NSMutableArray *friends = [[NSMutableArray alloc] init];
    UIViewController *vc = [self checkNewMainFrameVC];
    if (vc != nil) {
        NewMainFrameViewController *mainVC = (NewMainFrameViewController *)vc;
        [mainVC onShowPhoneFriend];
        //延迟进行数据处理
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIViewController *targetVC = [self checkPhoneFriendVC];
            if (targetVC != nil) {
                AddressBookFriendViewController *phoneFriendVC = (AddressBookFriendViewController *)targetVC;
                MMTableView *tableView = [phoneFriendVC valueForKey:@"m_tableView"];
                NSInteger sectionCount = [tableView numberOfSections];
                for (NSInteger section = 0; section < sectionCount; section ++) {//遍历所有cell
                    NSInteger rowCount = [tableView numberOfRowsInSection:section];
                    for (NSInteger row = 0; row < rowCount; row ++) {
                        NSIndexPath *index = [NSIndexPath indexPathForRow:row inSection:section];
                        UITableViewCell *cell = [phoneFriendVC tableView:tableView cellForRowAtIndexPath:index];
                        UIView *contentView = [cell contentView];
                        ContactsItemView *targetView = (ContactsItemView *)[[contentView subviews] lastObject];
                        if ([targetView valueForKey:@"m_rightButton"] == nil) {//添加了好友的不处理
                            NSLog(@"这个好友已经添加");
                        } else{//没有添加好友的手机号以及所在的行列信息存入数组
                            AddressBookFriend *addressBookFriend = (AddressBookFriend *)[targetView valueForKey:@"m_data"];
                            MMAddressBook *addressBook = (MMAddressBook *)[addressBookFriend valueForKey:@"m_addressBook"];
                            NSString *phoneNumber = [addressBook valueForKey:@"m_phone"];
                            NSNumber *rowNum = [NSNumber numberWithInteger:row];
                            NSNumber *sectionNum = [NSNumber numberWithInteger:section];
                            NSDictionary *friend =[NSDictionary dictionaryWithObjectsAndKeys:phoneNumber,@"phone",rowNum,@"row",sectionNum,@"section", nil];
                            [friends addObject:friend];
                        }
                    }//end for
                }// end for
                self.phoneFriends = [friends mutableCopy];
                [self addPhoneContact:phoneNum];
            } else {
                NSLog(@"不在通讯录朋友视图中");
            }
        });
    } else {
        NSLog(@"不在主视图中");
    }
}

- (void)addPhoneContact:(NSString *)phoneNum {//添加指定电话联系人
    NSLog(@"开始添加指定联系人");
    self.isFind = NO;
    UIViewController *targetVC = [self checkPhoneFriendVC];
    if (targetVC != nil) {
        AddressBookFriendViewController *phoneFriendVC = (AddressBookFriendViewController *)targetVC;
        MMTableView *tableView = [phoneFriendVC valueForKey:@"m_tableView"];
        NSInteger arrCount = [self.phoneFriends count];
        NSLog(@"数组数量 %lu",(unsigned long)arrCount);
        for (NSInteger i = 0; i < [self.phoneFriends count]; i ++) {//遍历数组，查找指定电话联系人
            NSDictionary *dic = [self.phoneFriends objectAtIndex:i];
            NSString *phoneNumber = [dic objectForKey:@"phone"];
            if ([phoneNumber isEqualToString:phoneNum]) {
                NSInteger row = [[dic objectForKey:@"row"] integerValue];
                NSInteger section = [[dic objectForKey:@"section"] integerValue];
                NSIndexPath *index = [NSIndexPath indexPathForRow:row inSection:section];
                UITableViewCell *cell = [phoneFriendVC tableView:tableView cellForRowAtIndexPath:index];
                UIView *contentView = [cell contentView];
                ContactsItemView *targetView = (ContactsItemView *)[[contentView subviews] lastObject];
                [self.phoneFriends removeObjectAtIndex:i];
                [phoneFriendVC onContactsItemViewRightButtonClick:targetView];
                //延迟进行处理
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self sendVerify];
                });
                self.isFind = YES;
                NSLog(@"找到了指定的通讯录好友");
            }
        }//end for
        if (self.isFind == NO) {//没有找到的话 随机添加一个
            NSLog(@" 没有找到这个电话联系人");
            NSInteger rand = arc4random() % arrCount;
            NSLog(@"随机数 %ld",(long)rand);
            NSDictionary *dic = [self.phoneFriends objectAtIndex:rand];
            NSLog(@"随机添加的联系人%@",dic);
            NSInteger row = [[dic objectForKey:@"row"] integerValue];
            NSInteger section = [[dic objectForKey:@"section"] integerValue];
            NSIndexPath *index = [NSIndexPath indexPathForRow:row inSection:section];
            UITableViewCell *cell = [phoneFriendVC tableView:tableView cellForRowAtIndexPath:index];
            UIView *contentView = [cell contentView];
            ContactsItemView *targetView = (ContactsItemView *)[[contentView subviews] lastObject];
            [self.phoneFriends removeObjectAtIndex:rand];
            [phoneFriendVC onContactsItemViewRightButtonClick:targetView];
            //延迟进行处理
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self sendVerify];
            });
        }//end if
    } else {
        NSLog(@"当前不是通讯录朋友视图");
    }//end if
}

- (void)sendVerify {//发送验证请求，发送完成后会回到通讯录朋友界面
    UIViewController *vc = [self checksendVerifyVC];
    if (vc != nil) {
        SendVerifyMsgViewController *sendVerifyVC = (SendVerifyMsgViewController *)vc;
        [sendVerifyVC onSendVerifyMsg];
    }//end if
    
}

- (UIViewController *)checkVC:(NSString *)viewController {
    UIViewController *vc1 = [[UIApplication sharedApplication] keyWindow].rootViewController;
    if ([vc1 isKindOfClass:[NSClassFromString(@"UITabBarController") class]]) {
        UITabBarController *rootVC = (UITabBarController *)vc1;
        UIViewController *vc2;
        if ([rootVC presentedViewController] != nil) {
            vc2 = [rootVC presentedViewController];
        } else {
            vc2 = [rootVC selectedViewController];
        }
        if ([vc2 isKindOfClass:[NSClassFromString(@"UINavigationController") class]]) {
            UINavigationController *navigationVC = (UINavigationController *)vc2;
            UIViewController *targetVC = [navigationVC visibleViewController];
            if ([targetVC isKindOfClass:[NSClassFromString(viewController) class]]) {
                return targetVC;
            } else {
                return nil;
            }//end if
        } else {
            return nil;
        }//end if
    } else {
        return nil;
    }//end if
}


- (UIViewController *)checkNewMainFrameVC {//检查是否是主视图
    return [self checkVC:@"NewMainFrameViewController"];
}

- (UIViewController *)checkPhoneFriendVC {//检查是否是通讯录朋友界面
    return [self checkVC:@"AddressBookFriendViewController"];
}

- (UIViewController *)checksendVerifyVC {//检查是否是添加好友的验证界面
    return [self checkVC:@"SendVerifyMsgViewController"];
}

@end
