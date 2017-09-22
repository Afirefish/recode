#import "WCVideoDownload.h"


static MMTableViewCell *iOSRECell;
static MMTableView *iOSREView;
static WCTimeLineViewController *iOSREController;

%hook  WCTLContentItemTemplateVideo
%new
- (WCMediaItem *) MediaItemFromSight
{
	NSLog(@"call the media From sight");
	id responder = self;
	while (![responder isKindOfClass:NSClassFromString(@"WCTimeLineViewController")])
	{
		if([responder isKindOfClass:NSClassFromString(@"MMTableViewCell")])
			iOSRECell = responder;
		else if ([responder isKindOfClass:NSClassFromString(@"MMTableView")])
			iOSREView = responder;
		responder = [responder nextResponder];
	}
	iOSREController = responder;
	if(!iOSRECell || !iOSREView || !iOSREController)
	{
		NSLog(@"iOSRE:Failed to get video object.");
		return nil;
	}
	NSIndexPath *indexPath = [iOSREView indexPathForCell:iOSRECell];
	int itemIndex = [iOSREController calcDataItemIndex:[indexPath section]];
	WCFacade *facade = [(MMServiceCenter *)[%c(MMServiceCenter) defaultCenter] 		getService:[%c(WCFacade) class]];
	WCDataItem *dataItem = [facade getTimelineDataItemOfIndex:itemIndex];
	WCContentItem *contentItem = dataItem.contentObj;
	
	WCMediaItem *media = [contentItem.mediaList count] != 0 ? 
	(contentItem.mediaList)[0] : nil;
	return media;
}

%new
- (void)OnSaveToDisk
{
	NSString *localPath = [[self MediaItemFromSight] pathForSightData];
	UISaveVideoAtPathToSavedPhotosAlbum(localPath,nil,nil,nil);
	NSLog(@"%@",localPath);
}

- (void)OnCopyURL
{
	UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
	pasteboard.string = [self MediaItemFromSight].dataUrl.url;
	NSLog(@"Finish copy");
}

static int iOSRECounter;
- (void)onLongTouch
{
	
	NSLog(@"get onlongtouch");
	iOSRECounter++;
	if (iOSRECounter % 2 ==0) return;
	[self becomeFirstResponder];
	UIMenuItem *saveToDiskMenuItem = [[UIMenuItem alloc] initWithTitle:@"Save to Disk" 	action:@selector(OnSaveToDisk)];
	UIMenuItem *copyURLMenuItem = [[UIMenuItem alloc] initWithTitle:@"Copy Url"
	action:@selector(OnCopyURL)];
	UIMenuController *menuController = [UIMenuController sharedMenuController];
	[menuController setMenuItems:@[saveToDiskMenuItem,copyURLMenuItem]];
	[menuController setTargetRect:CGRectZero inView:self];
	[menuController setMenuVisible:YES animated:YES];
	[saveToDiskMenuItem release];
	[copyURLMenuItem release];
}
%end