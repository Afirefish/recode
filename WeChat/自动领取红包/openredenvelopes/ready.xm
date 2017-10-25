










#import "OpenRedEnvelopesHelp.h"


%hook MMSessionInfo
- (unsigned int )ConIntRes2 { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (long long)compare:(id)arg1 { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (id)description { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_atUserList:(NSString *)m_atUserList { %log; %orig; }
- (NSString *)m_atUserList { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_bIsTop:(_Bool )m_bIsTop { %log; %orig; }
- (_Bool )m_bIsTop { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_bNeedContactVerify:(_Bool )m_bNeedContactVerify { %log; %orig; }
- (_Bool )m_bNeedContactVerify { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_bShowUnReadAsRedDot:(_Bool )m_bShowUnReadAsRedDot { %log; %orig; }
- (_Bool )m_bShowUnReadAsRedDot { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_contact:(CContact *)m_contact { %log; %orig; }
- (CContact *)m_contact { %log; CContact * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_draftMsg:(NSString *)m_draftMsg { %log; %orig; }
- (NSString *)m_draftMsg { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_draftMsgTime:(unsigned int )m_draftMsgTime { %log; %orig; }
- (unsigned int )m_draftMsgTime { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_msgWrap:(CMessageWrap *)m_msgWrap { %log; %orig; }
- (CMessageWrap *)m_msgWrap
 { 
 	%log; 
 	CMessageWrap * r = %orig; 
 	HBLogDebug(@" = %@", r); 
 	NSLog(@"msg content %@ extInfo %@ %@",
 		[r valueForKey:@"m_nsContent"],
 		[r valueForKey:@"m_extendInfoWithMsgType"],
 		[[r valueForKey:@"m_extendInfoWithMsgType"] class]
 		);
 	return r; 
 }
- (void)setM_nsFilePath:(NSString *)m_nsFilePath { %log; %orig; }
- (NSString *)m_nsFilePath { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsUserName:(NSString *)m_nsUserName { %log; %orig; }
- (NSString *)m_nsUserName { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_uAtMeCount:(unsigned int )m_uAtMeCount { %log; %orig; }
- (unsigned int )m_uAtMeCount { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uGreenLabelType:(unsigned int )m_uGreenLabelType { %log; %orig; }
- (unsigned int )m_uGreenLabelType { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uLastTime:(unsigned int )m_uLastTime { %log; %orig; }
- (unsigned int )m_uLastTime { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uNewInvApprove:(_Bool )m_uNewInvApprove { %log; %orig; }
- (_Bool )m_uNewInvApprove { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_uNewInvCount:(unsigned int )m_uNewInvCount { %log; %orig; }
- (unsigned int )m_uNewInvCount { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uTopTime:(unsigned int )m_uTopTime { %log; %orig; }
- (unsigned int )m_uTopTime { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uTransferCount:(unsigned int )m_uTransferCount { %log; %orig; }
- (unsigned int )m_uTransferCount { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uUnReadCount:(unsigned int )m_uUnReadCount { %log; %orig; }
- (unsigned int )m_uUnReadCount { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_uUnTopTime:(unsigned int )m_uUnTopTime { %log; %orig; }
- (unsigned int )m_uUnTopTime { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)tryLoadExtInfo { %log; %orig; }
- (void)setIsAutoIncrement:(_Bool )isAutoIncrement { %log; %orig; }
- (_Bool )isAutoIncrement { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setLastInsertedRowID:(long long )lastInsertedRowID { %log; %orig; }
- (long long )lastInsertedRowID { %log; long long  r = %orig; HBLogDebug(@" = %lld", r); return r; }
%end









%hook NewMainFrameViewController
- (void)updateSession:(id)arg1 { %log; NSLog(@" updateSession arg %@",[arg1 class]);%orig; }
%end

