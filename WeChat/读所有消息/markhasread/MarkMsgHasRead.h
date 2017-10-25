//
//  MarkMsgHasRead.h
//  firstoc
//
//  Created by 戴曦嘉 on 2017/10/25.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarkMsgHasRead : NSObject

- (void)runTask;
- (void)markMsgHasRead:(id)arg1;//标记所有消息已读,第一个参数传入nil,如果想要某一个聊天室标记已读，传入聊天室的名字

@end
