%hook WCAccountFillPhoneViewController
- (void)CountryCodePickerDidPickCountryCode:(id)arg1 
{ %log; 
NSLog(@"--asd-%@",[arg1 class]c);
%orig; }
- (void)WCBaseInfoItemEditChanged:(id)arg1 { %log; %orig; }
- (void)WCBaseInfoItemPressReturnKey:(id)arg1 { %log; %orig; }
- (void)checkNextBtnEnable { %log; %orig; }
- (id)createBottomBtn:(id)arg1 target:(id)arg2 sel:(SEL)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)dealloc { %log; %orig; }
- (void)fillCountryCode:(id)arg1 phoneNum:(id)arg2 { %log; %orig; }
- (void)findCountryCode { %log; %orig; }
- (id)getArchive { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)hideKeyBoard { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)initNavigationBar { %log; %orig; }
- (void)initTableView { %log; %orig; }
- (void)setM_bAgreementMobileCanBeFound:(_Bool )m_bAgreementMobileCanBeFound { %log; %orig; }
- (_Bool )m_bAgreementMobileCanBeFound { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)onByPhonePwdLoginByVerifyCode { %log; %orig; }
- (void)onLinkClicked:(id)arg1 withRect:(struct CGRect)arg2 { %log; %orig; }
- (void)onMobileCanBeFoundAgreementClick:(id)arg1 { %log; %orig; }
- (void)onNext { %log; %orig; }
- (_Bool)recoverFromArchive:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)refreshViewWithData:(id)arg1 { %log; %orig; }
- (void)setDelegate:(id)arg1 { %log; %orig; }
- (void)setHeaderTip:(id)arg1 { %log; %orig; }
- (void)setLeftBarBtnTitle:(id)arg1 { %log; %orig; }
- (void)setLeftBarBtnTitleForNakedWxProtect:(id)arg1 { %log; %orig; }
- (void)setViewY { %log; %orig; }
- (void)showBindFooter { %log; %orig; }
- (void)showCountryCode { %log; %orig; }
- (void)showCountryCodePickerView { %log; %orig; }
- (void)showLoginFooter { %log; %orig; }
- (void)showMobileCanBeFound { %log; %orig; }
- (void)showNextFooter:(id)arg1 { %log; %orig; }
- (void)showRegFooter { %log; %orig; }
- (void)vcBecomeFirstResponder { %log; %orig; }
- (void)vcResignFirstResponder { %log; %orig; }
- (void)viewDidLoad { %log; %orig; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end



%hook WCAccountPhoneLoginControlLogic
- (void)DidEnterBackground:(id)arg1 { %log; %orig; }
- (void)DidEnterForeground:(id)arg1 { %log; %orig; }
- (void)cancelAllEvent { %log; %orig; }
- (void)checkHavePwd { %log; %orig; }
- (_Bool)checkPhoneNumberStatus:(unsigned int)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)checkVerifyCode:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)dealloc { %log; %orig; }
- (void)forceRegisterForPhone { %log; %orig; }
- (id)getArchive { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)getVerifyCode { %log; %orig; }
- (_Bool)getVerifyCodeReady { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)getVoideVerifyCodeReady:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)initWithData:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)jumpToManulLoginControlMgrToRegister:(id)arg1 { %log; %orig; }
- (void)loginAccount { %log; %orig; }
- (void)loginForPhone { %log; %orig; }
- (void)login_but_registerForPhone { %log; %orig; }
- (void)onByPhonePwdLoginByVerifyCode:(id)arg1 phoneNumber:(id)arg2 { %log; %orig; }
- (void)onCheckForgetPwdVerifyCode:(id)arg1 userName:(id)arg2 password:(id)arg3 StyleKeyValue:(id)arg4 { %log; %orig; }
- (void)onCheckLoginPhoneNumberStatus:(id)arg1 countryCode:(id)arg2 phoneNumber:(id)arg3 formatedPhoneNumber:(id)arg4 StyleKeyValue:(id)arg5 { %log; %orig; }
- (void)onCheckLoginVerifyCode:(id)arg1 ticket:(id)arg2 controlShowFlag:(unsigned int)arg3 userName:(id)arg4 password:(id)arg5 StyleKeyValue:(id)arg6 { %log; %orig; }
- (void)onCheckRegPhoneNumberStatus:(id)arg1 countryCode:(id)arg2 phoneNumber:(id)arg3 formatedPhoneNumber:(id)arg4 StyleKeyValue:(id)arg5 { %log; %orig; }
- (void)onCheckRegVerifyCode:(id)arg1 ticket:(id)arg2 controlShowFlag:(unsigned int)arg3 userName:(id)arg4 password:(id)arg5 StyleKeyValue:(id)arg6 { %log; %orig; }
- (void)onFacebookConnect { %log; %orig; }
- (void)onFillPhoneBack { %log; %orig; }
- (void)onFillPhoneFromRegToLogin { %log; %orig; }
- (void)onFillPhoneGoToSecurityCenter { %log; %orig; }
- (void)onFillPhoneLoginByQQ { %log; %orig; }
- (void)onFillPhoneNext:(id)arg1 phoneNumber:(id)arg2 { %log; %orig; }
- (void)onFillPhoneNext:(id)arg1 phoneNumber:(id)arg2 pwd:(id)arg3 { %log; %orig; }
- (void)onFillPhoneReg { %log; %orig; }
- (void)onGetForgetPwdVerifyCode:(id)arg1 StyleKeyValue:(id)arg2 { %log; %orig; }
- (void)onGetForgetPwdVoiceVerifyCode:(id)arg1 StyleKeyValue:(id)arg2 { %log; %orig; }
- (void)onGetLoginVerifyCode:(id)arg1 StyleKeyValue:(id)arg2 { %log; %orig; }
- (void)onGetLoginVoiceVerifyCode:(id)arg1 StyleKeyValue:(id)arg2 { %log; %orig; }
- (void)onGetRegVerifyCode:(id)arg1 StyleKeyValue:(id)arg2 { %log; %orig; }
- (void)onGetRegVoiceVerifyCode:(id)arg1 StyleKeyValue:(id)arg2 { %log; %orig; }
- (void)onGetVerifyCode:(id)arg1 StyleKeyValue:(id)arg2 { %log; %orig; }
- (void)onGetVoiceVerifyCode:(id)arg1 StyleKeyValue:(id)arg2 { %log; %orig; }
- (void)onLoginByQRCode { %log; %orig; }
- (_Bool)onManualAuthControlLogicError:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)onManualAuthControlLogicStop:(unsigned long long)arg1 response:(id)arg2 { %log; %orig; }
- (void)onPhoneVerifyAgain { %log; %orig; }
- (void)onPhoneVerifyBack { %log; %orig; }
- (void)onPhoneVerifyNext:(id)arg1 { %log; %orig; }
- (void)onPhoneVerifyVoice { %log; %orig; }
- (void)onRegByOldPhoneBack { %log; %orig; }
- (void)onRegByOldPhoneContinueReg { %log; %orig; }
- (void)onRegByOldPhoneLogin { %log; %orig; }
- (void)onSafeDeviceControlLogicCancel { %log; %orig; }
- (void)onSafeDeviceControlLogicReturnOK { %log; %orig; }
- (void)onSetPasswordBack { %log; %orig; }
- (void)onSetPasswordOK { %log; %orig; }
- (void)onSignUpWithQQ { %log; %orig; }
- (void)onVoiceVerifyBack { %log; %orig; }
- (void)onVoiceVerifyGetVerifyCode:(id)arg1 { %log; %orig; }
- (void)onWCBaseLogicDidStop:(unsigned int)arg1 { %log; %orig; }
- (void)pause { %log; %orig; }
- (_Bool)recoverFromArchive:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)registerForPhone { %log; %orig; }
- (void)resume { %log; %orig; }
- (void)startLogic { %log; %orig; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end





















%hook BaseVoicePrintViewController
- (void)GetResStartLoading { %log; %orig; }
- (void)GetResStopLoading { %log; %orig; }
- (void)HiddenRecordButton { %log; %orig; }
- (void)OnTalkButtonPress:(id)arg1 { %log; %orig; }
- (void)SetEndTime { %log; %orig; }
- (void)SetGuiTextWithFontSize:(double)arg1 { %log; %orig; }
- (void)SetStartTime { %log; %orig; }
- (void)ShouldShowGuideLabelText { %log; %orig; }
- (void)ShowRecordButton { %log; %orig; }
- (void)StartLoadingAnimation { %log; %orig; }
- (void)StopLoadingAnimation { %log; %orig; }
- (void)UpdateGuiText { %log; %orig; }
- (id)animationAlphaTo:(float)arg1 andDuration:(float)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)animationDidStart:(id)arg1 { %log; %orig; }
- (void)animationDidStop:(id)arg1 finished:(_Bool)arg2 { %log; %orig; }
- (void)setAnimationDuration:(unsigned int )animationDuration { %log; %orig; }
- (unsigned int )animationDuration { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)beginAllAnimation { %log; %orig; }
- (void)beginMyLoadingAnimation { %log; %orig; }
- (_Bool)canOverAnimationInterval { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)dealloc { %log; %orig; }
- (void)didReceiveMemoryWarning { %log; %orig; }
- (void)doAnimationWithSmallScaleValue:(double)arg1 AndBig:(double)arg2 { %log; %orig; }
- (void)doMeterAnimationWithBezierPath:(float)arg1 { %log; %orig; }
- (void)hideAnimation { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)initTalkButton { %log; %orig; }
- (_Bool)isTalkButtonPressed { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setLyricText:(NSString *)lyricText { %log; %orig; }
- (NSString *)lyricText { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_bInRSA:(_Bool )m_bInRSA { %log; %orig; }
- (_Bool )m_bInRSA { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_bPresentViewController:(_Bool )m_bPresentViewController { %log; %orig; }
- (_Bool )m_bPresentViewController { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_blurTargetView:(UIView *)m_blurTargetView { %log; %orig; }
- (UIView *)m_blurTargetView { %log; UIView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)makeStatusTextViewTransitionAnimation { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)onTalkButtonCancel:(id)arg1 { %log; %orig; }
- (double)randFloatBetween:(double)arg1 And:(double)arg2 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (void)registerExtension { %log; %orig; }
- (void)removeStatusTextViewAnimationAndHide { %log; %orig; }
- (void)showTipLabel { %log; %orig; }
- (void)startDoGuideTextAnimation { %log; %orig; }
- (void)startGetResource { %log; %orig; }
- (void)startMeterAnimation { %log; %orig; }
- (void)stopAllAnimation { %log; %orig; }
- (void)stopGetResource { %log; %orig; }
- (void)stopMeterAnimation { %log; %orig; }
- (void)stopMyLoadingAnimation { %log; %orig; }
- (void)unregisterExtension { %log; %orig; }
- (void)updateGuideText:(id)arg1 andDuration:(double)arg2 { %log; %orig; }
- (void)updateMeterAnimationWithValue:(float)arg1 { %log; %orig; }
- (void)updateMeterPowerValue:(float)arg1 { %log; %orig; }
- (void)updateStatusText:(id)arg1 { %log; %orig; }
- (void)updateStatusTextWithNoFade:(id)arg1 { %log; %orig; }
- (_Bool)useBlackStatusbar { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)viewDidLoad { %log; %orig; }
- (void)viewWillAppear:(_Bool)arg1 { %log; %orig; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end




















%hook WCAccountRegisterViewController
- (void)MenuControllerWillHide:(id)arg1 { %log; %orig; }
- (void)WCBaseInfoItemBeginEdit:(id)arg1 { %log; %orig; }
- (void)WCBaseInfoItemEditChanged:(id)arg1 { %log; %orig; }
- (void)WCBaseInfoItemEndEdit:(id)arg1 { %log; %orig; }
- (void)WCBaseInfoItemPressReturnKey:(id)arg1 { %log; %orig; }
- (_Bool)canBecomeFirstResponder { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)canPerformAction:(SEL)arg1 withSender:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)dealloc { %log; %orig; }
- (void)didReceiveMemoryWarning { %log; %orig; }
- (void)forwarder:(id)arg1 { %log; %orig; }
- (void)getAliasDone { %log; %orig; }
- (id)getArchive { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)getSuggestAlias { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)initNavigationBar { %log; %orig; }
- (_Bool)isLastWeChatIDChanged { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isShowHead { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isShowWeChatID { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)onGetHeadImage:(id)arg1 { %log; %orig; }
- (void)onNext { %log; %orig; }
- (void)onRegNickNameBack { %log; %orig; }
- (_Bool)recoverFromArchive:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)refreshViewWithUserName:(id)arg1 { %log; %orig; }
- (void)resetSuggestAlias { %log; %orig; }
- (void)setAliasOK { %log; %orig; }
- (void)setDelegate:(id)arg1 { %log; %orig; }
- (void)setError:(id)arg1 { %log; %orig; }
- (void)showHeadImageOption { %log; %orig; }
- (void)updateMenu:(id)arg1 { %log; %orig; }
- (void)viewDidLoad { %log; %orig; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end






























%hook CreateVoicePrintViewController
- (void)OnEnvironmentReCheckButton:(id)arg1 { %log; %orig; }
- (void)OnNextButtonPress:(id)arg1 { %log; %orig; }
- (void)OnTalkButtonPress:(id)arg1 { %log; %orig; }
- (void)SetIsFirstStep:(_Bool)arg1 { %log; %orig; }
- (void)ShowCreateDoneSceneWithSuccessWording:(id)arg1 { %log; %orig; }
- (void)ShowCreateErrorAndMustEscScene:(int)arg1 { %log; %orig; }
- (void)ShowEnvironmentCheckScene:(_Bool)arg1 { %log; %orig; }
- (void)ShowFirstGuideScene { %log; %orig; }
- (void)ShowRecordScene { %log; %orig; }
- (void)ShowRedoScene { %log; %orig; }
- (void)ShowSecondGuideScene { %log; %orig; }
- (void)ShowStepView { %log; %orig; }
- (void)backButtonDone:(id)arg1 { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)initBaseView { %log; %orig; }
- (void)initHoldTipView { %log; %orig; }
- (void)initStepLabel { %log; %orig; }
- (void)makeCheckEnvironmentView { %log; %orig; }
- (void)makeNextButton { %log; %orig; }
- (void)onTalkButtonCancel:(id)arg1 { %log; %orig; }
- (void)onTryVerifyBtn:(id)arg1 { %log; %orig; }
- (void)startDoGuideTextAnimation { %log; %orig; }
- (void)startGetResource { %log; %orig; }
- (void)stopGetResource { %log; %orig; }
- (void)viewDidLoad { %log; %orig; }
%end


















%hook WCAccountBaseViewController
- (void)WCBaseInfoItemPressReturnKey:(id)arg1 { %log; %orig; }
- (void)callViewDidLoad { %log; %orig; }
- (id)getArchive { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBothSideMarginInputLineView { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getHeaderTipLabel:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getHeaderView:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getInputLineView { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getNewHeaderView:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned int)getStayTime { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)hideKeyBoard { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)initData { %log; %orig; }
- (void)initNavigationBar { %log; %orig; }
- (void)initView { %log; %orig; }
- (void)setM_nsStyleID:(NSString *)m_nsStyleID { %log; %orig; }
- (NSString *)m_nsStyleID { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_uiReportStatus:(unsigned int )m_uiReportStatus { %log; %orig; }
- (unsigned int )m_uiReportStatus { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (id)makeHeaderView:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)makeNewHeaderView:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)onNext { %log; %orig; }
- (_Bool)recoverFromArchive:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)refreshViewWithData:(id)arg1 { %log; %orig; }
- (void)setNavigationLeftBarButtonStyle:(long long)arg1 target:(id)arg2 action:(SEL)arg3 { %log; %orig; }
- (void)setNavigationRightBarButtonMoreStyleWithtarget:(id)arg1 action:(SEL)arg2 { %log; %orig; }
- (void)setStartTime { %log; %orig; }
- (void)setTableFooterView:(id)arg1 { %log; %orig; }
- (void)setTableHeaderView:(id)arg1 { %log; %orig; }
- (void)setupWithData:(id)arg1 { %log; %orig; }
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 { %log; %orig; }
- (_Bool)useCustomNavibar { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)useGrayBackgroundColor { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)useIpadSytle { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)viewDidAppear:(_Bool)arg1 { %log; %orig; }
- (void)viewDidDisappear:(_Bool)arg1 { %log; %orig; }
- (void)viewDidLayoutSubviews { %log; %orig; }
- (void)viewDidLoad { %log; %orig; }
- (void)viewDidTransitionToNewSize { %log; %orig; }
- (void)viewWillAppear:(_Bool)arg1 { %log; %orig; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end

















%hook WCAccountRegisterControlLogic
- (void)DidEnterBackground:(id)arg1 { %log; %orig; }
- (void)DidEnterForeground:(id)arg1 { %log; %orig; }
- (void)OnConfirmAddressBookStatus:(unsigned int)arg1 { %log; %orig; }
- (void)RSAProtobufMessageReturn:(id)arg1 Event:(unsigned int)arg2 { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (void)enableAddressBook { %log; %orig; }
- (id)genNewRegRequest { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getArchive { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getBindName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)getSuggestAlias { %log; %orig; }
- (void)handleNewRegResponse:(id)arg1 { %log; %orig; }
- (void)handleRespForSuggestAlias:(id)arg1 { %log; %orig; }
- (id)initWithData:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)jumpToMainFrame { %log; %orig; }
- (void)onEnableAddressBookTip { %log; %orig; }
- (void)onGetSuggestAlias:(id)arg1 alias:(id)arg2 { %log; %orig; }
- (void)onGraphicVerifyBack { %log; %orig; }
- (void)onGraphicVerifyChangeImage { %log; %orig; }
- (void)onGraphicVerifyWithVerifyCode:(id)arg1 { %log; %orig; }
- (void)onRegNickNameBack { %log; %orig; }
- (void)onRegNickNameReg:(id)arg1 alias:(id)arg2 headImage:(id)arg3 { %log; %orig; }
- (void)pause { %log; %orig; }
- (_Bool)recoverFromArchive:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)regAccount { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)resume { %log; %orig; }
- (void)showDeniedTip { %log; %orig; }
- (void)showEnableTip { %log; %orig; }
- (void)startLogic { %log; %orig; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end
