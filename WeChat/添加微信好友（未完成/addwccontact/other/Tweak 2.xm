%hook RightTopMenuData
- (_Bool)clickMenu:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)encodeWithCoder:(id)arg1 { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)initWithCoder:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_arrShowIDs:(NSMutableArray *)m_arrShowIDs { %log; %orig; }
- (NSMutableArray *)m_arrShowIDs { %log; NSMutableArray * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_bShowNew:(_Bool )m_bShowNew { %log; %orig; }
- (_Bool )m_bShowNew { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setM_dicItemArchives:(NSMutableDictionary *)m_dicItemArchives { %log; %orig; }
- (NSMutableDictionary *)m_dicItemArchives { %log; NSMutableDictionary * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)updateConfig:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)updateFromOld { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
%end
