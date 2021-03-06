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
