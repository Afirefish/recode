//
//  SendVoiceHelp.h
//  
//
//  Created by 戴曦嘉 on 2017/10/13.
//
//

#ifndef SendVoiceHelp_h
#define SendVoiceHelp_h

@interface MMServiceCenter : NSObject
+ (id)defaultCenter;
- (id)getService:(Class)className;
@end

@protocol IMsgExtendOperation <NSObject>

@end

@interface CMessageWrap : NSObject
@property(retain, nonatomic) NSString *m_nsToUsr; // @synthesize m_nsToUsr;
@property(retain, nonatomic) NSString *m_nsFromUsr; // @synthesize m_nsFromUsr;
@property(nonatomic) unsigned int m_uiMessageType; // @synthesize m_uiMessageType;
@property(retain, nonatomic) NSString *m_nsContent; // @synthesize m_nsContent;
@property(retain, nonatomic) id <IMsgExtendOperation> m_extendInfoWithMsgType; // @synthesize m_extendInfoWithMsgType;
@property(nonatomic) unsigned int m_uiMsgFlag; // @synthesize m_uiMsgFlag;
@property(nonatomic) unsigned int m_uiVoiceFormat; // @dynamic m_uiVoiceFormat;
@property(nonatomic) unsigned int m_uiVoiceEndFlag; // @dynamic m_uiVoiceEndFlag;
@property(nonatomic) unsigned int m_uiCreateTime; // @synthesize m_uiCreateTime;
@property(nonatomic) unsigned int m_uiVoiceTime; // @dynamic m_uiVoiceTime;
@property(retain, nonatomic) NSData *m_dtVoice; // @dynamic m_dtVoice;

+ (id)getPathOfMsgImg:(id)arg1;
- (id)initWithMsgType:(long long)arg1;
- (id)initWithMsgType:(long long)arg1 nsFromUsr:(id)arg2;


@end


@interface CMessageMgr : NSObject
- (void)AddMsg:(id)arg1 MsgWrap:(id)arg2;
- (void)AddEmoticonMsg:(id)arg1 MsgWrap:(id)arg2;
- (void)UpdateEmoticonMsg:(id)arg1;
- (void)CheckMessageStatus:(id)arg1 Msg:(id)arg2;
- (id)GetMsg:(id)arg1 LocalID:(unsigned int)arg2;


@end


@interface AudioRecorderUserData : NSObject
@property(retain,nonatomic) NSString *fromusr; // @synthesize fromusr;
@property(retain,nonatomic) NSString *tousr; // @synthesize tousr;


@end

@interface AudioSender : NSObject
- (_Bool)CanStartRecordFrom:(id)arg1 ToUser:(id)arg2;
- (void)ResendVoiceMsg:(id)arg1 MsgWrap:(id)arg2;
- (_Bool)updateMessageStatus:(id)arg1;
- (_Bool)StopRecord;
- (_Bool)CancelRecord;
- (void)stop;
@end

@interface MMNewUploadVoiceMgr : NSObject
- (void)HandleUploadVoiceOK:(id)arg1;
- (void)MainThreadNotifyUploadVoiceOK:(id)arg1;
- (_Bool)UpdateUploadVoiceRetryCount:(id)arg1 byUserName:(id)arg2 localId:(unsigned int)arg3 offset:(unsigned int)arg4;
- (_Bool)PrepareForUploadEx:(id)arg1;
- (_Bool)loadDataFromAudioFile:(id)arg1;
- (_Bool)PrepareForUpload:(id)arg1 packetExpireTime:(_Bool)arg2;
- (void)UpdateRetryCount:(id)arg1;
- (_Bool)uploadOnePacket;
- (_Bool)IsInUploadQueue:(id)arg1 LocalID:(unsigned int)arg2 Offset:(unsigned int)arg3;
- (_Bool)DeleteUploadVoiceByToUser:(id)arg1 localId:(unsigned int)arg2 offset:(unsigned int)arg3;
- (id)getOneUploadItemFromDB;
- (id)GetOneUploadVoice;
- (void)Stop;
- (void)CancelUpload:(id)arg1 LocalID:(unsigned int)arg2 n64SvrID:(long long)arg3 Offset:(unsigned int)arg4 Len:(unsigned int)arg5 VoiceTime:(unsigned int)arg6 CreateTime:(unsigned int)arg7 EndFlag:(unsigned int)arg8 CancelFlag:(unsigned int)arg9 VoiceFormat:(unsigned int)arg10;

@end

@interface SilkAudioRecorder : NSObject
- (void)setStartRecordTime;
- (void)setUserData:(id)arg1;
@property(retain,nonatomic) AudioRecorderUserData *mUserData; // @synthesize mUserData;
- (void)createSilkFile:(id)arg1;
- (_Bool)prepareRecord;
- (void)setBeginSendData;
- (void)setDelegate:(id)arg1;
- (_Bool)prepareSend;
- (int)real_record;
- (void)record;
- (_Bool)canAutoRestart;
- (void)BeginNotifyOnMainThread:(id)arg1;
- (void)stop;

@end

@interface UploadVoiceWrap : NSObject
+ (void)initialize;
@property(nonatomic) unsigned int m_uiLocalID; // @synthesize m_uiLocalID;
@property(retain, nonatomic) NSString *m_nsExtend; // @synthesize m_nsExtend;
@property(retain, nonatomic) NSString *m_nsToUsrName; // @synthesize m_nsToUsrName;
@property(retain, nonatomic) NSString *m_nsFromUsrName; // @synthesize m_nsFromUsrName=_m_nsFromUsrName;

@end

#endif /* SendVoiceHelp_h */
