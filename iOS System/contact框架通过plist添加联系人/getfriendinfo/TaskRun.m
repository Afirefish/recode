//
//  TaskRun.m
//  
//
//  Created by 戴曦嘉 on 2017/8/21.
//
//

#import "TaskRun.h"
#import "FileToContacts.h"

@implementation TaskRun



- (void)startRunContacts:(int)index {
    if (index == 0) {//没有plist文件，写入plist
        [[FileToContacts singleInstance] writeContactsToFile];
    } else if(index == 1) {//有plist文件，写入通讯录
        [[FileToContacts singleInstance] writeContactsFromFile];
    } else {
        NSLog(@"index mistake");
    }
}
@end
