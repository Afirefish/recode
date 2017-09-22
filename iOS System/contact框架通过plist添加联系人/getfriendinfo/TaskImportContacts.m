//
//  TaskImportContacts.m
//  lingyongqian
//
//  Created by 张健 on 2017/8/17.
//  Copyright © 2017年 ZJTechnology. All rights reserved.
//

#import "TaskImportContacts.h"
#import <Contacts/Contacts.h>

@interface TASK_IMPORT_CONTACTS ()
@property (nonatomic, strong) NSArray *allContacts;
@property (nonatomic, strong) NSMutableArray *successContacts;
@property (nonatomic, strong) NSMutableArray *failedContacts;
@property (nonatomic, copy) NSString *type;
@end

@implementation TASK_IMPORT_CONTACTS
//@synthesize stop_callback;

- (NSMutableArray *)successContacts{
    if (!_successContacts) {
        _successContacts = [NSMutableArray array];
    }
    return _successContacts;
}

- (NSMutableArray *)failedContacts{
    if (!_failedContacts) {
        _failedContacts = [NSMutableArray array];
    }
    return _failedContacts;
}

- (void)start:(NSMutableDictionary *)arg_dic{
    if (![arg_dic.allKeys containsObject:@"contacts"] || ![arg_dic.allKeys containsObject:@"type"]){
        NSLog(@"任务参数错误");
        return;
    }
    self.allContacts = arg_dic[@"contacts"];
    self.type = arg_dic[@"type"];
    if ([self.type isEqualToString:@"APPEND"]) { // 追加
        [self appendContacts:self.allContacts];
    }else if ([self.type isEqualToString:@"OVERRIDE"]){ // 覆盖
        [self overideContacts:self.allContacts];
    }else{
    
    }
}

- (void)appendContacts:(NSArray *)contacts{
    
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];//check the authorization
    if (status != CNAuthorizationStatusAuthorized) {
        NSLog(@"NOT CNAuthorizationStatus");
    } else {
        NSLog(@"why you can't add contact");
    }
    
    NSLog(@"ADDcontact");
    NSLog(@"contactsssss---%@",contacts);
    for (int i = 0; i < contacts.count; i++) {
        NSLog(@"first for loop");
        NSDictionary *newContact = contacts[i];
        NSLog(@"%zd newContact %@",i,newContact);
        CNMutableContact *contact = [[CNMutableContact alloc] init];
        contact.familyName = newContact[@"name"];
        CNLabeledValue *mobilePhone = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberiPhone value:[CNPhoneNumber phoneNumberWithStringValue:newContact[@"phone"]]];
        contact.phoneNumbers = @[mobilePhone];
        CNContactStore *contactStore = [[CNContactStore alloc] init];
        NSLog(@"reach store!come on");
        NSError *error;
        NSPredicate *predicateGivenName = [CNContact predicateForContactsMatchingName:contact.familyName];
        NSArray *keys = @[CNContactFamilyNameKey,CNContactPhoneNumbersKey];//
        NSLog(@"GET THERE");
        NSArray *allContacts = [contactStore unifiedContactsMatchingPredicate:predicateGivenName keysToFetch:keys error:&error];//get all contacts who have the name as the given name
        NSLog(@"error----%@",error);
        BOOL result = NO;
        NSLog(@"allcontacts---%@",allContacts);
        if (allContacts.count == 0) {//if no contact is the given name, create a new contact
            NSLog(@"first if condition" );
            CNSaveRequest *request = [[CNSaveRequest alloc] init];
            [request addContact:contact toContainerWithIdentifier:nil];
            result = [contactStore executeSaveRequest:request error:nil];
            NSLog(@"allcontactget");
        } else {
            for (int i = 0; i < allContacts.count; i++) {//check all contacts who have the family name is the new contact name
                NSLog(@"second for loop");
                CNMutableContact *sameNameContact = [allContacts[i] mutableCopy];
                CNLabeledValue *newPhone = [contact.phoneNumbers firstObject];
                CNPhoneNumber *newPhoneNumber = newPhone.value;
                NSMutableArray *samePhoneNumbers = [sameNameContact.phoneNumbers mutableCopy];
                int numberRepeat = 0;//flag for whether the phone number is included in the previous contact phone numbers
                for (CNLabeledValue * labelValue in samePhoneNumbers) {
                    NSLog(@"third for loop");
                    CNPhoneNumber * number = labelValue.value;
                    if ([number.stringValue isEqualToString:newPhoneNumber.stringValue]) {//if found,set the repeat flag as 1
                        NSLog (@" second if condition");
                        numberRepeat = 1;
                        break;
                    }//end if
                }//end for
                if (numberRepeat == 0) {//if not repeat,add the new phone number to contact
                    NSLog(@"third if conditon");
                    [samePhoneNumbers addObject:newPhone];
                    sameNameContact.phoneNumbers = samePhoneNumbers;
                    CNSaveRequest *request = [[CNSaveRequest alloc] init];
                    [request updateContact:sameNameContact];
                    result = [contactStore executeSaveRequest:request error:nil];
                }else{
                    result = YES;
                }
            }
        }
        if (result) {
            NSLog(@"1RESULT");
            [self.successContacts addObject:newContact];
        }else{
            NSLog(@"2RESULT");
            [self.failedContacts addObject:newContact];
        }
    }
    //stop_callback();
}

- (void)overideContacts:(NSArray *)contacts{
    //delete all contact
    NSLog(@"deleteContact");
    NSMutableArray *oldContacts = [NSMutableArray array];
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    NSArray *keys = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey];
    CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
    [contactStore enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        [oldContacts addObject:contact];
    }];
    //NSLog (@"%@addObjectsuccess",array);
    for (int i = 0; i < [oldContacts count]; i++) {//delete all contacts
        CNMutableContact *con = [oldContacts[i] mutableCopy];
        CNSaveRequest *request = [[CNSaveRequest alloc] init];
        [request deleteContact:con];
        [contactStore executeSaveRequest:request error:nil];
    }
    [self appendContacts:contacts];
}

- (NSDictionary *)status{
    NSNumber *failedNum = [NSNumber numberWithInteger:self.failedContacts.count];
    NSNumber *successNum = [NSNumber numberWithInteger:self.successContacts.count];
    NSDictionary *returnDic = @{
                                @"success_count":successNum,
                                @"failure_count":failedNum
                                };
    return returnDic;
}

- (NSNumber *)progress{
    float progess = 0.0;
    if (self.successContacts.count > 0){
        progess = (float)self.successContacts.count / (float)self.allContacts.count;
    };
    return  [NSNumber numberWithFloat:progess];
}
@end
