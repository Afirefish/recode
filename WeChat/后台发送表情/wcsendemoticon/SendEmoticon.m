//
//  SendEmoticon.m
//
//
//  Created by 戴曦嘉 on 2017/10/12.
//
//

#import "SendEmoticon.h"
#import "SendEmoticonHelp.h"

@implementation SendEmoticon

- (void)startTask {
    [self sendEmoticon:@"wxid_nra30q0yczvf12"  toFriend:@"wxid_j79te0rwqh0d22"emoticonProductID:@"com.tencent.xin.emoticon.person.stiker_15051216398b12587ddf2cd80d" emoticonMD5:@"eab557a04db5d5d9d942954552848c5b"];
}

- (void)sendEmoticon:(NSString *)myWXID toFriend:(NSString *)FriendWXID emoticonProductID:(NSString *)productID emoticonMD5:(NSString *)md5 {
    CMessageWrap *emoticonWrap = [[[NSClassFromString(@"CMessageWrap") class] alloc] initWithMsgType:47];//固定参数47
    [emoticonWrap setM_nsToUsr:FriendWXID];//发送的对象的微信id
    [emoticonWrap setM_nsFromUsr:myWXID];//自己的微信id
    [emoticonWrap setM_uiMessageType:47];//固定参数47 代表表情数据包
    [emoticonWrap setM_nsContent:@""];//没有文字内容
    CExtendInfoOfEmoticon *emoticon = [[[NSClassFromString(@"CExtendInfoOfEmoticon") class] alloc] init];
    [emoticon setM_refMessageWrap:emoticonWrap];//设置引用关系
    [emoticon setM_uiEmoticonType:2];//设置表情数据包类型
    [emoticon setM_nsEmoticonMD5:md5];//设置表情数据包的md5
    [emoticon setM_nsEmoticonBelongToProductID:productID];//设置要发送的表情所在的表情包
    emoticonWrap.m_extendInfoWithMsgType = emoticon;
    [emoticon UpdateContent:emoticonWrap];//更新数据包的内容
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    [[serviceCenter getService:[NSClassFromString(@"CMessageMgr") class]] AddEmoticonMsg:FriendWXID MsgWrap:emoticonWrap];//发送
}
@end
