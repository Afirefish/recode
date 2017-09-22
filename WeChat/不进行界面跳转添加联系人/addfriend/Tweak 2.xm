#import "addFriend.h"


/*%hook NewMainFrameViewController
- (void)viewDidAppear:(BOOL)animated {
	%log;
	%orig;
	CContactMgr *con = [[%c(CContactMgr) alloc] init];
	CContact *contact  = (CContact *)[con getContactByName:@"kelekaka90"];
	
	NSLog(@"give me value----%@", contact);
	ContactInfoViewController *contactViewController = [[objc_getClass("ContactInfoViewController") alloc] init];
		[contact setM_nsUsrName:@"kelekaka90"];
		[contact setM_nsAntispamTicket:@"v2_7780e774be6ffb56ae41023d9b4f8f4d2855705b2358b3fe16388a07ce1b8b557f647d864d7721838969e7a7a7603a80@stranger"];
		[contact setM_bFromNewDB:1];
        [contact setM_uiType:0];
        [contact setM_uiFriendScene:3];
        [contactViewController setM_contact:contact];
        [contactViewController setM_uiFromScene: 6];
        [contactViewController setM_uiAddFriendStatScene:2];
        [contactViewController updateContactFromServer];
        [contactViewController checkNeedForcedUpdateForMemberDetail];
	UITabBarController *rootViewController = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
	UINavigationController *mmNavigation = (UINavigationController *)[rootViewController selectedViewController];
	[mmNavigation  pushViewController:contactViewController animated:YES];
}
%end*/







/*%hook WeixinContactInfoAssist
- (id)GetTableView { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)IsShowUserName { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)MessageReturn:(id)arg1 Event:(unsigned int)arg2 { %log; %orig; }
- (void)actionSheet:(id)arg1 clickedButtonAtIndex:(long long)arg2 { %log; %orig; }
- (void)addToBlackList:(id)arg1 { %log; %orig; }
- (void)contactVerifyOk:(id)arg1 opCode:(unsigned int)arg2 { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (void)doAddToBlackList { %log; %orig; }
- (void)doDeleteContact { %log; %orig; }
- (void)getChatRoomMemberContact { %log; %orig; }
- (id)getInfoDisplayName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)handleAddedContact { %log; %orig; }
- (_Bool)hasMore { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)initAddContactBtn { %log; %orig; }
- (void)initBlackAndExposeContactBtn { %log; %orig; }
- (void)initBlackListTipsLabel { %log; %orig; }
- (void)initData { %log; %orig; }
- (void)initDeleteBtn { %log; %orig; }
- (void)initExposeBtn { %log; %orig; }
- (void)initFooterBtnArea { %log; %orig; }
- (void)initFooterView { %log; %orig; }
- (void)initQuitRoomTipsLabel { %log; %orig; }
- (void)initSayHelloBtn { %log; %orig; }
- (void)initSendMsgBtn { %log; %orig; }
- (void)initTableView { %log; %orig; }
- (void)initVerifyBtn { %log; %orig; }
- (_Bool)initVoipBtn { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)initWCPrivacyButton { %log; %orig; }
- (id)initWithContact:(id)arg1 andChatContact:(id)arg2 andVerify:(unsigned int)arg3 delegate:(id)arg4 location:(id)arg5 sourceMsg:(id)arg6 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isFromQRCode { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isFromStrangeScene { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isNeedHideUserName { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isNeedShowRightBtn { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isNeedVerify { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isShowAddFriendScene { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isShowBlackAction { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isShowExposeButton { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)loadLocalContactData { %log; %orig; }
- (void)setM_bDisableAllOperation:(_Bool )m_bDisableAllOperation { %log; %orig; }
- (_Bool )m_bDisableAllOperation { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)makeAlbumCell:(id)arg1 CellInfo:(id)arg2 { %log; %orig; }
- (void)makeCellTitle:(id)arg1 Title:(id)arg2 MaxWidth:(double)arg3 { %log; %orig; }
- (void)makeDescriptionCell:(id)arg1 CellInfo:(id)arg2 { %log; %orig; }
- (void)makeEditRemarkNameCell:(id)arg1 CellInfo:(id)arg2 { %log; %orig; }
- (void)makeHeadCell:(id)arg1 CellInfo:(id)arg2 { %log; %orig; }
- (id)makeHeadSmallLabel:(id)arg1 Y:(double)arg2 text:(id)arg3 cpKey:(id)arg4 inUnsafe:(_Bool)arg5 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)makeHeadSmallLabel:(id)arg1 Y:(double)arg2 text:(id)arg3 cpKey:(id)arg4 inUnsafe:(_Bool)arg5 withPrefixTitle:(id)arg6 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)makeLeftValueCell:(id)arg1 CellInfo:(id)arg2 { %log; %orig; }
- (void)makeMoreCell:(id)arg1 CellInfo:(id)arg2 { %log; %orig; }
- (void)makePhoneCell:(id)arg1 CellInfo:(id)arg2 { %log; %orig; }
- (void)makeSourceCell:(id)arg1 CellInfo:(id)arg2 { %log; %orig; }
- (void)makeTagsCell:(id)arg1 CellInfo:(id)arg2 { %log; %orig; }
- (void)onAction { %log; %orig; }
- (void)onExposeByRecommand { %log; %orig; }
- (void)onHomepageUpdate:(int)arg1 withAdded:(id)arg2 andChanged:(id)arg3 andDeleted:(id)arg4 { %log; %orig; }
- (void)onLinkClicked:(id)arg1 withRect:(struct CGRect)arg2 { %log; %orig; }
- (void)onNewMessage:(id)arg1 { %log; %orig; }
- (void)onOpenVoiceVoipView { %log; %orig; }
- (void)onOpenVoipActionSheet:(id)arg1 { %log; %orig; }
- (void)onOpenVoipView { %log; %orig; }
- (void)onRelpyContact:(id)arg1 { %log; %orig; }
- (void)onRestoreCPLabel:(id)arg1 { %log; %orig; }
- (void)onSayHelloToContact { %log; %orig; }
- (void)onSocialInfoHandle { %log; %orig; }
- (void)onStartChat:(id)arg1 { %log; %orig; }
- (void)onVerifyContact:(id)arg1 opcode:(unsigned int)arg2 { %log; %orig; }
- (void)onVerifyContactOk { %log; %orig; }
- (void)opBlackList:(id)arg1 { %log; %orig; }
- (void)opEditRemarkName { %log; %orig; }
- (void)opSetWCPermissions { %log; %orig; }
- (void)opSetWCStrangerPermissions { %log; %orig; }
- (void)reloadTableView { %log; %orig; }
- (void)removeFromBlackList { %log; %orig; }
- (_Bool)shouldOpenNewLineAtY:(double)arg1 withLineHeight:(double)arg2 richTextView:(id)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)showAlbumList { %log; %orig; }
- (void)showRightButton { %log; %orig; }
- (void)tryCall:(id)arg1 { %log; %orig; }
- (void)updateCPState { %log; %orig; }
- (void)updateFooterView { %log; %orig; }
- (void)updateToBigSendMsgBtn { %log; %orig; }
- (void)verifyContactWithOpCode:(unsigned int)arg1 { %log; %orig; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end



%hook CBaseContact
+ (void)initialize { %log; %orig; }
- (id)chatRoomTopic { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (long long)compare:(id)arg1 { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (_Bool)copyFrom:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)encodeWithCoder:(id)arg1 { %log; %orig; }
- (void)setExternalInfoJSONCache:(NSDictionary *)externalInfoJSONCache { %log; %orig; }
- (NSDictionary *)externalInfoJSONCache { %log; NSDictionary * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getContactDisplayName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getContactDisplayUsrName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getContactHeadImage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getContactTalkRoomName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getEncodeUserName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (int)getImageStatusCode { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getQQDisplayName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getRemark { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getValueTypeTable { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)hasContactDisplayUsrName { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)hasContactDisplayUsrNameByCache { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)initWithCoder:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isBlack { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isBrandSessionHolder { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isChatStatusNotifyOpen { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isChatroom { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isEnterpriseContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isEqualToContact:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isEqualToName:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isFavour { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isFileHelper { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isGroupCard { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHasGMail { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHasHDImg { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHasQQ { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHasQQDisplayName { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isLbsroom { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isMMContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isMacHelper { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isNeedGetHDImg { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isNeedGetUsrImg { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isNeedGetUsrImgWithoutCheckLocalFile { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isQQ { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isQQMBlog { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isSelf { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isSnsBlack { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isTemplateMsgHolder { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isValid { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isWeSportBlack { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isWeSportContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isWeixin { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isWeixinTeamContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)localizedStringForMale:(id)arg1 female:(id)arg2 andUnkownSex:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_dtUsrImg:(NSData *)m_dtUsrImg { %log; %orig; }
- (NSData *)m_dtUsrImg { %log; NSData * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool )m_isPlugin { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_nsAliasName:(NSString *)m_nsAliasName { %log; %orig; }
- (NSString *)m_nsAliasName { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsAntispamTicket:(NSString *)m_nsAntispamTicket { %log; %orig; }
- (NSString *)m_nsAntispamTicket { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsAtUserList:(NSString *)m_nsAtUserList { %log; %orig; }
- (NSString *)m_nsAtUserList { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsDisplayNamePY:(NSString *)m_nsDisplayNamePY { %log; %orig; }
- (NSString *)m_nsDisplayNamePY { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsDraft:(NSString *)m_nsDraft { %log; %orig; }
- (NSString *)m_nsDraft { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsEncodeUserName:(NSString *)m_nsEncodeUserName { %log; %orig; }
- (NSString *)m_nsEncodeUserName { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsFullPY:(NSString *)m_nsFullPY { %log; %orig; }
- (NSString *)m_nsFullPY { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsGoogleContactName:(NSString *)m_nsGoogleContactName { %log; %orig; }
- (NSString *)m_nsGoogleContactName { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsGoogleContactNickName:(NSString *)m_nsGoogleContactNickName { %log; %orig; }
- (NSString *)m_nsGoogleContactNickName { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsHDImgStatus:(NSString *)m_nsHDImgStatus { %log; %orig; }
- (NSString *)m_nsHDImgStatus { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsHeadHDImgUrl:(NSString *)m_nsHeadHDImgUrl { %log; %orig; }
- (NSString *)m_nsHeadHDImgUrl { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsHeadHDMd5:(NSString *)m_nsHeadHDMd5 { %log; %orig; }
- (NSString *)m_nsHeadHDMd5 { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsHeadImgUrl:(NSString *)m_nsHeadImgUrl { %log; %orig; }
- (NSString *)m_nsHeadImgUrl { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsImgStatus:(NSString *)m_nsImgStatus { %log; %orig; }
- (NSString *)m_nsImgStatus { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsMobileIdentify:(NSString *)m_nsMobileIdentify { %log; %orig; }
- (NSString *)m_nsMobileIdentify { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsNickName:(NSString *)m_nsNickName { %log; %orig; }
- (NSString *)m_nsNickName { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsQQNickName:(NSString *)m_nsQQNickName { %log; %orig; }
- (NSString *)m_nsQQNickName { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsQQRemark:(NSString *)m_nsQQRemark { %log; %orig; }
- (NSString *)m_nsQQRemark { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsRemark:(NSString *)m_nsRemark { %log; %orig; }
- (NSString *)m_nsRemark { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsRemarkPYFull:(NSString *)m_nsRemarkPYFull { %log; %orig; }
- (NSString *)m_nsRemarkPYFull { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsRemarkPYShort:(NSString *)m_nsRemarkPYShort { %log; %orig; }
- (NSString *)m_nsRemarkPYShort { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsShortPY:(NSString *)m_nsShortPY { %log; %orig; }
- (NSString *)m_nsShortPY { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsUsrName:(NSString *)m_nsUsrName { %log; %orig; }
- (NSString *)m_nsUsrName { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_uiChatState:(unsigned int )m_uiChatState { %log; %orig; }
- (unsigned int )m_uiChatState { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiConType:(unsigned int )m_uiConType { %log; %orig; }
- (unsigned int )m_uiConType { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiDraftTime:(unsigned int )m_uiDraftTime { %log; %orig; }
- (unsigned int )m_uiDraftTime { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiExtKey:(unsigned int )m_uiExtKey { %log; %orig; }
- (unsigned int )m_uiExtKey { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiExtKeyAtLastGet:(unsigned int )m_uiExtKeyAtLastGet { %log; %orig; }
- (unsigned int )m_uiExtKeyAtLastGet { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiFriendScene:(unsigned int )m_uiFriendScene { %log; %orig; }
- (unsigned int )m_uiFriendScene { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiImgKey:(unsigned int )m_uiImgKey { %log; %orig; }
- (unsigned int )m_uiImgKey { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiImgKeyAtLastGet:(unsigned int )m_uiImgKeyAtLastGet { %log; %orig; }
- (unsigned int )m_uiImgKeyAtLastGet { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiQQUin:(unsigned int )m_uiQQUin { %log; %orig; }
- (unsigned int )m_uiQQUin { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiSex:(unsigned int )m_uiSex { %log; %orig; }
- (unsigned int )m_uiSex { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiType:(unsigned int )m_uiType { %log; %orig; }
- (unsigned int )m_uiType { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)realFriendScene { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)saveUserImage { %log; %orig; }
- (void)setBlack:(_Bool)arg1 { %log; %orig; }
- (void)setChatRoomTopic:(id)arg1 { %log; %orig; }
- (void)setDisplayNamePY { %log; %orig; }
- (void)setNickNameWithoutEmojiChange:(id)arg1 { %log; %orig; }
- (void)setRemarkWithoutEmojiChange:(id)arg1 { %log; %orig; }
- (void)setSnsBlack:(_Bool)arg1 { %log; %orig; }
- (void)setWeSportBlack:(_Bool)arg1 { %log; %orig; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end


%hook ContactInfoViewController
- (unsigned int)GetFromScene { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)MessageReturn:(id)arg1 Event:(unsigned int)arg2 { %log; %orig; }
- (void)alertView:(id)arg1 clickedButtonAtIndex:(long long)arg2 { %log; %orig; }
- (void)bindPhoneReturn { %log; %orig; }
- (void)checkNeedForcedUpdateForMemberDetail { %log; %orig; }
- (void)confirmExpose:(unsigned int)arg1 { %log; %orig; }
- (void)contactVerifyOk:(id)arg1 
{ %log; 
	NSLog(@"what this?---%@",[arg1 class]);	%orig; }
- (void)copyContactField:(id)arg1 toContact:(id)arg2 { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (void)delAllMsg { %log; %orig; }
- (void)doReset { %log; %orig; }
- (id)getContactVerifyLogic { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getCurrentViewController { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getSearchId { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getUserData { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getViewController { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)initSystemPluginData:(int)arg1 { %log; %orig; }
- (id)initWithTitle:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isInMyContactList { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isQQContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)jumpToContentViewController:(id)arg1 { %log; %orig; }
- (void)setM_bPopToRootWhenDelete:(_Bool )m_bPopToRootWhenDelete { %log; %orig; }
- (_Bool )m_bPopToRootWhenDelete { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_chatContact:(CContact *)m_chatContact { %log; %orig; }
- (CContact *)m_chatContact { %log; CContact * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_contact:(CContact *)m_contact { %log; %orig; }
- (CContact *)m_contact { %log; CContact * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsLocation:(NSString *)m_nsLocation { %log; %orig; }
- (NSString *)m_nsLocation { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_popToViewControllerClassWhenDelete:(Class )m_popToViewControllerClassWhenDelete { %log; %orig; }
- (Class )m_popToViewControllerClassWhenDelete { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_qrCodeAddFriendScene:(int )m_qrCodeAddFriendScene { %log; %orig; }
- (int )m_qrCodeAddFriendScene { %log; int  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_searchScene:(int )m_searchScene { %log; %orig; }
- (int )m_searchScene { %log; int  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_uiAddFriendStatScene:(int )m_uiAddFriendStatScene { %log; %orig; }
- (int )m_uiAddFriendStatScene { %log; int  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_uiFromScene:(unsigned int )m_uiFromScene { %log; %orig; }
- (unsigned int )m_uiFromScene { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiVerify:(unsigned int )m_uiVerify { %log; %orig; }
- (unsigned int )m_uiVerify { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_userData:(id )m_userData { %log; %orig; }
- (id )m_userData { %log; id  r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)onAddToContact { %log; %orig; }
- (void)onDeleteContact:(id)arg1 { %log; %orig; }
- (void)onExpose { %log; %orig; }
- (_Bool)onFilterSendReceiver:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)onFriendRequestSend { %log; %orig; }
- (void)onModifyContact:(id)arg1 { %log; %orig; }
- (void)onNewMessage:(id)arg1 { %log; %orig; }
- (void)onNewMessageWithPushOnTop:(id)arg1 { %log; %orig; }
- (void)onPopViewController:(_Bool)arg1 { %log; %orig; }
- (void)onProfileChange { %log; %orig; }
- (void)onRemoveContact { %log; %orig; }
- (void)onSayHello { %log; %orig; }
- (void)onSayHelloViewSendSayHello:(id)arg1 { %log; %orig; }
- (void)onSendVerifyMsg { %log; %orig; }
- (void)onShareMyFriend { %log; %orig; }
- (void)onStrangerContactUpdated:(id)arg1 { %log; %orig; }
- (void)onTalk:(id)arg1 { %log; %orig; }
- (void)onVerifyOK { %log; %orig; }
- (void)onVerifyOKWithContact:(id)arg1 { %log; %orig; }
- (void)onWCGroupAddMemberReturn:(_Bool)arg1 group:(id)arg2 { %log; %orig; }
- (void)onWCGroupModMemberReturn:(_Bool)arg1 group:(id)arg2 { %log; %orig; }
- (void)onWCGroupRemoveMemberReturn:(_Bool)arg1 group:(id)arg2 { %log; %orig; }
- (void)reloadContactAssist { %log; %orig; }
- (void)reloadData { %log; %orig; }
- (void)reloadFloatView { %log; %orig; }
- (void)reloadView { %log; %orig; }
- (void)setReportInfo:(NSString *)reportInfo { %log; %orig; }
- (NSString *)reportInfo { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setSearchExtraParamsString:(NSString *)searchExtraParamsString { %log; %orig; }
- (NSString *)searchExtraParamsString { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setSearchFromIndex:(unsigned int )searchFromIndex { %log; %orig; }
- (unsigned int )searchFromIndex { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setSearchId:(NSString *)searchId { %log; %orig; }
- (NSString *)searchId { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setSearchKeyword:(NSString *)searchKeyword { %log; %orig; }
- (NSString *)searchKeyword { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setVerifyUserInfoList:(NSMutableDictionary *)verifyUserInfoList { %log; %orig; }
- (NSMutableDictionary *)verifyUserInfoList { %log; NSMutableDictionary * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)startLoadingWithText:(id)arg1 { %log; %orig; }
- (void)statBanner { %log; %orig; }
- (void)stopLoadingWithFailText:(id)arg1 { %log; %orig; }
- (void)stopLoadingWithOKText:(id)arg1 { %log; %orig; }
- (id)tagForActivePage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)tagForCurrentPage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)updateContactFromServer { %log; %orig; }
- (void)viewDidAppear:(_Bool)arg1 { %log; %orig; }
- (void)viewDidDisappear:(_Bool)arg1 { %log; %orig; }
- (void)viewDidLayoutSubviews { %log; %orig; }
- (void)viewDidLoad { %log; %orig; }
- (void)viewWillAppear:(_Bool)arg1 { %log; %orig; }
- (void)viewWillBePoped:(_Bool)arg1 { %log; %orig; }
- (void)viewWillDisappear:(_Bool)arg1 { %log; %orig; }
- (void)viewWillLayoutSubviews { %log; %orig; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end





%hook SendVerifyMsgViewController
- (void)contactVerifyOk:(id)arg1 opCode:(unsigned int)arg2 
{ 
	%log;
	NSLog(@"what this?---%@",[arg1 class]);	
	CVerifyContactWrap *vWrap = (CVerifyContactWrap *)[arg1 firstObject];
	NSLog(@"content---%@",[arg1 firstObject]);
	NSLog(@"the details---%@,%@,%@,%@,%@,%@,%@", vWrap.m_nsUsrName, vWrap.m_nsOriginalUsrName, vWrap.m_nsTicket, vWrap.m_oVerifyContact, vWrap.m_nsSourceUserName, vWrap.m_nsSourceNickName, vWrap.m_nsChatRoomUserName);
	NSLog(@"--%zd,%zd", vWrap.m_uiScene, vWrap.m_uiWCFlag);
	%orig; 
}





- (void)dealloc { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_oChatContact:(CContact *)m_oChatContact { %log; %orig; }
- (CContact *)m_oChatContact { %log; CContact * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_oVerifyContact:(CContact *)m_oVerifyContact { %log; %orig; }
- (CContact *)m_oVerifyContact { %log; CContact * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_qrCodeAddFriendScene:(int )m_qrCodeAddFriendScene { %log; %orig; }
- (int )m_qrCodeAddFriendScene { %log; int  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (long long)numberOfSectionsInTableView:(id)arg1 { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (void)onCancel { %log; %orig; }
- (void)onContactVerifyFail { %log; %orig; }
- (void)onHideKeyBoard { %log; %orig; }
- (void)onReturn { %log; %orig; }
- (void)onSendVerifyMsg { %log; %orig; }
- (void)scrollViewDidScroll:(id)arg1 { %log; %orig; }
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (double)tableView:(id)arg1 heightForFooterInSection:(long long)arg2 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (double)tableView:(id)arg1 heightForHeaderInSection:(long long)arg2 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (long long)tableView:(id)arg1 numberOfRowsInSection:(long long)arg2 { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (id)tableView:(id)arg1 titleForHeaderInSection:(long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)tableView:(id)arg1 viewForHeaderInSection:(long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)textField:(id)arg1 shouldChangeCharactersInRange:(struct _NSRange)arg2 replacementString:(id)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)textFieldShouldReturn:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)updateWordCount:(id)arg1 { %log; %orig; }
- (void)viewDidLayoutSubviews { %log; %orig; }
- (void)viewDidLoad { %log; %orig; }
- (void)viewWillDisappear:(_Bool)arg1 { %log; %orig; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end





%hook CContact
+ (void)HandleChatMemUsrImg:(struct tagMMModChatRoomMember *)arg1 Contatct:(id)arg2 DocPath:(id)arg3 { %log; %orig; }
+ (void)HandleUsrImg:(struct tagMMModContact *)arg1 Contatct:(id)arg2 DocPath:(id)arg3 { %log; %orig; }
+ (void)HandleUsrImgPB:(id)arg1 Contatct:(id)arg2 DocPath:(id)arg3 { %log; %orig; }
+ (id)SubscriptedBrandsFromString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)genChatRoomName:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)genChatRoomName:(id)arg1 appendTail:(_Bool)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)getChatRoomMember:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (unsigned long long)getChatRoomMemberCount:(id)arg1 { %log; unsigned long long r = %orig; HBLogDebug(@" = %llu", r); return r; }
+ (id)getChatRoomMemberUserName:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)getChatRoomMemberWithoutMyself:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)getMicroBlogUsrDisplayName:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (void)initialize { %log; %orig; }
+ (_Bool)isHeadImgUpdated:(id)arg1 Local:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isWeAppUserName:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (id)parseContactKey:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)IsAddFromLbs { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)IsAddFromShake { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)IsUserInChatRoom:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setAppBrandInfo:(CAppBrandInfo *)appBrandInfo { %log; %orig; }
- (CAppBrandInfo *)appBrandInfo { %log; CAppBrandInfo * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)bizMenuInfoFromContact { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)brandPrivileges { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)brandUrls { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)canSupportMessageNotify { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (long long)compareForFavourGroup:(id)arg1 { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (_Bool)containKFWorkerInfo { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)copyFieldFromContact:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)copyPatialFieldFromContact:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)encodeWithCoder:(id)arg1 { %log; %orig; }
- (id)externalInfoJSONCache { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)genContactFromShareCardMsgWrap:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)genContactFromShareCardMsgWrapContent:(id)arg1 { %log; %orig; }
- (id)getAppBrandInfo { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getAppID { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (long long)getAudioPlayType { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (id)getBrandBusinessScope { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (int)getBrandContactType { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getBrandEvaluateCount { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBrandMerchantRatings { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBrandMerchantSecurity { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBrandMerchantSecurityUrl { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBrandProfileBindWeAppList { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBrandRegisterSourceBody { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBrandRegisterSourceIntroUrl { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBrandTrademarkName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBrandTrademarkUrl { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBrandVerifySourceDescription { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBrandVerifySourceIntroUrl { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBrandVerifySourceName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned int)getBrandVerifySourceType { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (id)getBrandVerifySubTitle { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getChatRoomMemberDisplayName:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getChatRoomMemberNickName:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getChatRoomMembrGroupNickName:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned int)getConferenceContactExpireTime { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (id)getConferenceVerifyButtonTitle { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getConferenceVerifyPromptTitle { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (long long)getConnectorMsgType { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (id)getCustomizeMenu { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getEnterpriseBrandFrozenWording { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getEnterpriseMainBrandUserName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getEnterpriseSubBrandChatExtUrl { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned int)getEnterpriseSubBrandChildType { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (id)getEnterpriseSubBrandUrl { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getExternalInfoDictionary { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned int)getFunctionFlag { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (long long)getInteractiveMode { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (_Bool)getIsTrademarkProtection { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getLabelIDList { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getMainPageUrl { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getMobileDisplayName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getMobileList { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getMobileNumString { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getNearFieldDesc { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getNewChatroomData { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getNormalContactDisplayDesc { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (long long)getReportLocationType { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (long long)getScanQRCodeType { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (id)getSpecifyWorkerOpenID { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getSupportEmoticonLinkPrefix { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getValueTypeTable { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (long long)getWeAppBizWxaOpenFlag { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (_Bool)hasMatchHashPhone { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)initWithCoder:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)initWithModContact:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)initWithShareCardMsgWrap:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)initWithShareCardMsgWrapContent:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isAccountDeleted { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isAdmin { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isAppBrandInfoValid { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isBlockWeAppSessionMessage { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isBlockWeAppTemplateMessage { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isBrandContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isChatStatusNotifyOpen { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isChatroomNeedAccessVerify { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isContactCanReceiveSpeexVoice { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isContactFrozen { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isContactSessionTop { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isContactTypeShouldDelete { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isEnterpriseBrand { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isEnterpriseChatSubBrand { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isEnterpriseDisableBrand { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isEnterpriseMainBrand { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isEnterpriseSubBrand { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isEnterpriseWebSubBrand { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHardDeviceBrand { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHardDeviceHideSubtitle { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHardDeviceTestBrand { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHasMobile { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHasWeiDian { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHolderContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isIgnoreBrandContat { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isInternalMyDeviceBrand { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isInternalSportBrand { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isLocalizedContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isMyContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isOpenMainPage { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isShowChatRoomDisplayName { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isShowHeadImgInMsg { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isShowLinkedIn { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isShowToolBarInMsg { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isSupportPublicWifi { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isVerified { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isVerifiedBrandContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isWeAppContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isWeChatPluginWeApp { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_ChatRoomData:(ChatRoomData *)m_ChatRoomData { %log; %orig; }
- (ChatRoomData *)m_ChatRoomData { %log; ChatRoomData * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_ChatRoomDetail:(ChatRoomDetail *)m_ChatRoomDetail { %log; %orig; }
- (ChatRoomDetail *)m_ChatRoomDetail { %log; ChatRoomDetail * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_arrPhoneItem:(NSArray *)m_arrPhoneItem { %log; %orig; }
- (NSArray *)m_arrPhoneItem { %log; NSArray * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_bFromNewDB:(_Bool )m_bFromNewDB { %log; %orig; }
- (_Bool )m_bFromNewDB { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (NSDictionary *)m_dicWeiDianInfo { %log; NSDictionary * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_iWCFlag:(int )m_iWCFlag { %log; %orig; }
- (int )m_iWCFlag { %log; int  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_isExtInfoValid:(_Bool )m_isExtInfoValid { %log; %orig; }
- (_Bool )m_isExtInfoValid { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_isShowRedDot:(_Bool )m_isShowRedDot { %log; %orig; }
- (_Bool )m_isShowRedDot { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_nsBrandIconUrl:(NSString *)m_nsBrandIconUrl { %log; %orig; }
- (NSString *)m_nsBrandIconUrl { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsBrandSubscriptConfigUrl:(NSString *)m_nsBrandSubscriptConfigUrl { %log; %orig; }
- (NSString *)m_nsBrandSubscriptConfigUrl { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsCardUrl:(NSString *)m_nsCardUrl { %log; %orig; }
- (NSString *)m_nsCardUrl { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsCertificationInfo:(NSString *)m_nsCertificationInfo { %log; %orig; }
- (NSString *)m_nsCertificationInfo { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsChatRoomData:(NSString *)m_nsChatRoomData { %log; %orig; }
- (NSString *)m_nsChatRoomData { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsChatRoomMemList:(NSString *)m_nsChatRoomMemList { %log; %orig; }
- (NSString *)m_nsChatRoomMemList { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsCity:(NSString *)m_nsCity { %log; %orig; }
- (NSString *)m_nsCity { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsCountry:(NSString *)m_nsCountry { %log; %orig; }
- (NSString *)m_nsCountry { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsDescription:(NSString *)m_nsDescription { %log; %orig; }
- (NSString *)m_nsDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsExternalInfo:(NSString *)m_nsExternalInfo { %log; %orig; }
- (NSString *)m_nsExternalInfo { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsFBID:(NSString *)m_nsFBID { %log; %orig; }
- (NSString *)m_nsFBID { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsFBNickName:(NSString *)m_nsFBNickName { %log; %orig; }
- (NSString *)m_nsFBNickName { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsLabelIDList:(NSString *)m_nsLabelIDList { %log; %orig; }
- (NSString *)m_nsLabelIDList { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsLinkedInID:(NSString *)m_nsLinkedInID { %log; %orig; }
- (NSString *)m_nsLinkedInID { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsLinkedInName:(NSString *)m_nsLinkedInName { %log; %orig; }
- (NSString *)m_nsLinkedInName { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsLinkedInPublicUrl:(NSString *)m_nsLinkedInPublicUrl { %log; %orig; }
- (NSString *)m_nsLinkedInPublicUrl { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsMobileFullHash:(NSString *)m_nsMobileFullHash { %log; %orig; }
- (NSString *)m_nsMobileFullHash { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsMobileHash:(NSString *)m_nsMobileHash { %log; %orig; }
- (NSString *)m_nsMobileHash { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsOwner:(NSString *)m_nsOwner { %log; %orig; }
- (NSString *)m_nsOwner { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsProvince:(NSString *)m_nsProvince { %log; %orig; }
- (NSString *)m_nsProvince { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsSignature:(NSString *)m_nsSignature { %log; %orig; }
- (NSString *)m_nsSignature { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsWCBGImgObjectID:(NSString *)m_nsWCBGImgObjectID { %log; %orig; }
- (NSString *)m_nsWCBGImgObjectID { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsWeiDianInfo:(NSString *)m_nsWeiDianInfo { %log; %orig; }
- (NSString *)m_nsWeiDianInfo { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsWorkID:(NSString *)m_nsWorkID { %log; %orig; }
- (NSString *)m_nsWorkID { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_pcWCBGImgID:(NSString *)m_pcWCBGImgID { %log; %orig; }
- (NSString *)m_pcWCBGImgID { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_subBrandInfo:(SubscriptBrandInfo *)m_subBrandInfo { %log; %orig; }
- (SubscriptBrandInfo *)m_subBrandInfo { %log; SubscriptBrandInfo * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_uiBrandSubscriptionSettings:(unsigned int )m_uiBrandSubscriptionSettings { %log; %orig; }
- (unsigned int )m_uiBrandSubscriptionSettings { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiCertificationFlag:(unsigned int )m_uiCertificationFlag { %log; %orig; }
- (unsigned int )m_uiCertificationFlag { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiChatRoomAccessType:(unsigned int )m_uiChatRoomAccessType { %log; %orig; }
- (unsigned int )m_uiChatRoomAccessType { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiChatRoomMaxCount:(unsigned int )m_uiChatRoomMaxCount { %log; %orig; }
- (unsigned int )m_uiChatRoomMaxCount { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiChatRoomStatus:(unsigned int )m_uiChatRoomStatus { %log; %orig; }
- (unsigned int )m_uiChatRoomStatus { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiChatRoomVersion:(unsigned int )m_uiChatRoomVersion { %log; %orig; }
- (unsigned int )m_uiChatRoomVersion { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiDebugModeType:(unsigned int )m_uiDebugModeType { %log; %orig; }
- (unsigned int )m_uiDebugModeType { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiDeleteFlag:(unsigned int )m_uiDeleteFlag { %log; %orig; }
- (unsigned int )m_uiDeleteFlag { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiLastUpdate:(unsigned int )m_uiLastUpdate { %log; %orig; }
- (unsigned int )m_uiLastUpdate { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiMetaFlag:(unsigned int )m_uiMetaFlag { %log; %orig; }
- (unsigned int )m_uiMetaFlag { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiNeedUpdate:(unsigned int )m_uiNeedUpdate { %log; %orig; }
- (unsigned int )m_uiNeedUpdate { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uiWxAppOpt:(unsigned int )m_uiWxAppOpt { %log; %orig; }
- (unsigned int )m_uiWxAppOpt { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (_Bool)needShowUnreadCountOnSession { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setChatRoomDataWithoutEmojiChange:(id)arg1 { %log; %orig; }
- (void)setChatStatusNotifyOpen:(_Bool)arg1 { %log; %orig; }
- (void)setExternalInfoJSONCache:(id)arg1 { %log; %orig; }
- (void)setSignatureWithoutEmojiChange:(id)arg1 { %log; %orig; }
- (void)setUiLastUpdateAppVersionInfoTime:(unsigned int )uiLastUpdateAppVersionInfoTime { %log; %orig; }
- (unsigned int )uiLastUpdateAppVersionInfoTime { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)tryLoadExtInfo { %log; %orig; }
- (void)updateWithBizAttrChanged:(id)arg1 { %log; %orig; }
- (id)xmlForMessageWrapContent { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end




%hook CContactMgr
- (_Bool)ChangeNotifyStatus:(id)arg1 withStatus:(_Bool)arg2 sync:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)ChangeNotifyStatusForChatRoom:(id)arg1 withStatus:(_Bool)arg2 sync:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)HandleMemContact:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)MainThread_ReloadMemContact:(id)arg1 { %log; %orig; }
- (void)MessageReturn:(id)arg1 Event:(unsigned int)arg2 { %log; %orig; }
- (void)MessageReturn:(unsigned int)arg1 MessageInfo:(id)arg2 Event:(unsigned int)arg3 { %log; %orig; }
- (_Bool)ModifyNotifyStatus:(id)arg1 withStatus:(unsigned int)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)RemoveContactFromChatList:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)SetFriendMetaFlag:(unsigned int)arg1 ForUser:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)SetLastUpdateTime:(unsigned int)arg1 ForUser:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)addAddHardcodeContact:(id)arg1 selector:(SEL)arg2 { %log; %orig; }
- (_Bool)addContact:(id)arg1 listType:(unsigned int)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)addContact:(id)arg1 listType:(unsigned int)arg2 opLog:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)addContactInternal:(id)arg1 { %log; %orig; }
- (_Bool)addContactToDb:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)addDictoryDataToCache:(id)arg1 listType:(unsigned int)arg2 { %log; %orig; }
- (_Bool)addFromMobileContact:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)addFromQQContact:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)addHardCodeContacts { %log; %orig; }
- (_Bool)addLocalContact:(id)arg1 listType:(unsigned int)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)addOrUpdateContactToDB:(id)arg1 listType:(unsigned int)arg2 add:(_Bool *)arg3 modify:(_Bool *)arg4 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)addSelfContactToCache { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)addToGetContactMap:(id)arg1 { %log; %orig; }
- (int)autoreloadContacts:(unsigned int)arg1 { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
- (int)autoreloadContacts:(unsigned int)arg1 needLoadExt:(_Bool)arg2 { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)callModifyContactForCPState:(id)arg1 { %log; %orig; }
- (void)callOnDeleteExt:(id)arg1 { %log; %orig; }
- (void)callOnModifyContactHeadImageExt:(id)arg1 { %log; %orig; }
- (void)callOnModifyExt:(id)arg1 { %log; %orig; }
- (void)callOnRemoveContactFromAddressBook:(id)arg1 { %log; %orig; }
- (_Bool)checkIfForbiddenGetContact:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)clearDraftForContact:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)dealloc { %log; %orig; }
- (_Bool)delayLoadAllContactInBackGround { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)deleteContact:(id)arg1 listType:(unsigned int)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)deleteContact:(id)arg1 listType:(unsigned int)arg2 andScene:(unsigned int)arg3 sync:(_Bool)arg4 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)deleteContact:(id)arg1 listType:(unsigned int)arg2 andScene:(unsigned int)arg3 sync:(_Bool)arg4 local:(_Bool)arg5 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)deleteContact:(id)arg1 listType:(unsigned int)arg2 sync:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)deleteContactLocal:(id)arg1 listType:(unsigned int)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)fixContactPluginOldData { %log; %orig; }
- (id)generateOfficialContact:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)generatePluginContact:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)generatePluginContact:(id)arg1 uiType:(unsigned int)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)generatePluginContactNoListContact:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getAllBrandContacts { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)getAllContactList:(id)arg1 listType:(unsigned int)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)getAllContactNoExtInfoList:(id)arg1 listType:(unsigned int)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getAllContactUserName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getAllEnterpriseMainBrandContacts { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)getAllRemarkList:(id)arg1 listType:(unsigned int)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)getAllUserName:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getContactByName:(id)arg1 { %log; id r = %orig; HBLogDebug(@" getdevaluewhere?= %@", r); return r; }
- (id)getContactByNameFromCache:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getContactByNameFromDB:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getContactForSearchByName:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getContactFromDB:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getContactFromDic:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getContactList:(unsigned int)arg1 contactType:(unsigned int)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getContactList:(unsigned int)arg1 contactType:(unsigned int)arg2 needLoadExt:(_Bool)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)getContactsFromServer:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)getContactsFromServer:(id)arg1 chatContact:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)getContactsFromServer:(id)arg1 chatContact:(id)arg2 withScene:(int)arg3 withTicket:(id)arg4 usrData:(id)arg5 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)getContactsFromSvrForTempChat:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getGroupCardMemberList:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)getInviteeContactsFromServer:(id)arg1 withTicket:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getSelfContact { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)handleLocalField:(id)arg1 oldContact:(id)arg2 { %log; %orig; }
- (void)handleOfficalContactName:(id)arg1 { %log; %orig; }
- (void)handleWeChatTeamNickName:(id)arg1 { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)initDB:(id)arg1 { %log; %orig; }
- (void)initListen { %log; %orig; }
- (int)interalReloadContacts:(unsigned int)arg1 needLoadExt:(_Bool)arg2 { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)internalDeleteContact:(id)arg1 { %log; %orig; }
- (_Bool)internalGetContactsFromSvr:(id)arg1 chatContact:(id)arg2 usrData:(id)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)internalModifyContact:(id)arg1 { %log; %orig; }
- (void)internalNewContact:(id)arg1 { %log; %orig; }
- (void)internalUpdateContactLocalDataWithUserName:(id)arg1 { %log; %orig; }
- (_Bool)isBelongToMMContactInCache:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isCacheAllLoaded { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isContactBlack:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isContactExistLocal:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isContactMatch:(id)arg1 listType:(unsigned int)arg2 contactType:(unsigned int)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHardCodeContact:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isHeadImgUpdated:(id)arg1 Local:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isInContactList:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isOpenStrangerCache { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isUserNewDB { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)loadContactExtInfo:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)main_onPushAddContact:(id)arg1 { %log; %orig; }
- (void)main_onPushBatchModContact:(id)arg1 { %log; %orig; }
- (void)main_onPushDeleteContact:(id)arg1 { %log; %orig; }
- (void)main_onPushModifyContact:(id)arg1 { %log; %orig; }
- (void)mergeChatRoomData:(id)arg1 oldContact:(id)arg2 { %log; %orig; }
- (_Bool)migrationContacts:(unsigned int)arg1 first:(_Bool)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)modifyContactNickName:(id)arg1 nickName:(id)arg2 callMod:(_Bool)arg3 { %log; %orig; }
- (void)onBrandContactModified:(id)arg1 withAttrChanged:(id)arg2 { %log; %orig; }
- (void)onGetContact:(id)arg1 { %log; %orig; }
- (void)onLanguageChange { %log; %orig; }
- (void)onPushDeleteContact:(id)arg1 { %log; %orig; }
- (void)onPushModifyContact:(id)arg1 updateImage:(_Bool)arg2 { %log; %orig; }
- (void)onServiceClearData { %log; %orig; }
- (_Bool)onServiceMemoryWarning { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)onServiceReloadData { %log; %orig; }
- (void)onSettingChange { %log; %orig; }
- (void)refreshContactLocalData { %log; %orig; }
- (void)refreshPluginNickName:(_Bool)arg1 { %log; %orig; }
- (void)reloadContact:(id)arg1 { %log; %orig; }
- (id)reloadContact:(id)arg1 mergeImage:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)reloadContactImageStatus:(id)arg1 Status:(id)arg2 Image:(id)arg3 { %log; %orig; }
- (_Bool)removeContactFromDB:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)removeContactFromDic:(id)arg1 { %log; %orig; }
- (void)removeListen { %log; %orig; }
- (void)reportIDKey:(id)arg1 stranger:(id)arg2 { %log; %orig; }
- (void)reportMigrationStat:(unsigned int)arg1 status:(unsigned int)arg2 { %log; %orig; }
- (_Bool)setBlack:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setBlack:(id)arg1 blackFlag:(_Bool)arg2 sync:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setBlack:(id)arg1 sync:(_Bool)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 RoomDetail:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 WeRunBlack:(_Bool)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 antispamTicket:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 cardDesc:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 cardUrl:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 chatRoomAccessType:(unsigned int)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 chatRoomData:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 chatState:(unsigned int)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 favour:(_Bool)arg2 sync:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 googleContactName:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 googleContactNickName:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 hideHashPhone:(_Bool)arg2 sync:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 mobileIdentify:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 nickName:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 notifyOpen:(_Bool)arg2 sync:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 owner:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 remark:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 remark:(id)arg2 hideHashPhone:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 sessionTop:(_Bool)arg2 sync:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 snsBlack:(_Bool)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 textTranslateOpen:(_Bool)arg2 sync:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 typeBit:(unsigned int)arg2 set:(_Bool)arg3 sync:(_Bool)arg4 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 typeBit:(unsigned int)arg2 set:(_Bool)arg3 sync:(_Bool)arg4 localSet:(_Bool)arg5 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setContact:(id)arg1 watchContact:(_Bool)arg2 sync:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setContactToDic:(id)arg1 forKey:(id)arg2 { %log; %orig; }
- (_Bool)setHDHeadUpdated:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setLocalContact:(id)arg1 notifyOpen:(_Bool)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setLocalContactToUntopSession:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setMigrationFinished { %log; %orig; }
- (_Bool)setNoBlack:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setNoBlack:(id)arg1 sync:(_Bool)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)setPhone:(id)arg1 Contact:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setSelfContactUpdated { %log; %orig; }
- (_Bool)shouldUpdateContact:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)splist_migrationContactList:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)syncAllSXContact { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)thread_BatchModifyContact:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)thread_BatchModifyContact:(id)arg1 isInit:(_Bool)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)thread_HandleMemContact:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)thread_ReloadMemConact:(id)arg1 ChatRoom:(id)arg2 { %log; %orig; }
- (id)thread_onBatchModifyChatRoomMember:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)thread_onPushModifyContact:(id)arg1 isInit:(_Bool)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)thread_onpushBatchModContact:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)thread_saveContactImageStatus:(id)arg1 Status:(id)arg2 Image:(id)arg3 Url:(id)arg4 { %log; %orig; }
- (void)tryLoadExtInfoForContact:(id)arg1 { %log; %orig; }
- (void)updateCache:(id)arg1 { %log; %orig; }
- (void)updateContactLocalData { %log; %orig; }
- (_Bool)updateContactToCache:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)updateContactToDb:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)updateNewDB:(id)arg1 NewUser:(_Bool)arg2 { %log; %orig; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end*/


%hook FindContactSearchViewCellInfo
- (void)MessageReturn:(id)arg1 Event:(unsigned int)arg2 { %log; %orig; }
- (void)SearchBarBecomeActive { %log; %orig; }
- (void)SearchBarBecomeUnActive { %log; %orig; }
- (void)addFriendScene:(id)arg1 { %log; %orig; }
- (void)addToContactsFromContactInfo:(id)arg1 { %log; %orig; }
- (_Bool)allTextIsBlank { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setBHasOperateOnlineResult:(_Bool )bHasOperateOnlineResult { %log; %orig; }
- (_Bool )bHasOperateOnlineResult { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setBHasShownWebSearchCell:(_Bool )bHasShownWebSearchCell { %log; %orig; }
- (_Bool )bHasShownWebSearchCell { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setBShowNoResult:(_Bool )bShowNoResult { %log; %orig; }
- (_Bool )bShowNoResult { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)becomeFirstResponder { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)cancelSearch { %log; %orig; }
- (id)cellForIndex:(id)arg1 ForSearchViewTable:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)dealloc { %log; %orig; }
- (void)setDidSearchContactDone:(_Bool )didSearchContactDone { %log; %orig; }
- (_Bool )didSearchContactDone { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)didSearchViewTableSelect:(id)arg1 { %log; %orig; }
- (void)doSearch { %log; %orig; }
- (void)doSearch:(id)arg1 Pre:(_Bool)arg2 { %log; %orig; }
- (void)do_LogExt:(int)arg1 { %log; %orig; }
- (void)endSearch { %log; %orig; }
- (id)filterUserName:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setFoundContact:(CContact *)foundContact { %log; %orig; }
- (CContact *)foundContact { %log; CContact * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getAddressBookPersonImage:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getSearchBarText { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)handleRotate { %log; %orig; }
- (double)heightForHeaderInSection:(long long)arg1 ForSearchViewTable:(id)arg2 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (double)heightForSearchViewTable:(id)arg1 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (void)hideDimmingView { %log; %orig; }
- (id)initWithContentController:(id)arg1 backGroundView:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isBestGuessPhoneNumber:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isObj:(id)arg1 match:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setIsSearching:(_Bool )isSearching { %log; %orig; }
- (_Bool )isSearching { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isValidLocalQuery:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)layoutViews { %log; %orig; }
- (void)logWebSearchClickByKeyword:(id)arg1 clickType:(unsigned int)arg2 { %log; %orig; }
- (void)setM_nsUserNameToFind:(NSString *)m_nsUserNameToFind { %log; %orig; }
- (NSString *)m_nsUserNameToFind { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_userNameTextField:(UITextField *)m_userNameTextField { %log; %orig; }
- (UITextField *)m_userNameTextField { %log; UITextField * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)makeCell:(id)arg1 { %log; %orig; }
- (id)makeEntryCell:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)mmSearchDisplayControllerDidBeginSearch { %log; %orig; }
- (void)mmSearchDisplayControllerDidHideSearchResultsTableView:(id)arg1 { %log; %orig; }
- (void)mmSearchDisplayControllerWillBeginSearch { %log; %orig; }
- (void)mmSearchDisplayControllerWillEndSearch { %log; %orig; }
- (void)mmSearchDisplayControllerWillShowSearchResultsTableView:(id)arg1 { %log; %orig; }
- (void)mmsearchBarCancelButtonClicked:(id)arg1 { %log; %orig; }
- (void)mmsearchBarSearchButtonClicked:(id)arg1 { %log; %orig; }
- (void)newMessageFromContactInfo:(id)arg1 { %log; %orig; }
- (void)setNonResultLabel:(MMUILabel *)nonResultLabel { %log; %orig; }
- (MMUILabel *)nonResultLabel { %log; MMUILabel * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (long long)numberOfRowsInSection:(long long)arg1 ForSearchViewTable:(id)arg2 { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (long long)numberOfSectionsForSearchViewTable:(id)arg1 { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (void)onGetNonResult { %log; %orig; }
- (void)onGetSearchContactRet:(id)arg1 req:(id)arg2 
{ 
	%log; 
	%orig; 
	SearchContactResponse *res = (SearchContactResponse *)arg1;
	SearchContactRequest *req = (SearchContactRequest *)arg2;
	NSLog(@"responder data----%@,%zd,%zd,%@, %@,%@", res.albumBgimgId,res.albumFlag,res.albumStyle,res.alias,res.antispamTicket,res.baseResponse);

	NSLog(@"request data----%@,%zd,%zd,%@,%zd,%@", req.baseRequest,req.fromScene,req.opCode,req.reqBuf,req.searchScene,req.userName);
	NSLog(@"setM_nsLinkedInName----%zd,%@,%@,%zd,%@,%zd",req.baseRequest.clientVersion,req.baseRequest.deviceId,req.baseRequest.deviceType,req.baseRequest.scene,req.baseRequest.sessionKey,req.baseRequest);
	NSLog(@"stringent-----%@",req.userName.string);

	
}

- (void)onGetSearchDetailPageResponse:(id)arg1 eventID:(unsigned int)arg2 { %log; %orig; }
- (void)onSearch:(id)arg1 { %log; %orig; }
- (void)onSearchResultViewNeedPushViewController:(id)arg1 { %log; %orig; }
- (void)onSearchResultViewNeedReload { %log; %orig; }
- (void)onSearchResultViewNeedStartWebSearch { %log; %orig; }
- (void)onTestCrash { %log; %orig; }
- (void)onWebSearchViewDidPop { %log; %orig; }
- (void)onWebSearchViewDidShow { %log; %orig; }
- (void)onWebSearchViewReturn:(_Bool)arg1 { %log; %orig; }
- (void)onWebSearchViewWillPop { %log; %orig; }
- (void)openContactInfoViewForGoogle:(id)arg1 { %log; %orig; }
- (void)openContactInfoViewForPhone:(id)arg1 { %log; %orig; }
- (void)removeNoResultLabelWhenSearching { %log; %orig; }
- (void)removeWebSearchView { %log; %orig; }
- (_Bool)resignFirstResponder { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setSearchContactDataProvider:(SearchContactDataProvider *)searchContactDataProvider { %log; %orig; }
- (SearchContactDataProvider *)searchContactDataProvider { %log; SearchContactDataProvider * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setSearchContactState:(unsigned long long )searchContactState { %log; %orig; }
- (unsigned long long )searchContactState { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (_Bool)searchKeyMatchesCommand:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)sendBrandContactListRequest { %log; %orig; }
- (void)setSearchDisplayControllerContainerViewIn:(id)arg1 hidden:(_Bool)arg2 { %log; %orig; }
- (void)setWebSearchLogicController:(FTSWebSearchController *)webSearchLogicController { %log; %orig; }
- (FTSWebSearchController *)webSearchLogicController { %log; FTSWebSearchController * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)showContactInfoView:(id)arg1 { %log; %orig; }
- (void)showContactListInfoView:(id)arg1 { %log; %orig; }
- (void)showWebSearchEntryWithSrvErrMsg:(id)arg1 { %log; %orig; }
- (void)startLoading { %log; %orig; }
- (void)stopLoading { %log; %orig; }
- (id)titleForHeaderInSection:(long long)arg1 ForSearchViewTable:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)viewForHeaderInSection:(long long)arg1 ForSearchViewTable:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end

%hook MMSearchBar
- (_Bool)searchBar:(id)arg1 shouldChangeTextInRange:(struct _NSRange)arg2 replacementText:(id)arg3 {
	%log;
	return YES;
}
%end









