//
//  TaskImportContacts.h
//  lingyongqian
//
//  Created by 张健 on 2017/8/17.
//  Copyright © 2017年 ZJTechnology. All rights reserved.
//

//#import "task.h"

@interface TASK_IMPORT_CONTACTS : NSObject
//@property (copy) STOP_CB stop_callback;
- (void)start:(NSMutableDictionary *)arg_dic;
- (NSDictionary *)status;
- (NSNumber *)progress;
@end
