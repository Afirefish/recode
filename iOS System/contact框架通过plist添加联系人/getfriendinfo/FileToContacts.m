//
//  FileToContacts.m
//  
//
//  Created by 戴曦嘉 on 2017/8/18.
//
//

#import "FileToContacts.h"
#import "TaskImportContacts.h"

@implementation FileToContacts


static FileToContacts *_ins = nil;
+ (instancetype)singleInstance {
    //create a single instance
    if (_ins == nil) {
        _ins = [[FileToContacts alloc] init];
    }
    return _ins;
}

- (NSString *)writeContactsToFile {
    //write contacts to plist file
    NSDictionary *dic = @{@"type":@"OVERRIDE",
                          @"contacts":@[@{@"name":@"曹擦",@"phone":@"13712341234"},
                                        @{@"name":@"吕布",@"phone":@"13712345678"},
                                        @{@"name":@"孙权",@"phone":@"13712344321"},
                                        @{@"name":@"刘备",@"phone":@"13712348765"}]
                          };
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *filePath = [path objectAtIndex:0];
    NSString *filePath = @"//Wxbackup//";
    NSString *plistPath = [filePath stringByAppendingPathComponent:@"giveContacts.plist"];
    if ([fileManager fileExistsAtPath:plistPath] == YES) {
        NSLog(@"plist存在");
        return nil;
    } else {
        [fileManager createFileAtPath:plistPath contents:nil attributes:nil];
        [dic writeToFile:plistPath atomically:YES];
        NSDictionary *dic2 = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        NSLog(@"key1 is %@",[dic2 valueForKey:@"contacts"]);
        NSLog (@"filepath---%@",plistPath);
        return plistPath;
    }
}


- (void)writeContactsFromFile {
    //write contacts to address book from plist file
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *plistPath =  @"//Wxbackup//giveContacts.plist";
    if ([fileManager fileExistsAtPath:plistPath] == NO) {
        NSLog(@"plist不存在");
    }else{
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        NSArray *contacts = [dic valueForKey:@"contacts"];
        for (NSInteger i = 0; i < [contacts count]; i++) {
            NSDictionary *tempDic = [contacts objectAtIndex:i];
            NSString *name = [tempDic valueForKey:@"name"];
            NSString *phone = [tempDic valueForKey:@"phone"];
            NSLog(@"gettheplist---%@---%@",name,phone);
        }
        TASK_IMPORT_CONTACTS *task = [[TASK_IMPORT_CONTACTS alloc] init];
        NSMutableDictionary *dic1 = [dic mutableCopy];
        [task start:dic1];
        [fileManager removeItemAtPath:plistPath error:nil];
    }
}


@end
