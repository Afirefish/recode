//
//  AddContact.h
//  
//
//  Created by 戴曦嘉 on 2017/8/16.
//
//

#import <Foundation/Foundation.h>

@interface AddContact : NSObject
+ (instancetype)singleInstance;
- (void)startMission:(int)arg1;
- (void)addContact;
- (void)deleteAllContacts;

@end
