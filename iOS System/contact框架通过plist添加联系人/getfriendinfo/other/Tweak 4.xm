#import "GetFirendInfo.h"







%hook FindContactSearchViewCellInfo
- (void)doSearch { %log; %orig; }
- (void)doSearch:(id)arg1 Pre:(_Bool)arg2 { %log; %orig; }
%end