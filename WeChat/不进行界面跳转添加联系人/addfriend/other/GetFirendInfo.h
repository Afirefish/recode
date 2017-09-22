//
//  GetFirendInfo.h
//  
//
//  Created by 戴曦嘉 on 2017/8/17.
//
//

#ifndef GetFirendInfo_h
#define GetFirendInfo_h

@interface SKBuiltinString_t
@property(retain, nonatomic) NSString *string; // @dynamic string;
@end

@interface SKBuiltinBuffer_t
@property(retain, nonatomic) NSData *buffer; // @dynamic buffer;
@property(nonatomic) unsigned int iLen; // @dynamic iLen;
@end

@interface BaseResponse
@property(retain, nonatomic) SKBuiltinString_t *errMsg; // @dynamic errMsg;
@property(nonatomic) int ret; // @dynamic ret;
@end

@interface CustomizedInfo
@property(nonatomic) unsigned int brandFlag; // @dynamic brandFlag;
@property(retain, nonatomic) NSString *brandIconUrl; // @dynamic brandIconUrl;
@property(retain, nonatomic) NSString *brandInfo; // @dynamic brandInfo;
@property(retain, nonatomic) NSString *externalInfo; // @dynamic externalInfo;
@end


@interface SnsUserInfo
@property(retain, nonatomic) NSString *snsBgimgId; // @dynamic snsBgimgId;
@property(nonatomic) unsigned long long snsBgobjectId; // @dynamic snsBgobjectId;
@property(nonatomic) unsigned int snsFlag; // @dynamic snsFlag;
@property(nonatomic) unsigned int snsFlagEx; // @dynamic snsFlagEx;
@end

@interface BaseRequest
@property(nonatomic) int clientVersion; // @dynamic clientVersion;
@property(retain, nonatomic) NSData *deviceId; // @dynamic deviceId;
@property(retain, nonatomic) NSData *deviceType; // @dynamic deviceType;
@property(nonatomic) unsigned int scene; // @dynamic scene;
@property(retain, nonatomic) NSData *sessionKey; // @dynamic sessionKey;
@property(nonatomic) unsigned int uin; // @dynamic uin;
@end

@interface SearchContactResponse
@property(retain, nonatomic) NSString *albumBgimgId; // @dynamic albumBgimgId;
@property(nonatomic) int albumFlag; // @dynamic albumFlag;
@property(nonatomic) int albumStyle; // @dynamic albumStyle;
@property(retain, nonatomic) NSString *alias; // @dynamic alias;
@property(retain, nonatomic) NSString *antispamTicket; // @dynamic antispamTicket;
@property(retain, nonatomic) BaseResponse *baseResponse; // @dynamic baseResponse;
@property(retain, nonatomic) NSString *bigHeadImgUrl; // @dynamic bigHeadImgUrl;
@property(retain, nonatomic) NSString *city; // @dynamic city;
@property(nonatomic) unsigned int contactCount; // @dynamic contactCount;
@property(retain, nonatomic) NSMutableArray *contactList; // @dynamic contactList;
@property(retain, nonatomic) NSString *country; // @dynamic country;
@property(retain, nonatomic) CustomizedInfo *customizedInfo; // @dynamic customizedInfo;
@property(retain, nonatomic) SKBuiltinBuffer_t *imgBuf; // @dynamic imgBuf;
@property(retain, nonatomic) NSString *kfworkerId; // @dynamic kfworkerId;
@property(nonatomic) unsigned int matchType; // @dynamic matchType;
@property(retain, nonatomic) NSString *myBrandList; // @dynamic myBrandList;
@property(retain, nonatomic) SKBuiltinString_t *nickName; // @dynamic nickName;
@property(nonatomic) unsigned int personalCard; // @dynamic personalCard;
@property(retain, nonatomic) NSString *province; // @dynamic province;
@property(retain, nonatomic) SKBuiltinString_t *pyinitial; // @dynamic pyinitial;
@property(retain, nonatomic) SKBuiltinString_t *quanPin; // @dynamic quanPin;
@property(retain, nonatomic) SKBuiltinBuffer_t *resBuf; // @dynamic resBuf;
@property(nonatomic) int sex; // @dynamic sex;
@property(retain, nonatomic) NSString *signature; // @dynamic signature;
@property(retain, nonatomic) NSString *smallHeadImgUrl; // @dynamic smallHeadImgUrl;
@property(retain, nonatomic) SnsUserInfo *snsUserInfo; // @dynamic snsUserInfo;
@property(retain, nonatomic) SKBuiltinString_t *userName; // @dynamic userName;
@property(nonatomic) unsigned int verifyFlag; // @dynamic verifyFlag;
@property(retain, nonatomic) NSString *verifyInfo; // @dynamic verifyInfo;
@property(retain, nonatomic) NSString *weibo; // @dynamic weibo;
@property(nonatomic) unsigned int weiboFlag; // @dynamic weiboFlag;
@property(retain, nonatomic) NSString *weiboNickname; // @dynamic weiboNickname;

@end

@interface SearchContactRequest
@property(retain, nonatomic) BaseRequest *baseRequest; // @dynamic baseRequest;
@property(nonatomic) unsigned int fromScene; // @dynamic fromScene;
@property(nonatomic) unsigned int opCode; // @dynamic opCode;
@property(retain, nonatomic) SKBuiltinBuffer_t *reqBuf; // @dynamic reqBuf;
@property(nonatomic) unsigned int searchScene; // @dynamic searchScene;
@property(retain, nonatomic) SKBuiltinString_t *userName; // @dynamic userName;

@end







@interface CContact
@property(retain, nonatomic) NSString *m_nsCity; // @synthesize m_nsCity;

@end

@interface ContactInfoViewController
@end

@interface MMUILabel
@end

@interface AddressBookFriend
@end

@interface SendVerifyMsgViewController
@end

@interface ContactsViewController
@end

@interface SearchContactDataProvider
@end

@interface FTSWebSearchController
@end

@interface WSHistoryCacheLogic
@end

@interface WSJSEventHandler
@end

@interface WSContactSearchLogic
@end

@interface WSTagSearchLogic
@end

@interface CAppBrandInfo
@end

@interface ChatRoomData
@end

@interface ChatRoomDetail
@end

@interface SubscriptBrandInfo
@end

#endif /* GetFirendInfo_h */
