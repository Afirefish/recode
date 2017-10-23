//
//  NewMsgResp.m
//  firstoc
//
//  Created by 戴曦嘉 on 2017/10/23.
//  Copyright © 2017年 戴曦嘉. All rights reserved.
//

#import "NewMsgResp.h"
#import "NewMsgRespHelp.h"

@implementation NewMsgResp

- (void)runTask {
    [self newMsgRespond:@"你才是笨蛋！！"];
}

- (void)newMsgRespond:(NSString *)content {//传入发送的内容
    //getinfo set dataitem send
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    WCFacade *facade = [serviceCenter getService:[NSClassFromString(@"WCFacade") class]];
    WCNotificationCenterMgr *notificationCenterMgr = [facade valueForKey:@"m_messageMgr"];//朋友圈新消息的通知中心
    WCCommentUploadMgr *commentUploadMgr = [facade valueForKey:@"m_commentUploadMgr"];
    NSUInteger newMsgCount = [notificationCenterMgr getUnReadMessageCount];
    if (newMsgCount == 0) {//没有朋友圈新消息不需要回复
        NSLog(@"there are 0 message unread");
        return;
    }
    NSLog(@"there are %lu message unread",(unsigned long)newMsgCount);
    NSArray *msgArr = [notificationCenterMgr getUnReadMessages];
    if ([msgArr count] != newMsgCount) {//消息数量不符的话可能有问题，所以做一下判断
        NSLog(@"there may be something wrong");
        return;
    }
    //clientID的设置 不设置也行哇
    //NSString *curUsrName = [[NSClassFromString(@"SettingUtil") class] getCurUsrName];
    //遍历未读信息，发送回复
    for (NSUInteger i = 0; i < [msgArr count]; i++) {//遍历新消息数组，回复评论
        NSLog(@"the %u res comment",(unsigned int)i);
        WCSNSMessage *snsMessage = [msgArr objectAtIndex:i];
        NSLog(@"the detail of the messsage %@ detail: msgID %@ objID %@ parentObjID %@ comment %@ refComment %@ hasRead %@",snsMessage,snsMessage.msgID,snsMessage.objID,snsMessage.parentObjID,snsMessage.comment,snsMessage.refComment,snsMessage.hasRead?@"YES":@"NO");
        //修改消息是否已读
        [notificationCenterMgr markMessageAllReadBeginWithMessage:snsMessage];
        [notificationCenterMgr saveSetting];
        WCUserComment *userComment = snsMessage.comment;
        if (userComment.type == 1) {//点赞不回复
            NSLog(@"this may be a approval comment");
        } else if (userComment.type == 2) {//回复评论
            NSLog(@"this may be a commet");
            WCCommentItem *commentItem = [[NSClassFromString(@"WCCommentItem") alloc] init];
            commentItem.itemID = snsMessage.objID;
            commentItem.refComment = userComment;
            commentItem.toUserName = userComment.username;
            commentItem.type = userComment.type;
            commentItem.content = content;
            int curTime = (int)time(NULL);
            commentItem.createTime = curTime;
            commentItem.inQueueTime = curTime;
            FIFOFileQueue *fileQueue = [commentUploadMgr valueForKey:@"m_queue"];
            //NSLog(@"then this?%@",fileQueue);
            //NSInteger qcount = [[fileQueue getAll] count];
            //NSString *clientID = [NSString stringWithFormat:@"wcc:%@-%u-%ld",curUsrName,curTime,(long)qcount];
            //NSLog(@"what this? %@",clientID);
            //commentItem.clientID = clientID;
            [fileQueue push:commentItem];
            [commentUploadMgr addCommentToWCObjectCache:commentItem];
            [commentUploadMgr tryStartNextTask];
            NSLog(@"send ok");
        }
    }

}

@end
