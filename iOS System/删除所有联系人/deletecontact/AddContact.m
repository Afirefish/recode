//
//  AddContact.m
//
//
//  Created by 戴曦嘉 on 2017/8/16.
//
//
#import <Contacts/Contacts.h>
#import "AddContact.h"

@implementation AddContact

static AddContact *_ins = nil;
+ (instancetype)singleInstance {
    //create a single instance
    if (_ins == nil) {
        _ins = [[AddContact alloc] init];
    }
    return _ins;
}


- (void)addContact {
    /*CNContactStore *store = [[CNContactStore alloc] init];
     NSPredicate *predicateGivenName = [CNContact predicateForContactsMatchingName:@"飞"];
     NSArray *keys1 = @[CNContactGivenNameKey];
     NSError *error;
     NSArray *allContacts = (NSArray *)[store unifiedContactsMatchingPredicate:predicateGivenName keysToFetch:keys1 error:&error];
     NSLog(@"count == %lu",(unsigned long)allContacts.count);
     for (CNMutableContact *con in allContacts) {
     CNSaveRequest *request = [[CNSaveRequest alloc] init];
     [request deleteContact:con];
     [store executeSaveRequest:request error:nil];
     NSLog(@"delete success");
     }*/
    NSMutableArray *array = [NSMutableArray array];
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (status != CNAuthorizationStatusAuthorized) {
        NSLog(@"NOT CNAuthorizationStatus");
    }
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    NSArray *keys = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey,CNContactImageDataKey];
    CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
    [contactStore enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        [array addObject:contact];
    }];
    NSLog (@"%@addObjectsuccess",array);
    for (unsigned long i = [array count]; i > 0; i--) {
        CNMutableContact *con = [[array objectAtIndex:i-1] mutableCopy];
        CNSaveRequest *request = [[CNSaveRequest alloc] init];
        [request deleteContact:con];
        [contactStore executeSaveRequest:request error:nil];
        NSLog(@"delete success");
    }
}

@end
