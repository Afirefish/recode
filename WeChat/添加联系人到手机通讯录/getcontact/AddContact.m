//
//  AddContact.m
//  Test
//
//  Created by 戴曦嘉 on 2017/8/16.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
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


- (void)startMission:(int)mission {
    //0 for add contact,1 for delete all contact
    if(mission == 0){
        [self addContact];
        NSLog(@"AddSuccess");
    } else if (mission == 1){
        [self deleteAllContacts];
        NSLog(@"DeleteSuccess");
    } else {
        NSLog(@"wrong mission");
    }
}





- (void)addContact {
    //add contact
    CNMutableContact *contact = [[CNMutableContact alloc] init];
    contact.givenName = @"羽";
    contact.familyName = @"关";
    CNLabeledValue *mobilePhone = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberiPhone value:[CNPhoneNumber phoneNumberWithStringValue:@"13641330031"]];
    contact.phoneNumbers = @[mobilePhone];
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    NSError *error;
    NSPredicate *predicateGivenName = [CNContact predicateForContactsMatchingName:contact.givenName];
    NSArray *keys1 = @[CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey];
    NSArray *allContacts = [contactStore unifiedContactsMatchingPredicate:predicateGivenName keysToFetch:keys1 error:&error];//get all contacts who have the name as the given name
    //NSLog(@"count == %lu",(unsigned long)allContacts.count);
    if (allContacts.count == 0) {//if no contact is the given name, create a new contact
        CNSaveRequest *request = [[CNSaveRequest alloc] init];
        [request addContact:contact toContainerWithIdentifier:nil];
        [contactStore executeSaveRequest:request error:nil];
        //NSLog(@"addContact success");
    } else {
        int fullName = 0;//flag for whether deal with the first if
        for (NSInteger i = allContacts.count; i > 0; i--) {//check all contacts who have the family name is the new contact name
            CNMutableContact *con = [[allContacts objectAtIndex:i-1] mutableCopy];
            NSLog(@"CNMutableContactvalue-----%@",con);
            if ([con.familyName isEqualToString:contact.familyName]) {//if find the same name,check the phone number
                fullName = 1;
                CNLabeledValue *newPhone = [contact.phoneNumbers lastObject];
                CNPhoneNumber *newNumber = newPhone.value;
                NSMutableArray *newPhoneNumbers = [con.phoneNumbers mutableCopy];
                //NSLog(@"numberOfPhones----%lu",(unsigned long)[newPhoneNumbers count]);
                int numberRepeat = 0;//flag for whether the phone number is included in the previous contact phone numbers
                for (CNLabeledValue * labelValue in newPhoneNumbers) {
                    CNPhoneNumber * number = labelValue.value;
                    //NSLog(@"bakabaka%@--%@", number.stringValue, labelValue.label);
                    if ([number.stringValue isEqualToString:newNumber.stringValue]) {//if found,set the repeat flag as 1
                        //NSLog(@"repeatInput----%@----%@",number.stringValue,newNumber.stringValue);
                        numberRepeat = 1;
                        break;
                    }//end if
                }//end for
                if (numberRepeat == 0) {//if not repeat,add the new phone number to contact
                    [newPhoneNumbers addObject:newPhone];
                    con.phoneNumbers = newPhoneNumbers;
                    CNSaveRequest *request = [[CNSaveRequest alloc] init];
                    [request updateContact:con];
                    [contactStore executeSaveRequest:request error:nil];
                    i = 0;
                    //NSLog(@" upDateContact success");
                    break;
                }//end if
            }// end if
        }//end for
        if (fullName == 0) {//if not found the same fullName,create new contact
            CNSaveRequest *request = [[CNSaveRequest alloc] init];
            [request addContact:contact toContainerWithIdentifier:nil];
            [contactStore executeSaveRequest:request error:nil];
            //NSLog(@"addContact success");
        }//end if
    }//end if
}




- (void)deleteAllContacts {
    //delete all contact
    NSMutableArray *array = [NSMutableArray array];
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    NSArray *keys = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey];
    CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
    [contactStore enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        [array addObject:contact];
    }];
    //NSLog (@"%@addObjectsuccess",array);
    for (unsigned long i = [array count]; i > 0; i--) {//delete all contacts
        CNMutableContact *con = [[array objectAtIndex:i-1] mutableCopy];
        CNSaveRequest *request = [[CNSaveRequest alloc] init];
        [request deleteContact:con];
        [contactStore executeSaveRequest:request error:nil];
        //NSLog(@"delete success");
    }
}

@end
