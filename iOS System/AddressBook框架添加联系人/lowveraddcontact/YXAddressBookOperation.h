//
//  YXAddressBookOperation.h
//  
//
//  Created by 戴曦嘉 on 2017/8/17.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>

typedef enum {
    ///     增加
    AddressBookType_add = 0,
    AddressBookType_addPersons,
    ///     删除
    AddressBookType_remove,
    ///     修改
    AddressBookType_update,
    ///     根据条件查找
    AddressBookType_getWithCondition,
    ///     获取全部
    AddressBookType_getAll,
}AddressBookType;

@interface YXAddressBookOperation : NSObject
///批量增加
+ (void)addAddressBookWithPersons:(NSArray *)persons withAllPersonsDic:(NSMutableDictionary *)allPersonsDic;
///增
+ (BOOL)addAddressBookWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber;
///删
+ (BOOL)removeAddressBookWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber;
///改
+ (BOOL)updateAddressBookWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber;
///查
+ (id)getAddressBookWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber isFormat:(BOOL)isFormat;
///获取全部
+ (id)getAllAddressBooksWithIsFormat:(BOOL)isFormat;

@end
