//
//  FileToContacts.h
//  
//
//  Created by 戴曦嘉 on 2017/8/18.
//
//

#import <Foundation/Foundation.h>

@interface FileToContacts : NSObject
+ (instancetype)singleInstance;//create a single instance
- (NSString *)writeContactsToFile;//write contacts to plist file
- (void)writeContactsFromFile;//write contacts to address book from plist file
@end
