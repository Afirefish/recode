//
//  DownloadEmoticon.m
//  
//
//  Created by 戴曦嘉 on 2017/10/13.
//
//

#import "DownloadEmoticon.h"
#import "DownloadEmoticonHelp.h"

@implementation DownloadEmoticon

- (void)runTask {
    [self downloadAllEmoticon];
}

- (void)downloadAllEmoticon {
    MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
    EmoticonStoreMgr *eMgr = [serviceCenter getService:[NSClassFromString(@"EmoticonStoreMgr") class]];
    [eMgr getStoreListCacheWithReqType:5];
    [eMgr updateListFromAppleForSKProduct];
    [self downloadTangyuanjiang:eMgr];
    [self downloadTangyuanjiang2:eMgr];
    [self downloadYingxiaotu:eMgr];
    [self downloadHuochairen:eMgr];
    [self downloadMuxiaotu:eMgr];
    [self downloadMogutou:eMgr];
}

//下载汤圆酱表情包
- (void)downloadTangyuanjiang:(EmoticonStoreMgr *)eMgr {
    EmoticonStoreItem *emoticonItem = [[[NSClassFromString(@"EmoticonStoreItem") class] alloc] init];
    [emoticonItem setProductID:@"com.tencent.xin.emoticon.person.stiker_1503807825f6a1c3f296cf0bbc"];
    [emoticonItem setIconUrl:@"http://mmbiz.qpic.cn/mmemoticon/dx4Y70y9Xct1aEicvWKZ5yQia5MPZ0XNKRcdJiaMONnM5mweicl1t0yyZZiaic0YA5n0yiaCDRY8Ipib480/0"];
    [emoticonItem setPackType:5];
    [emoticonItem setPackFlag:1];
    NSLog(@"Tangyuanjiang emoticonItem--%@",emoticonItem);
    [eMgr reDownloadAndInstallEmoticonItem:emoticonItem isAutomatic:0];
}

//下载汤圆酱第二季表情包
- (void)downloadTangyuanjiang2:(EmoticonStoreMgr *)eMgr {
    EmoticonStoreItem *emoticonItem = [[[NSClassFromString(@"EmoticonStoreItem") class] alloc] init];
    [emoticonItem setProductID:@"com.tencent.xin.emoticon.person.stiker_15051216398b12587ddf2cd80d"];
    [emoticonItem setIconUrl:@"http://mmbiz.qpic.cn/mmemoticon/dx4Y70y9XcvtcILROQ88JfvN06RGxnE0WibWT83XqkJ8aykJEy2ibG1eDarJfHn0DZ/0"];
    [emoticonItem setPackType:5];
    [emoticonItem setPackFlag:1];
    NSLog(@"Tangyuanjiang2 emoticonItem--%@",emoticonItem);
    [eMgr reDownloadAndInstallEmoticonItem:emoticonItem isAutomatic:0];
}

//下载颖小兔表情包
- (void)downloadYingxiaotu:(EmoticonStoreMgr *)eMgr {
    EmoticonStoreItem *emoticonItem = [[[NSClassFromString(@"EmoticonStoreItem") class] alloc] init];
    [emoticonItem setProductID:@"com.tencent.xin.emoticon.person.stiker_15053151790cbb9cf9f6ecf2bd"];
    [emoticonItem setIconUrl:@"http://mmbiz.qpic.cn/mmemoticon/nMl9ssowtibVTYqjrszfuyb05NolKWSNiah3XG1RwBuLd7tVBWgWLg8RmlJjxhjspib/0"];
    [emoticonItem setPackType:4];
    [emoticonItem setPackFlag:1];
    NSLog(@"Yingxiaotu emoticonItem--%@",emoticonItem);
    [eMgr reDownloadAndInstallEmoticonItem:emoticonItem isAutomatic:0];
}

//下载橡胶火柴人表情包
- (void)downloadHuochairen:(EmoticonStoreMgr *)eMgr {
    EmoticonStoreItem *emoticonItem = [[[NSClassFromString(@"EmoticonStoreItem") class] alloc] init];
    [emoticonItem setProductID:@"com.tencent.xin.emoticon.person.stiker_1504708167fca29d80f2454b2a"];
    [emoticonItem setIconUrl:@"http://mmbiz.qpic.cn/mmemoticon/duc2TvpEgSTEv3n2UFEO8iaUB8kBgsUw2O6PDzAaCBWsGXW7zHMxuEqebbP3Rr99f/0"];
    [emoticonItem setPackType:4];
    [emoticonItem setPackFlag:0];
    NSLog(@"Huochairen emoticonItem--%@",emoticonItem);
    [eMgr reDownloadAndInstallEmoticonItem:emoticonItem isAutomatic:0];
}

//下载慕小兔表情包
- (void)downloadMuxiaotu:(EmoticonStoreMgr *)eMgr {
    EmoticonStoreItem *emoticonItem = [[[NSClassFromString(@"EmoticonStoreItem") class] alloc] init];
    [emoticonItem setProductID:@"com.tencent.xin.emoticon.person.stiker_1506098754f2495cce9d85539b"];
    [emoticonItem setIconUrl:@"http://mmbiz.qpic.cn/mmemoticon/DhduwiaBa7lcXQKCOdxwdTGoQTWxiafHmR0X8ibzJO0icuyfDYeGEK65Q4FLf4bC6Nch/0"];
    [emoticonItem setPackType:4];
    [emoticonItem setPackFlag:0];
    NSLog(@"Muxiaotu emoticonItem--%@",emoticonItem);
    [eMgr reDownloadAndInstallEmoticonItem:emoticonItem isAutomatic:0];
}

//下载蘑菇头超实用表情包
- (void)downloadMogutou:(EmoticonStoreMgr *)eMgr {
    EmoticonStoreItem *emoticonItem = [[[NSClassFromString(@"EmoticonStoreItem") class] alloc] init];
    [emoticonItem setProductID:@"com.tencent.xin.emoticon.person.stiker_15041724497dbda478ae40b010"];
    [emoticonItem setIconUrl:@"http://mmbiz.qpic.cn/mmemoticon/Q3auHgzwzM5ru4Ecb4nv86Ggvh8NsGnFwspEbicBm3SbP752icLWzXicx4KWp3ZueqL8mfuFI5X7GY/0"];
    [emoticonItem setPackType:4];
    [emoticonItem setPackFlag:1];
    NSLog(@"Mogutou emoticonItem--%@",emoticonItem);
    [eMgr reDownloadAndInstallEmoticonItem:emoticonItem isAutomatic:0];
}

@end
