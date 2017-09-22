//
//  YXAddressBookOperation.m
//  
//
//  Created by 戴曦嘉 on 2017/8/17.
//
//

#import "YXAddressBookOperation.h"

@implementation YXAddressBookOperation
///批量增加
+ (void)addAddressBookWithPersons:(NSArray *)persons withAllPersonsDic:(NSMutableDictionary *)allPersonsDic
{
    ABAddressBookRef addressBookRef = [self getAddressBookRef];
    if (addressBookRef == nil) {
        NSLog(@"读取通讯录失败");
    }
    BOOL isSuccess = NO;
    int count = 0;
    for (NSDictionary * personDic in persons) {
        //        如果本地不存在
        NSString * oldName = [allPersonsDic objectForKey:[personDic objectForKey:@"phone"]];
        if (oldName.length == 0) {
            [allPersonsDic setObject:[personDic objectForKey:@"name"] forKey:[personDic objectForKey:@"phone"]];
            
            //    创建通讯录模版
            ABRecordRef recordRef = ABPersonCreate();
            //    插入名
            isSuccess = ABRecordSetValue(recordRef, kABPersonFirstNameProperty, (__bridge CFStringRef)[personDic objectForKey:@"name"], nil);
            //    插入姓
            //        isSuccess = ABRecordSetValue(recordRef, kABPersonLastNameProperty, (__bridge CFStringRef)lastName, nil);
            //    插入生日
            isSuccess = ABRecordSetValue(recordRef, kABPersonBirthdayProperty, (__bridge CFDateRef)[NSDate date], nil);
            //    插入电话号码
            ABMultiValueRef phone = ABMultiValueCreateMutable(kABStringPropertyType);
            ABMultiValueIdentifier identifier;
            ABMultiValueAddValueAndLabel(phone, (__bridge CFStringRef)[personDic objectForKey:@"phone"], (__bridge CFStringRef)@"手机", &identifier);
            
            isSuccess = ABRecordSetValue(recordRef, kABPersonPhoneProperty, phone, nil);
            
            //    将准备好的联系人添加到通讯录里面
            isSuccess = ABAddressBookAddRecord(addressBookRef, recordRef, nil);
            if (recordRef) {
                CFRelease(recordRef);
            }
            if (phone) {
                CFRelease(phone);
            }
            
            count ++;
        }
    }
    
    //    保存修改过的通讯录
    isSuccess = ABAddressBookSave(addressBookRef, nil);
    if (isSuccess) {
        NSLog(@"setContact Success");
    }
}

///增
+ (BOOL)addAddressBookWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber
{
    if ((firstName.length == 0 && lastName.length == 0) || phoneNumber.length == 0) {
        NSLog(@"信息不完整");
        return NO;
    }
    if (!firstName) {
        firstName = @"";
    }
    if (!lastName) {
        lastName = @"";
    }
    ABAddressBookRef addressBookRef = [self getAddressBookRef];
    if (addressBookRef == nil) {
        NSLog(@"读取通讯录失败");
        return NO;
    }
    BOOL isSuccess = NO;
    //    创建通讯录模版
    ABRecordRef recordRef = ABPersonCreate();
    //    插入名
    isSuccess = ABRecordSetValue(recordRef, kABPersonFirstNameProperty, (__bridge CFStringRef)firstName, nil);
    //    插入姓
    isSuccess = ABRecordSetValue(recordRef, kABPersonLastNameProperty, (__bridge CFStringRef)lastName, nil);
    //    插入生日
    //isSuccess = ABRecordSetValue(recordRef, kABPersonBirthdayProperty, (__bridge CFDateRef)[NSDate date], nil);
    //    插入电话号码
    ABMultiValueRef phone = ABMultiValueCreateMutable(kABStringPropertyType);
    ABMultiValueIdentifier identifier;
    ABMultiValueAddValueAndLabel(phone, (__bridge CFStringRef)phoneNumber, (__bridge CFStringRef)@"手机", &identifier);
    
    isSuccess = ABRecordSetValue(recordRef, kABPersonPhoneProperty, phone, nil);
    
    //    将准备好的联系人添加到通讯录里面
    isSuccess = ABAddressBookAddRecord(addressBookRef, recordRef, nil);
    //    保存修改过的通讯录
    isSuccess = ABAddressBookSave(addressBookRef, nil);
    NSLog(@"添加成功");
    if (recordRef) {
        CFRelease(recordRef);
    }
    if (phone) {
        CFRelease(phone);
    }
    return isSuccess;
}

///删
+ (BOOL)removeAddressBookWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber
{
    if (firstName.length == 0 && lastName.length == 0 && phoneNumber.length == 0) {
        return NO;
    }
    //    全部联系人对象
    NSArray * records = [self getAllAddressBooksWithIsFormat:NO];
    //    通讯录对象
    ABAddressBookRef addressBookRef = [self getAddressBookRef];
    //    删除数量
    int removeCount = 0;
    for (id record in records) {
        //        单个联系人对象
        ABRecordRef recordRef = (__bridge ABRecordRef)record;
        //        名
        NSString * oldFirstName = (__bridge NSString *)ABRecordCopyValue(recordRef, kABPersonFirstNameProperty);
        if (!oldFirstName) {
            oldFirstName = @"";
        }
        //        姓
        NSString * oldLastName = (__bridge NSString *)ABRecordCopyValue(recordRef, kABPersonLastNameProperty);
        if (!oldLastName) {
            oldLastName = @"";
        }
        //        移动电话
        ABMultiValueRef phoneMulti = ABRecordCopyValue(recordRef, kABPersonPhoneProperty);
        NSArray * phoneNumbers = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(phoneMulti);
        NSMutableString * oldPhoneNumber = [[NSMutableString alloc] initWithString:@""];
        for (NSString * pN in phoneNumbers) {
            NSString * tempPN = (NSString *)[self transitionStringWithSting:pN];
            if (oldPhoneNumber.length == 0) {
                [oldPhoneNumber insertString:tempPN atIndex:oldPhoneNumber.length];
            }else{
                [oldPhoneNumber insertString:[NSString stringWithFormat:@"_%@",tempPN] atIndex:oldPhoneNumber.length];
            }
        }
        //        如果有匹配的
        if (([firstName isEqualToString:oldFirstName] && [lastName isEqualToString:oldLastName]) || [phoneNumber isEqualToString:oldPhoneNumber]) {
            //            删除
            if (ABAddressBookRemoveRecord(addressBookRef, recordRef, nil)) {
                removeCount ++;
            }
        }
    }
    //    保存
    BOOL isSuccess = ABAddressBookSave(addressBookRef, nil);
    if (isSuccess) {
        NSLog(@"deleteSuccess");
    }
    return isSuccess;
}

///改
+ (BOOL)updateAddressBookWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber
{
    if (firstName.length == 0 || lastName.length == 0 || phoneNumber.length == 0) {
        return NO;
    }
    ABAddressBookRef addressBookRef = [self getAddressBookRef];
    if (addressBookRef == nil) {
        NSLog(@"读取通讯录失败");
        return NO;
    }
    //    获取所有本地的通讯录
    NSArray * records = (__bridge NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBookRef);
    BOOL isHave = NO;
    for (id record in records) {
        //        单个联系人对象
        ABRecordRef recordRef = (__bridge ABRecordRef)record;
        //        名
        NSString * oldFirstName = (__bridge NSString *)ABRecordCopyValue(recordRef, kABPersonFirstNameProperty);
        if (!oldFirstName) {
            oldFirstName = @"";
        }
        //        姓
        NSString * oldLastName = (__bridge NSString *)ABRecordCopyValue(recordRef, kABPersonLastNameProperty);
        if (!oldLastName) {
            oldLastName = @"";
        }
        //        移动电话
        ABMultiValueRef phoneMulti = ABRecordCopyValue(recordRef, kABPersonPhoneProperty);
        NSArray * phoneNumbers = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(phoneMulti);
        NSMutableString * oldPhoneNumber = [[NSMutableString alloc] initWithString:@""];
        for (NSString * pN in phoneNumbers) {
            NSString * tempPN = (NSString *)[self transitionStringWithSting:pN];
            if (oldPhoneNumber.length == 0) {
                [oldPhoneNumber insertString:tempPN atIndex:oldPhoneNumber.length];
            }else{
                [oldPhoneNumber insertString:[NSString stringWithFormat:@"_%@",tempPN] atIndex:oldPhoneNumber.length];
            }
        }
        //        如果有匹配的
        if (([firstName isEqualToString:oldFirstName] && [lastName isEqualToString:oldLastName]) || [phoneNumber isEqualToString:oldPhoneNumber]) {
            //            修改
            ABRecordSetValue(recordRef, kABPersonFirstNameProperty, (__bridge CFStringRef)firstName, nil);
            ABRecordSetValue(recordRef, kABPersonLastNameProperty, (__bridge CFStringRef)lastName, nil);
            ABMultiValueRef newPhone = ABMultiValueCreateMutable(kABPersonPhoneProperty);
            ABMultiValueIdentifier identifier;
            ABMultiValueAddValueAndLabel(newPhone, (__bridge CFStringRef)phoneNumber, (__bridge CFStringRef)@"手机", &identifier);
            ABRecordSetValue(recordRef, kABPersonPhoneProperty, newPhone, nil);
            isHave = YES;
        }
    }
    //    保存
    BOOL isSuccess = ABAddressBookSave(addressBookRef, nil);
    if (isSuccess && isHave) {
        NSLog(@"changeSuccess");
    }
    return isSuccess;
    return NO;
}

///查
+ (id)getAddressBookWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber isFormat:(BOOL)isFormat
{
    if (firstName.length == 0 && lastName.length == 0 && phoneNumber.length == 0) {
        return nil;
    }
    ABAddressBookRef addressBookRef = [self getAddressBookRef];
    if (addressBookRef == nil) {
        NSLog(@"读取通讯录失败");
        return nil;
    }
    
    NSMutableArray * tempRecords = nil;
    NSMutableDictionary * tempRecordDic = nil;
    if (isFormat) {
        tempRecordDic = [[NSMutableDictionary alloc] init];
    }else{
        tempRecords = [[NSMutableArray alloc] init];
    }
    
    //    获取所有本地的通讯录
    NSArray * records = (__bridge NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBookRef);
    for (id record in records) {
        //        单个联系人对象
        ABRecordRef recordRef = (__bridge ABRecordRef)record;
        //        名
        NSString * oldFirstName = (__bridge NSString *)ABRecordCopyValue(recordRef, kABPersonFirstNameProperty);
        if (!oldFirstName) {
            oldFirstName = @"";
        }
        //        姓
        NSString * oldLastName = (__bridge NSString *)ABRecordCopyValue(recordRef, kABPersonLastNameProperty);
        if (!oldLastName) {
            oldLastName = @"";
        }
        //        移动电话
        ABMultiValueRef phoneMulti = ABRecordCopyValue(recordRef, kABPersonPhoneProperty);
        NSArray * phoneNumbers = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(phoneMulti);
        NSMutableString * oldPhoneNumber = [[NSMutableString alloc] initWithString:@""];
        for (NSString * pN in phoneNumbers) {
            NSString * tempPN = (NSString *)[self transitionStringWithSting:pN];
            if (oldPhoneNumber.length == 0) {
                [oldPhoneNumber insertString:tempPN atIndex:oldPhoneNumber.length];
            }else{
                [oldPhoneNumber insertString:[NSString stringWithFormat:@"_%@",tempPN] atIndex:oldPhoneNumber.length];
            }
        }
        BOOL isEqual[3];
        if (firstName.length == 0) {
            isEqual[0] = YES;
        }else if ([firstName isEqualToString:oldFirstName]){
            isEqual[0] = YES;
        }else{
            isEqual[0] = NO;
        }
        
        if (lastName.length == 0) {
            isEqual[1] = YES;
        }else if ([lastName isEqualToString:oldLastName]){
            isEqual[1] = YES;
        }else{
            isEqual[1] = NO;
        }
        
        if (phoneNumber.length == 0) {
            isEqual[2] = YES;
        }else if ([phoneNumber isEqualToString:oldPhoneNumber]){
            isEqual[2] = YES;
        }else{
            isEqual[2] = NO;
        }
        
        if (isEqual[0] && isEqual[1] && isEqual[2]) {
            //    格式化信息，根据自己的需求而定
            if (isFormat) {
                [tempRecordDic setObject:[NSString stringWithFormat:@"%@%@",oldLastName,oldFirstName] forKey:oldPhoneNumber];
            }else{
                [tempRecords addObject:(__bridge id)(recordRef)];
            }
        }
    }
    if (isFormat) {
        return tempRecordDic;
    }
    return tempRecords;
}

///获取全部
+ (id)getAllAddressBooksWithIsFormat:(BOOL)isFormat
{
    ABAddressBookRef addressBookRef = [self getAddressBookRef];
    if (addressBookRef == nil) {
        NSLog(@"读取通讯录失败");
        return nil;
    }
    //    获取所有本地的通讯录
    NSArray * records = (__bridge NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBookRef);
    NSLog(@"getcontact---%@",records);
    if (!isFormat) {
        return records;
    }
    //    格式化信息，根据自己的需求而定
    NSMutableDictionary * allAddressBook = [[NSMutableDictionary alloc] init];
    for (id record in records) {
        ABRecordRef tempRecord = (__bridge ABRecordRef)record;
                NSLog(@"%@%@--%@",(__bridge NSString *)ABRecordCopyValue(tempRecord, kABPersonFirstNameProperty),(__bridge NSString *)ABRecordCopyValue(tempRecord, kABPersonLastNameProperty),(__bridge NSString *)ABRecordCopyValue(tempRecord, kABPersonPhoneProperty));
        //        获取名
        NSString * firstName = (__bridge NSString *)ABRecordCopyValue(tempRecord, kABPersonFirstNameProperty);
        NSLog(@"firstname----%@",firstName);
        //        获取姓
        NSString * lastName = (__bridge NSString *)ABRecordCopyValue(tempRecord, kABPersonLastNameProperty);
        NSLog(@"lastname----%@",lastName);
        if (!firstName) {
            firstName = @"";
        }
        if (!lastName) {
            lastName = @"";
        }
        //        组合姓名
        NSString * name = [NSString stringWithFormat:@"%@%@",lastName,firstName];
        NSLog(@"name---%@",name);
        //        组合移动电话信息
        ABMultiValueRef phoneMulti = ABRecordCopyValue(tempRecord, kABPersonPhoneProperty);
        NSArray * phoneNumbers = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(phoneMulti);
        
        NSMutableString * phoneNumber = [[NSMutableString alloc] initWithString:@""];
        for (NSString * pN in phoneNumbers) {
            NSLog(@"Pn----%@",pN);
            NSString * tempPN = (NSString *)[self transitionStringWithSting:pN];
            NSLog(@"PH----%@",tempPN);
            if (phoneNumber.length == 0) {
                [phoneNumber insertString:tempPN atIndex:phoneNumber.length];
            }else{
                [phoneNumber insertString:[NSString stringWithFormat:@"_%@",tempPN] atIndex:phoneNumber.length];
            }
        }
        [allAddressBook setObject:name forKey:phoneNumber];
    }
    NSLog(@"allAddressBook----%@",allAddressBook);
    return allAddressBook;
}

+ (ABAddressBookRef)getAddressBookRef
{
    ABAddressBookRef addressBookRef = nil;
    
    __block BOOL isSuccess = NO;
    //    创建通讯录对象，注意不会自动释放
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0) {
        addressBookRef = ABAddressBookCreateWithOptions(nil, nil);
        //        iOS6.0以后，需要经过用户同意，所以做个等待线程
        //dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            NSLog(@"Yes=%d_No=%d 是否经过用户同意%d",YES,NO,granted);
            isSuccess = granted?YES:NO;
            //dispatch_semaphore_signal(semaphore);
        });
       // dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }else{
        addressBookRef = ABAddressBookCreate();
    }
    if (!isSuccess) {
        NSLog(@"NOT AUTHORIZATION");
        //return nil;
    }
    if (addressBookRef) {
        CFAutorelease(addressBookRef);
    }
    NSLog(@"addressbook--%@",addressBookRef);
    return addressBookRef;
}

+ (id)transitionStringWithSting:(NSString *)str
{
    BOOL isNSString;
    if ([str isKindOfClass:[NSString class]]) {
        isNSString = YES;
    }else{
        isNSString = NO;
    }
    str = [str stringByReplacingOccurrencesOfString:@"-" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"_" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"*" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"#" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"~" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (isNSString) {
        return str;
    }
    return [[NSMutableString alloc] initWithString:str];
}

@end

