//
//  addFirend.h
//  
//
//  Created by 戴曦嘉 on 2017/8/15.
//
//

#ifndef addFriend_h
#define addFriend_h

@interface CContact
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

@interface CContactMgr
- (id)getContactByName:(id)arg1;
- (id)getContactForSearchByName:(id)arg1;
@end


#endif /* addFriend_h */
