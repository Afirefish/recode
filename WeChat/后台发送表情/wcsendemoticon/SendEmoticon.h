//
//  SendEmoticon.h
//  
//
//  Created by 戴曦嘉 on 2017/10/12.
//
//

#import <Foundation/Foundation.h>

@interface SendEmoticon : NSObject
- (void)startTask;//开始任务
- (void)sendEmoticon:(NSString *)myWXID toFriend:(NSString *)FriendWXID emoticonProductID:(NSString *)productID emoticonMD5:(NSString *)md5;//发送表情
@end
