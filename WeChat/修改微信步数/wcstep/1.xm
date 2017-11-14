#import "Step.h"

%hook WCDeviceM7Logic
- (void)checkCallDelegate { %log; %orig; }
- (int)getCurrM7StepCount { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)getHKAuthorizationStatus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getHKSourcePropertyLD { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getHKSourcePropertyPT { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)getM7OrHealthKitStepCount:(_Bool)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)getStepCount:(id)arg1 { %log; %orig; }
- (int)getStepFromHealthKit { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)hkSource2ClientSource:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isInWhiteList:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)loadHKSourceWhiteCache { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_aryWhiteList:(NSMutableArray *)m_aryWhiteList { %log; %orig; }
- (NSMutableArray *)m_aryWhiteList { %log; NSMutableArray * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_bDataChanged:(_Bool )m_bDataChanged { %log; %orig; }
- (_Bool )m_bDataChanged { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_cmStepCounter:(CMStepCounter *)m_cmStepCounter { %log; %orig; }
- (CMStepCounter *)m_cmStepCounter { %log; CMStepCounter * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)pathForHKAuthorized { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)pathForHKSourceWhiteCache { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)saveHKSourceWhiteCache { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setHealthKitAuthorized:(_Bool)arg1 { %log; %orig; }
- (void)tryDoObserverStepQuery { %log; %orig; }
- (int)tryGetStepFromHealthKit { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)updateSampleSourceList:(id)arg1 { %log; %orig; }
%end
