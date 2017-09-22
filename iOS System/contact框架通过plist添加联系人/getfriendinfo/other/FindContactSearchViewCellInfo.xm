#import "GetFirendInfo.h"


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
	NSLog(@"baserRequest----%zd,%@,%@,%zd,%@,%zd",req.baseRequest.clientVersion,req.baseRequest.deviceId,req.baseRequest.deviceType,req.baseRequest.scene,req.baseRequest.sessionKey,req.baseRequest.uin);
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
