//
//  DownloadEmoticonHelp.h
//  
//
//  Created by 戴曦嘉 on 2017/10/13.
//
//

#ifndef DownloadEmoticonHelp_h
#define DownloadEmoticonHelp_h

@interface MMEmotionStoreViewController : UIViewController

@end

@interface MMWechatEmotionsViewController : UIViewController

@end

@interface EmoticonStoreMgr : NSObject
- (id)findEmoticonItemByProductID:(id)arg1;
- (id)findDownloadingEmoticonItemByProductID:(id)arg1;
- (_Bool)downloadAndInstallEmoticonItem:(id)arg1;
- (_Bool)reDownloadAndInstallEmoticonItem:(id)arg1 isAutomatic:(_Bool)arg2;
- (id)getStoreListCacheWithReqType:(unsigned int)arg1;
- (void)updateListFromAppleForSKProduct;


@end

@interface MMStoreEmotionAllCell

@end

@interface EmoticonStoreItem : NSObject
@property(copy, nonatomic) NSString *productID; // @synthesize productID;
@property(copy, nonatomic) NSString *iconUrl; // @synthesize iconUrl;
@property(nonatomic) unsigned int packType; // @synthesize packType;
@property(nonatomic) unsigned int packFlag; // @synthesize packFlag;

@end

@interface SKProduct : NSObject

@end

@interface EmoticonStoreDownloadView : UIView

@end

@interface MMServiceCenter : NSObject
+ (id)defaultCenter;
- (id)getService:(Class)className;
@end

#endif /* DownloadEmoticonHelp_h */
