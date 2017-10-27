#import "AnnounceAll.h"

%hook  BaseMsgContentViewController//要有群主权限才行
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
    AnnounceAll *annonuce = [[AnnounceAll alloc] init];
    [annonuce runTask];
}
%end
//wxid_nra30q0yczvf12
//<msgsource><sequence_id>600531810</sequence_id>\n\t<atuserlist>announcement@all</atuserlist>\n</msgsource>\n