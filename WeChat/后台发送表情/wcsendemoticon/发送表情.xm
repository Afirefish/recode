BaseMsgContentViewController中获得的MMInputToolView
然后获得EmoticonBoardView
然后获得EmoticonBoardPageCollectionController
获得EmoticonBoardPageSectionInfo
然后获得EmoticonBoardPageWrap
然后通过_emoticonArray获得表情包具体内容 

#import "SendEmoticonHelp.h"

%hook BaseMsgContentViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	MMInputToolView *inputToolView = [self valueForKey:@"_inputToolView"];
	NSLog (@"inputToolView ---%@",inputToolView);
	[inputToolView onExpressionButtonClicked:[inputToolView valueForKey:@"_expressionButton"]];
	EmoticonBoardView *expressionView = [inputToolView valueForKey:@"_expressionView"];
	NSLog (@"expressionView--%@",expressionView);
	EmoticonBoardPageCollectionController *pageCollectionController = [expressionView valueForKey:@"m_pageCollectionController"];
	NSLog(@"pageCollectionController---%@",pageCollectionController);
	NSArray *emoticonInfoArr = [pageCollectionController valueForKey:@"m_sectionInfoArray"];
	NSLog(@"emoticonInfoArr---%@",emoticonInfoArr);
	for (int i = 0; i < [emoticonInfoArr count]; ++i)
	{
		EmoticonBoardPageSectionInfo *emoticonInfo = [emoticonInfoArr objectAtIndex:i];
		NSArray *qqEmoji = [emoticonInfo valueForKey:@"_qqEmojiPageArray"];
		EmoticonBoardPageWrap *emoticonWrap = [emoticonInfo valueForKey:@"_pageWrap"];
		if (qqEmoji != nil && ![qqEmoji isKindOfClass:[NSNull class]] && qqEmoji.count != 0)  
		{
			NSLog(@"this is qq emoji--%@",qqEmoji);
		} else if (emoticonWrap != nil)
		{
			NSArray *emoticonArr = [emoticonWrap valueForKey:@"_emoticonArray"];
			NSLog(@"this is user emoji----%@",emoticonArr);
			[expressionView onTapEmoticonWrap:[emoticonArr objectAtIndex:1]];
		}
	}
}
%end





//后台发送消息
%hook BaseMsgContentViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	CMessageWrap *classCMessageWrap = [[objc_getClass("CMessageWrap") alloc] initWithMsgType:47];
    [classCMessageWrap setM_nsToUsr:@"wxid_xu5zm6fn9jth21"];
    [classCMessageWrap setM_nsFromUsr:@"wxid_j79te0rwqh0d22"];
    [classCMessageWrap setM_uiMessageType:47];
    //[classCMessageWrap setM_nsContent:@"你好"];
    
    MMServiceCenter* serviceCenter = [objc_getClass("MMServiceCenter") defaultCenter];
    [[serviceCenter getService:[objc_getClass("CMessageMgr") class]] AddMsg:@"wxid_nra30q0yczvf12" MsgWrap:classCMessageWrap];
}
%end




