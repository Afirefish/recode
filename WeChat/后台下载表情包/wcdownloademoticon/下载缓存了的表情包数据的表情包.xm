#import "DownloadEmoticon.h"

%hook BaseMsgContentViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	MMServiceCenter* serviceCenter = [objc_getClass("MMServiceCenter") defaultCenter];
	EmoticonStoreMgr *eMgr = [serviceCenter getService:[objc_getClass("EmoticonStoreMgr") class]];
	[eMgr getStoreListCacheWithReqType:5];
	[eMgr updateListFromAppleForSKProduct];
	EmoticonStoreItem *emoticonItem = [eMgr findEmoticonItemByProductID:@"com.tencent.xin.emoticon.person.stiker_15051216398b12587ddf2cd80d"];
	NSLog(@"emoticonItem--%@",emoticonItem);
	[eMgr reDownloadAndInstallEmoticonItem:emoticonItem isAutomatic:0];
}
%end