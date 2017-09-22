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
- (id)getContactByName:(id)arg1
 {
 	%log; 
	id r = %orig; 
	CContact *con = (CContact *)r;
	HBLogDebug(@" mgrvalue= %@-----%@", con,con.m_nsCity); 
	return r; 
}

- (id)getContactByNameFromCache:(id)arg1 
{ %log; id r = %orig; 	CContact *con = (CContact *)r;
	HBLogDebug(@" mgrvalue= %@-----%@", con,con.m_nsCity);  return r; }

- (id)getContactByNameFromDB:(id)arg1 
{ %log; id r = %orig; 	CContact *con = (CContact *)r;
	HBLogDebug(@" mgrvalue= %@-----%@", con,con.m_nsCity);  return r; }

- (id)getContactForSearchByName:(id)arg1 
{ %log; id r = %orig; 	CContact *con = (CContact *)r;
	HBLogDebug(@" mgrvalue= %@-----%@", con,con.m_nsCity); return r; }

- (id)getContactFromDB:(id)arg1 
{ %log; id r = %orig; 	CContact *con = (CContact *)r;
	HBLogDebug(@" mgrvalue= %@-----%@", con,con.m_nsCity);  return r; }

- (id)getContactFromDic:(id)arg1
 { %log; id r = %orig; 	CContact *con = (CContact *)r;
	HBLogDebug(@" mgrvalue= %@-----%@", con,con.m_nsCity);  return r; }

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
%end
