//
//  SendVoice.m
//
//
//  Created by 戴曦嘉 on 2017/10/17.
//
//

#import "SendVoice.h"
#import "SendVoiceHelp.h"

@implementation SendVoice


//发送语音消息，首次发送需要调用一个奇怪的函数来做到
- (void)runTask {
    [self sendFirstMsg:@"wxid_j79te0rwqh0d22" fromUser:@"wxid_nra30q0yczvf12"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self sendVoiceMessage:@"wxid_j79te0rwqh0d22" fromUser:@"wxid_nra30q0yczvf12"  filePath:@"test.silk"];
    });
}

//正常发送消息
- (void)sendVoiceMessage:(NSString *)toUser fromUser:(NSString *)fromUser filePath:(NSString *)filePath {
    NSLog(@"发送语音消息");
    if([filePath isEqualToString:@""]){
        NSLog(@"发送语音消息为空,不能发送语音消息");
        return;
    }
    int msgType = 34;
    CMessageWrap *voiceMsg = [[NSClassFromString(@"CMessageWrap") alloc] initWithMsgType:msgType nsFromUsr:fromUser];
    voiceMsg = [[NSClassFromString(@"CMessageWrap") alloc] initWithMsgType:msgType nsFromUsr:fromUser];
    voiceMsg.m_uiVoiceFormat = 4;
    voiceMsg.m_nsFromUsr = fromUser;
    voiceMsg.m_nsToUsr = toUser;
    voiceMsg.m_uiVoiceEndFlag = 1;
    voiceMsg.m_uiCreateTime = (int)time(NULL);
    NSData *voiceData = [NSData dataWithContentsOfFile:filePath];
    NSLog(@"========2============");
    NSString *path = [NSClassFromString(@"CMessageWrap") getPathOfMsgImg:voiceMsg];
    NSLog(@"the path--%@",path);
    path = [path stringByReplacingOccurrencesOfString:@"Img" withString:@"Audio"];
    path = [path stringByReplacingOccurrencesOfString:@".pic" withString:@".aud"];
    NSString *pathDir = [path stringByDeletingLastPathComponent];
    system([[[NSString alloc] initWithFormat:@"mkdir -p %@", pathDir] UTF8String]);
    [voiceData writeToFile:path atomically:YES];
    NSLog(@"MYHOOK oh mypath is: %@, %@", path, voiceMsg);
    //随机得到时间
    int voiceRandTime = (arc4random() % 15) + 5;
    voiceMsg.m_dtVoice = [voiceData copy];
    voiceMsg.m_uiVoiceTime = voiceRandTime *1000; //1000;
    AudioSender *audioSender = [[NSClassFromString(@"MMServiceCenter") defaultCenter] getService:NSClassFromString(@"AudioSender")];
    [audioSender ResendVoiceMsg:toUser MsgWrap:voiceMsg];
    NSLog(@"发送语音消息成功ResendVoiceMsg");
}


//首次发送消息
- (void)sendFirstMsg:(NSString *)toUser fromUser:(NSString *)fromUser {
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    AudioSender *audioSender = [serviceCenter getService:[NSClassFromString(@"AudioSender") class]];
    [audioSender CanStartRecordFrom:fromUser ToUser:toUser];//调用这个函数才能创建SilkAudioRecorder
    SilkAudioRecorder *silkAudioRecorder = [audioSender valueForKey:@"m_silkRecorder"];
    [silkAudioRecorder setStartRecordTime];//这个可以定位当前录制时间
    AudioRecorderUserData *userData = [[[NSClassFromString(@"AudioRecorderUserData") class] alloc] init];
    [userData setFromusr:fromUser];
    [userData setTousr:toUser];//配置好AudioRecorderUserData
    [silkAudioRecorder setUserData:userData];
    [silkAudioRecorder setMUserData:userData];//配置好silkAudioRecorder
    [silkAudioRecorder prepareRecord];//准备录音
    [silkAudioRecorder setDelegate:audioSender];//设置代理
    [silkAudioRecorder setBeginSendData];//设置开始发送数据
    [silkAudioRecorder record];
    [silkAudioRecorder real_record];
    [silkAudioRecorder canAutoRestart];
    [silkAudioRecorder BeginNotifyOnMainThread:0];//录音过程。。
    [silkAudioRecorder prepareSend];//准备发送
    [audioSender CancelRecord];//之后这些都是取消发送 都要调用，少了一个都不行。。
    [audioSender StopRecord];
    [audioSender stop];
    [silkAudioRecorder stop];
    MMNewUploadVoiceMgr *mmNewUploadVoiceMgr = [audioSender valueForKey:@"m_upload"];
    [mmNewUploadVoiceMgr CancelUpload:toUser LocalID:1 n64SvrID:0 Offset:0 Len:0 VoiceTime:0 CreateTime:0 EndFlag:0 CancelFlag:1 VoiceFormat:0];
}

@end
