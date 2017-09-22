//
//  addFirend.h
//  
//
//  Created by 戴曦嘉 on 2017/8/15.
//
//

#ifndef addFriend_h
#define addFriend_h

@interface ChatRoomData
@end

@interface ChatRoomDetail
@end

@interface SubscriptBrandInfo
@end

@interface UrlInfo
@end

@interface WXPBGeneratedMessage
@end

@interface CContact
@property(retain, nonatomic) ChatRoomData *m_ChatRoomData; // @synthesize m_ChatRoomData;
@property(retain, nonatomic) ChatRoomDetail *m_ChatRoomDetail; // @synthesize m_ChatRoomDetail;
@property(retain, nonatomic) NSArray *m_arrPhoneItem; // @synthesize m_arrPhoneItem;
@property(nonatomic) _Bool m_bFromNewDB; // @synthesize m_bFromNewDB=_m_bFromNewDB;
@property(readonly, nonatomic) NSDictionary *m_dicWeiDianInfo; // @synthesize m_dicWeiDianInfo=_m_dicWeiDianInfo;
@property(nonatomic) int m_iWCFlag; // @synthesize m_iWCFlag;
@property(nonatomic) _Bool m_isExtInfoValid; // @synthesize m_isExtInfoValid;
@property(nonatomic) _Bool m_isShowRedDot; // @synthesize m_isShowRedDot;
@property(retain, nonatomic) NSString *m_nsBrandIconUrl; // @synthesize m_nsBrandIconUrl;
@property(retain, nonatomic) NSString *m_nsBrandSubscriptConfigUrl; // @synthesize m_nsBrandSubscriptConfigUrl;
@property(retain, nonatomic) NSString *m_nsCardUrl; // @synthesize m_nsCardUrl;
@property(retain, nonatomic) NSString *m_nsCertificationInfo; // @synthesize m_nsCertificationInfo;
@property(retain, nonatomic) NSString *m_nsChatRoomData; // @synthesize m_nsChatRoomData;
@property(retain, nonatomic) NSString *m_nsChatRoomMemList; // @synthesize m_nsChatRoomMemList;
@property(retain, nonatomic) NSString *m_nsCity; // @synthesize m_nsCity;
@property(retain, nonatomic) NSString *m_nsCountry; // @synthesize m_nsCountry;
@property(retain, nonatomic) NSString *m_nsDescription; // @synthesize m_nsDescription;
@property(retain, nonatomic) NSString *m_nsExternalInfo; // @synthesize m_nsExternalInfo;
@property(retain, nonatomic) NSString *m_nsFBID; // @synthesize m_nsFBID;
@property(retain, nonatomic) NSString *m_nsFBNickName; // @synthesize m_nsFBNickName;
@property(retain, nonatomic) NSString *m_nsLabelIDList; // @synthesize m_nsLabelIDList;
@property(retain, nonatomic) NSString *m_nsLinkedInID; // @synthesize m_nsLinkedInID;
@property(retain, nonatomic) NSString *m_nsLinkedInName; // @synthesize m_nsLinkedInName;
@property(retain, nonatomic) NSString *m_nsLinkedInPublicUrl; // @synthesize m_nsLinkedInPublicUrl;
@property(retain, nonatomic) NSString *m_nsMobileFullHash; // @synthesize m_nsMobileFullHash;
@property(retain, nonatomic) NSString *m_nsMobileHash; // @synthesize m_nsMobileHash;
@property(retain, nonatomic) NSString *m_nsOwner; // @synthesize m_nsOwner;
@property(retain, nonatomic) NSString *m_nsProvince; // @synthesize m_nsProvince;
@property(retain, nonatomic) NSString *m_nsSignature; // @synthesize m_nsSignature;
@property(retain, nonatomic) NSString *m_nsWCBGImgObjectID; // @synthesize m_nsWCBGImgObjectID;
@property(retain, nonatomic) NSString *m_nsWeiDianInfo; // @synthesize m_nsWeiDianInfo;
@property(retain, nonatomic) NSString *m_nsWorkID; // @synthesize m_nsWorkID;
@property(retain, nonatomic) NSString *m_pcWCBGImgID; // @synthesize m_pcWCBGImgID;
@property(retain, nonatomic) SubscriptBrandInfo *m_subBrandInfo; // @synthesize m_subBrandInfo;
@property(nonatomic) unsigned int m_uiBrandSubscriptionSettings; // @synthesize m_uiBrandSubscriptionSettings;
@property(nonatomic) unsigned int m_uiCertificationFlag; // @synthesize m_uiCertificationFlag;
@property(nonatomic) unsigned int m_uiChatRoomAccessType; // @synthesize m_uiChatRoomAccessType;
@property(nonatomic) unsigned int m_uiChatRoomMaxCount; // @synthesize m_uiChatRoomMaxCount;
@property(nonatomic) unsigned int m_uiChatRoomStatus; // @synthesize m_uiChatRoomStatus;
@property(nonatomic) unsigned int m_uiChatRoomVersion; // @synthesize m_uiChatRoomVersion;
@property(nonatomic) unsigned int m_uiDebugModeType; // @synthesize m_uiDebugModeType=_m_uiDebugModeType;
@property(nonatomic) unsigned int m_uiDeleteFlag; // @synthesize m_uiDeleteFlag;
@property(nonatomic) unsigned int m_uiLastUpdate; // @synthesize m_uiLastUpdate=_m_uiLastUpdate;
@property(nonatomic) unsigned int m_uiMetaFlag; // @synthesize m_uiMetaFlag=_m_uiMetaFlag;
@property(nonatomic) unsigned int m_uiNeedUpdate; // @synthesize m_uiNeedUpdate;
@property(nonatomic) unsigned int m_uiWxAppOpt; // @synthesize m_uiWxAppOpt=_m_uiWxAppOpt;


@property(retain, nonatomic) NSData *m_dtUsrImg; // @synthesize m_dtUsrImg;
@property(readonly, nonatomic) _Bool m_isPlugin; // @synthesize m_isPlugin;
@property(retain, nonatomic) NSString *m_nsAliasName; // @synthesize m_nsAliasName;                     xi33339999   kelekaka90
@property(retain, nonatomic) NSString *m_nsAntispamTicket; // @synthesize m_nsAntispamTicket;           v2_d0541c3b7241b51d016fb19fb88fb9dfa9aa336ec30511648103fcd7a3da12b0d6e069b7ba42057850c129705fb755ab@stranger
@property(retain, nonatomic) NSString *m_nsAtUserList; // @synthesize m_nsAtUserList;
@property(retain, nonatomic) NSString *m_nsDisplayNamePY; // @synthesize m_nsDisplayNamePY;
@property(retain, nonatomic) NSString *m_nsDraft; // @synthesize m_nsDraft;
@property(retain, nonatomic) NSString *m_nsEncodeUserName; // @synthesize m_nsEncodeUserName;
@property(retain, nonatomic) NSString *m_nsFullPY; // @synthesize m_nsFullPY;                                   xi   wxids7qy2us2r33i12
@property(retain, nonatomic) NSString *m_nsGoogleContactName; // @synthesize m_nsGoogleContactName;
@property(retain, nonatomic) NSString *m_nsGoogleContactNickName; // @synthesize m_nsGoogleContactNickName;
@property(retain, nonatomic) NSString *m_nsHDImgStatus; // @synthesize m_nsHDImgStatus;
@property(retain, nonatomic) NSString *m_nsHeadHDImgUrl; // @synthesize m_nsHeadHDImgUrl;
@property(retain, nonatomic) NSString *m_nsHeadHDMd5; // @synthesize m_nsHeadHDMd5;
@property(retain, nonatomic) NSString *m_nsHeadImgUrl; // @synthesize m_nsHeadImgUrl;
@property(retain, nonatomic) NSString *m_nsImgStatus; // @synthesize m_nsImgStatus;
@property(retain, nonatomic) NSString *m_nsMobileIdentify; // @synthesize m_nsMobileIdentify;
@property(retain, nonatomic) NSString *m_nsNickName; // @synthesize m_nsNickName;                               xi    kelekaka
@property(retain, nonatomic) NSString *m_nsQQNickName; // @synthesize m_nsQQNickName;
@property(retain, nonatomic) NSString *m_nsQQRemark; // @synthesize m_nsQQRemark;
@property(retain, nonatomic) NSString *m_nsRemark; // @synthesize m_nsRemark;
@property(retain, nonatomic) NSString *m_nsRemarkPYFull; // @synthesize m_nsRemarkPYFull;
@property(retain, nonatomic) NSString *m_nsRemarkPYShort; // @synthesize m_nsRemarkPYShort;
@property(retain, nonatomic) NSString *m_nsShortPY; // @synthesize m_nsShortPY;
@property(retain, nonatomic) NSString *m_nsUsrName; // @synthesize m_nsUsrName;                     wxid_j79te0rwqh0d22     v1_d3813462982a480ce7791ceb234376e084c199d0faae05d05e966d07a4df5fd0595fb668c82e370bb8c78f2586cfb885@stranger
@property(nonatomic) unsigned int m_uiChatState; // @synthesize m_uiChatState;
@property(nonatomic) unsigned int m_uiConType; // @synthesize m_uiConType;                                 0
@property(nonatomic) unsigned int m_uiDraftTime; // @synthesize m_uiDraftTime;
@property(nonatomic) unsigned int m_uiExtKey; // @synthesize m_uiExtKey;
@property(nonatomic) unsigned int m_uiExtKeyAtLastGet; // @synthesize m_uiExtKeyAtLastGet;
@property(nonatomic) unsigned int m_uiFriendScene; // @synthesize m_uiFriendScene;                      3   3
@property(nonatomic) unsigned int m_uiImgKey; // @synthesize m_uiImgKey;
@property(nonatomic) unsigned int m_uiImgKeyAtLastGet; // @synthesize m_uiImgKeyAtLastGet;
@property(nonatomic) unsigned int m_uiQQUin; // @synthesize m_uiQQUin;
@property(nonatomic) unsigned int m_uiSex; // @synthesize m_uiSex;                                      1   2
@property(nonatomic) unsigned int m_uiType; // @synthesize m_uiType;


@end

@interface ContactInfoViewController : UIViewController
@property(retain, nonatomic) CContact *m_contact; // @synthesize m_contact;创建联系人信息
@property(nonatomic) unsigned int m_uiFromScene; // @synthesize m_uiFromScene;创建联系人界面 6
@property(nonatomic) int m_uiAddFriendStatScene; // @synthesize m_uiAddFriendStatScene;参数为2
- (void)updateContactFromServer;//从服务器更新联系人信息
- (void)checkNeedForcedUpdateForMemberDetail;//检查信息？

@end

@interface CMessageWrap 

@end

@interface CVerifyContactWrap
@property(retain, nonatomic) NSString *m_nsChatRoomUserName; // @synthesize m_nsChatRoomUserName=_m_nsChatRoomUserName;
@property(retain, nonatomic) NSString *m_nsOriginalUsrName; // @synthesize m_nsOriginalUsrName;
@property(retain, nonatomic) NSString *m_nsSourceNickName; // @synthesize m_nsSourceNickName;
@property(retain, nonatomic) NSString *m_nsSourceUserName; // @synthesize m_nsSourceUserName;
@property(retain, nonatomic) NSString *m_nsTicket; // @synthesize m_nsTicket;
@property(retain, nonatomic) NSString *m_nsUsrName; // @synthesize m_nsUsrName;
@property(retain, nonatomic) CContact *m_oVerifyContact; // @synthesize m_oVerifyContact;
@property(nonatomic) unsigned int m_uiScene; // @synthesize m_uiScene;
@property(nonatomic) unsigned int m_uiWCFlag; // @synthesize m_uiWCFlag;
@end

@interface CContactMgr
- (id)getContactByName:(id)arg1;
- (id)getContactForSearchByName:(id)arg1;


@end



@interface AddressBookFriend
@end

@interface SendVerifyMsgViewController
@end

@interface ContactsViewController
@end


@interface CAppBrandInfo
@end


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









@interface MMUILabel
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


#endif /* addFriend_h */
