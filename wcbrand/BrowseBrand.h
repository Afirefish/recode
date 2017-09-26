//
//  BrowseBrand.h
//  
//
//  Created by 戴曦嘉 on 2017/8/10.
//
//

#import <UIKit/UIKit.h>


@interface BrowseBrand : NSObject
+ (instancetype)singleInstance;//create a single instance
- (BOOL)openBrandView:(id)arg1;//return whether open sucess
+ (void)changeFlag;
+ (int)flag;
+ (int)autoCount;
+ (void) reduceCount;
- (void)setAutoCount:(id)arg1;
+ (int)articleCount;
+ (void)reduceArticleCount;
- (void)setArticleCount:(id)arg1;
- (BOOL)isTrueBrandSession:(id)arg1;//judge whether correct brand session
- (NSInteger)viewBrandRow:(id)arg1;//view brand row, return the total number
- (void)selectOneBrand:(unsigned int)arg1 inController:(id)arg2;//pass the index of brand session, return the brand session
- (NSInteger)viewBrandSession:(id)arg1;//view section of the brand, return the total number
- (id)getVisibleLastView:(id)arg1;//get the last visible cell from the view
- (unsigned int)isMsgView:(id)arg1;//judge the view class
- (unsigned int)isVisibleMsgView:(id)arg2;//    //judge the view class:0 is wrong, 1 is ReaderMessageCellView,2 is MultiReaderMessageCellView,3 is ChatTimeCellView
- (NSInteger)countSubView:(id)arg1;//count the subView for the chatcell
- (void)selectOneArticle:(unsigned int)arg1 inSubView:(unsigned int)arg2 inBrandSession:(id)arg3;//open the article,return the index
- (void)popViewController:(id)arg1;//return the previous view
@end
