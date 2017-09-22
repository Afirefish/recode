@interface WCContentItem : NSObject
@property (retain,nonatomic)NSMutableArray *mediaList;
@end


@interface WCDataItem : NSObject
@property (retain,nonatomic) WCContentItem *contentObj;
@end

@interface WCUrl : NSObject
@property (retain,nonatomic)NSString *url;
@end

@interface WCMediaItem : NSObject
@property (retain,nonatomic)WCUrl *dataUrl;
- (id)pathForSightData;
@end

@interface WCTLContentItemTemplateVideo : UIView
- (WCMediaItem *)MediaItemFromSight;
- (void)OnSaveToDisk;
- (void)OnCopyURL;
@end

@interface MMServiceCenter : NSObject
+ (id)defaultCenter;
- (id)getService:(Class)arg1;
@end

@interface WCFacade:NSObject
- (id)getTimelineDataItemOfIndex:(long long)arg1;
@end

@interface WCTimeLineViewController
- (long long)calcDataItemIndex:(long long)arg1;
@end

@interface MMTableViewCell : UITableViewCell

@end

@interface MMTableView : UITableView

@end
