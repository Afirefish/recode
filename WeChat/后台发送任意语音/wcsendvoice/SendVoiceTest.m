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





- (void)sendVoice {
    [self sendVoiceMessage:@"wxid_j79te0rwqh0d22" filePath:@"test.silk"];
}

- (void)sendVoiceMessage:(NSString *)toUser filePath:(NSString *)filePath {
    NSLog(@"发送语音消息");
    
    if([filePath isEqualToString:@""]){
        NSLog(@"发送语音消息为空,不能发送语音消息");
        return;
    }
    int msgType = 34;
    CMessageWrap *voiceMsg = [[NSClassFromString(@"CMessageWrap") alloc] initWithMsgType:msgType nsFromUsr:@"wxid_nra30q0yczvf12"];
    
    voiceMsg = [[NSClassFromString(@"CMessageWrap") alloc] initWithMsgType:msgType nsFromUsr:@"wxid_nra30q0yczvf12"];
    voiceMsg.m_uiVoiceFormat = 4;
    voiceMsg.m_nsFromUsr = @"wxid_nra30q0yczvf12";
    voiceMsg.m_nsToUsr = toUser;
    voiceMsg.m_uiVoiceEndFlag = 1;
    voiceMsg.m_uiCreateTime = (int)time(NULL);
    
    NSData *voiceData = [NSData dataWithContentsOfFile:filePath];
    NSLog(@"data ---%@",voiceData);
    NSLog(@"========2============");
    NSString *path = [NSClassFromString(@"CMessageWrap") getPathOfMsgImg:voiceMsg];
    NSLog(@"the path--%@",path);
    path = [path stringByReplacingOccurrencesOfString:@"Img" withString:@"Audio"];
    path = [path stringByReplacingOccurrencesOfString:@".pic" withString:@".aud"];
    NSString *pathDir = [path stringByDeletingLastPathComponent];
    system([[[NSString alloc] initWithFormat:@"mkdir -p %@", pathDir] UTF8String]);
    [voiceData writeToFile:path atomically:YES];
    NSData *voiceData2 = [NSData dataWithContentsOfFile:path];
    NSLog(@"data2-----%@",voiceData2);
    NSLog(@"MYHOOK oh mypath is: %@, %@", path, voiceMsg);
    
    //随机得到时间
    
    int voiceRandTime = (arc4random() % 15) + 5;
    
    voiceMsg.m_dtVoice = [voiceData copy];
    voiceMsg.m_uiVoiceTime = voiceRandTime *1000; //1000;
    

//    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
//    [[serviceCenter getService:[NSClassFromString(@"CMessageMgr") class]] AddMsg:toUser MsgWrap:voiceMsg];//发送
    AudioSender *audioSender = [[NSClassFromString(@"MMServiceCenter") defaultCenter] getService:NSClassFromString(@"AudioSender")];
    
    
    
    
    
    
    
    
    
    
    
    
    
    [audioSender ResendVoiceMsg:toUser MsgWrap:voiceMsg];
    NSLog(@"发送语音消息成功ResendVoiceMsg");
    
}



- (void)test {
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    //CMessageMgr *mgr = [serviceCenter getService:[NSClassFromString(@"CMessageMgr") class]];
    AudioSender *audioSender = [serviceCenter getService:[NSClassFromString(@"AudioSender") class]];
    NSLog(@"wheather exist /m_upload %@",[audioSender valueForKey:@"m_upload"]);
    
    
    
    
    
    
    
    
    
//    //这里应该被audiosender初始化了，不用我来初始化 可以直接获得
//    MMNewUploadVoiceMgr *mmNewUploadVoiceMgr = [[[NSClassFromString(@"MMNewUploadVoiceMgr") class] alloc] init];
//    NSRecursiveLock *recursiveLock = [[NSRecursiveLock alloc] init];
//    CMMDB *db = [[[NSClassFromString(@"CMMDB") class] alloc] init];
//    [mmNewUploadVoiceMgr InitUploadMgr:db Lock:recursiveLock Delegate:audioSender];
//    [mmNewUploadVoiceMgr Start];
//
    
    
    
    
    
    
    
    
    
    
    
    
    
//    //一定是上面的mgr包含这个属性
    UploadVoiceWrap *voiceWrap = [[[NSClassFromString(@"UploadVoiceWrap") class] alloc] init];
    //[[NSClassFromString(@"UploadVoiceWrap") class]  initialize];
    [voiceWrap setM_uiLocalID:1];
    [voiceWrap setM_nsExtend:@"<voiceforwardflag>0</voiceforwardflag>"];
    [voiceWrap setM_nsToUsrName:@"wxid_j79te0rwqh0d22"];
    [voiceWrap setM_nsFromUsrName:@"wxid_nra30q0yczvf12"];
    NSLog(@"then this? voiceWrap %@",voiceWrap);

    //recorder?
    [audioSender CanStartRecordFrom:@"wxid_nra30q0yczvf12" ToUser:@"wxid_j79te0rwqh0d22"];
    NSLog(@"wheather exist /m_silkRecorder %@",[audioSender valueForKey:@"m_silkRecorder"]);
    SilkAudioRecorder *silkAudioRecorder = [audioSender valueForKey:@"m_silkRecorder"];
    [silkAudioRecorder setStartRecordTime];
    AudioRecorderUserData *userData = [[[NSClassFromString(@"AudioRecorderUserData") class] alloc] init];
    [userData setFromusr:@"wxid_nra30q0yczvf12"];
    [userData setTousr:@"wxid_j79te0rwqh0d22"];
    [silkAudioRecorder setUserData:userData];
    [silkAudioRecorder setMUserData:userData];
    NSLog(@"wheather exist /mUserData %@",[silkAudioRecorder valueForKey:@"mUserData"]);
    //[silkAudioRecorder createSilkFile:@"/var/mobile/Containers/Data/Application/FA109285-0DF6-48CE-856B-BB7A7A0858C9/Documents/b8881ff83156aae6a9f03dfcfc256fcf/Audio/b8881ff83156aae6a9f03dfcfc256fcf/1.aud"];
    [silkAudioRecorder prepareRecord];
    [silkAudioRecorder setDelegate:audioSender];
    [silkAudioRecorder setBeginSendData];
    
    [silkAudioRecorder record];
    [silkAudioRecorder real_record];
    [silkAudioRecorder canAutoRestart];
    [silkAudioRecorder BeginNotifyOnMainThread:0];
    [silkAudioRecorder prepareSend];
    [audioSender CancelRecord];
    [audioSender StopRecord];
    [audioSender stop];
    [silkAudioRecorder stop];
    NSLog(@"voiceWrap M_uiLocalID%d",[voiceWrap m_uiLocalID]);
     MMNewUploadVoiceMgr *mmNewUploadVoiceMgr = [audioSender valueForKey:@"m_upload"];
    [mmNewUploadVoiceMgr CancelUpload:@"wxid_j79te0rwqh0d22" LocalID:1 n64SvrID:0 Offset:0 Len:0 VoiceTime:0 CreateTime:0 EndFlag:0 CancelFlag:1 VoiceFormat:0];
    
    
    
//    MMNewUploadVoiceMgr *mmNewUploadVoiceMgr = [audioSender valueForKey:@"m_upload"];
//    [mmNewUploadVoiceMgr PrepareForUpload:voiceWrap packetExpireTime:NO];
//    [mmNewUploadVoiceMgr loadDataFromAudioFile:voiceWrap];
//    [mmNewUploadVoiceMgr PrepareForUploadEx:voiceWrap];
//    [mmNewUploadVoiceMgr UpdateRetryCount:voiceWrap];
//    [mmNewUploadVoiceMgr UpdateUploadVoiceRetryCount:voiceWrap byUserName:@"wxid_j79te0rwqh0d22" localId:1 offset:0];
//    
//    
//    
//    [mmNewUploadVoiceMgr HandleUploadVoiceOK:voiceWrap];
//    [mmNewUploadVoiceMgr IsInUploadQueue:@"wxid_j79te0rwqh0d22" LocalID:1 Offset:0];
//    [mmNewUploadVoiceMgr DeleteUploadVoiceByToUser:@"wxid_j79te0rwqh0d22" localId:1 offset:0];
//    [mmNewUploadVoiceMgr MainThreadNotifyUploadVoiceOK:voiceWrap];
//    [mmNewUploadVoiceMgr uploadOnePacket];
//    [mmNewUploadVoiceMgr getOneUploadItemFromDB];
//    [mmNewUploadVoiceMgr GetOneUploadVoice];

    
    

//
//    
//    //audiosender继续初始化audiorecorder 应该可以直接获得
//    [audioSender CanStartRecordFrom:@"wxid_nra30q0yczvf12" ToUser:@"wxid_j79te0rwqh0d22"];
//    SilkAudioRecorder *silkAudioRecorder = [[NSClassFromString(@"SilkAudioRecorder") class] init];
//    [silkAudioRecorder setStartRecordTime];
//    //这个data应该也是在SilkAudioRecorder初始化时就被初始化了 可以直接获得
//    AudioRecorderUserData *userData = [[AudioRecorderUserData alloc] init];
//    [userData setFromusr:@"wxid_nra30q0yczvf12"];
//    [userData setTousr:@"wxid_j79te0rwqh0d22"];
//    
//    [silkAudioRecorder setUserData:userData];
//    [silkAudioRecorder setMUserData:userData];
//    [silkAudioRecorder createSilkFile:@"/var/mobile/Containers/Data/Application/51406126-D5AA-43F1-8641-E634D7710557/Documents/b8881ff83156aae6a9f03dfcfc256fcf/Audio/312da66e2e6d9aa1c882a498d67d2635/1.aud"]
//    [silkAudioRecorder prepareRecord];
//    [silkAudioRecorder prepareRecordWithNotify:1];
//    [silkAudioRecorder setM_isNeedRestartMusic:0];
//    [silkAudioRecorder setM_isNeedRestartAudioTalk:0];
//    [silkAudioRecorder updateSession];
//    [silkAudioRecorder initSession];
//    [silkAudioRecorder setDataFormat];
//    [silkAudioRecorder setSmapleRate:[silkAudioRecorder GetDynmicSampleRate]];
//    [silkAudioRecorder setVoiceRate:[silkAudioRecorder GetDynmicSampleRate]];
//    
//    [silkAudioRecorder setDelegate:audioSender];
//    [silkAudioRecorder setBeginSendData];
//    [silkAudioRecorder prepareSend];
//    [audioSender onPrepareSendSilk:userData];
//    [audioSender prepareSend:userData];
//    
//    //创建了一个声音数据包 很多数据时从AudioRecorderUserData中获得的
//    CMessageWrap *messageWrap = [[[NSClassFromString(@"CMessageWrap") class] alloc] initWithMsgType:34];//固定参数34
//    [messageWrap setM_uiMessageType:34];
//    [messageWrap setM_nsToUsr:@"wxid_j79te0rwqh0d22"];//发送的对象的微信id
//    [messageWrap setM_nsFromUsr:@"wxid_nra30q0yczvf12"];//自己的微信id
//    [messageWrap setM_n64MesSvrID:@"暂时不知道怎么得到！"];
//    [messageWrap setM_uiStatus:2];//这两个发送中为1，如果发送成功会变成2
//    [messageWrap setM_uiDownloadStatus:25]//发送中为1，发送成功为25
//    [messageWrap setM_uiMessageType:34];//固定参数47 代表表情数据包
//    [messageWrap setM_nsContent:@""];//没有文字内容
//    [messageWrap setM_uiImgStatus:25];//语音图片
//    CExtendInfoOfVoiceMsg *voiceMsg = [[[NSClassFromString(@"CExtendInfoOfVoiceMsg") class] alloc] init];
//    [voiceMsg setM_refMessageWrap:messageWrap];
//    [voiceMsg setM_uiVoiceFormat:4];
//    [messageWrap setM_extendInfoWithMsgType:voiceMsg];
//    [voiceMsg UpdateContent:messageWrap];
//    [messageWrap setM_nsContent:@"<msg><voicemsg voicelength="0" voiceformat="4" forwardflag="0" /></msg>"];
//    
//    [audioSender addMessageToDB:messageWrap];
//    
//    [mgr AddMsg:@"wxid_j79te0rwqh0d22" MsgWrap:messageWrap];
//    
//    
//    [mmNewUploadVoiceMgr AddNewPart:@"wxid_j79te0rwqh0d22" LocalID:1 n64SvrID: Offset:
//                                Len: VoiceTime: CreateTime: EndFlag:0 CancelFlag:
//                        VoiceFormat:4 ForwardFlag:0 msgSource:nil];
//    [mmNewUploadVoiceMgr migrateUploadVoice];
//    [mmNewUploadVoiceMgr loadPB];
//    [mmNewUploadVoiceMgr getPBPath];
//    UploadVoiceWrap *voiceWrap = [[UploadVoiceWrap alloc] init];
//    [voiceWrap setM_uiLen:];//length
//    [voiceWrap setM_uiVoiceTime:]//voice length
//    [voiceWrap setM_uiCreateTime:];//create time
//    [voiceWrap setM_uiVoiceFormat:0];
//    [voiceWrap setM_uiCancelFlag:0];
//    [voiceWrap setM_uiVoiceForwardFlag:0];
//    [voiceWrap setM_uiCgi:127];
//    [voiceWrap setM_uiLocalID:1];
//    [voiceWrap setM_uiOffset:];
//    [voiceWrap setM_uiRetryCount:0];
//    [voiceWrap setM_uiInsertQueueTime:]//=createtime
//    [voiceWrap setM_nsToUsrName:@"wxid_j79te0rwqh0d22"];
//    [voiceWrap setM_nsExtend:@"<voiceforwardflag>0</voiceforwardflag>"];
//    [mmNewUploadVoiceMgr insertNewRowInUploadVoice:voiceWrap];
//    [mmNewUploadVoiceMgr InsertUploadVoice:voiceWrap];
//    [mmNewUploadVoiceMgr loadDataFromAudioFile:voiceWrap];
//    [voiceWrap setM_dtVoice:NSData];
//    
//    [audioSender onSilkPart:userData];
//    [audioSender updateMessageStatus:messageWrap];
//    [mmNewUploadVoiceMgr uploadOnePacket];
//    [mmNewUploadVoiceMgr getOneUploadItemFromDB];
//    [mmNewUploadVoiceMgr GetOneUploadVoice];
//    [mmNewUploadVoiceMgr savePB:id];
//    [mmNewUploadVoiceMgr NotifyFromMainCtrl:180 MessageInfo: Event:29];
//    [mmNewUploadVoiceMgr HandleUploadVoiceOK:voiceWrap];
//    [mmNewUploadVoiceMgr IsInUploadQueue:@"wxid_j79te0rwqh0d22" LocalID:1 Offset:0];
//    [mmNewUploadVoiceMgr IsExistInUploadVoiceByToUser:@"wxid_j79te0rwqh0d22" localId:1 offset:0];
//    [audioSender updateMessageToDB:messageWrap];
//    [mmNewUploadVoiceMgr MainThreadNotifyUploadVoiceOK:voiceWrap];
//    
    

    
}

@end
