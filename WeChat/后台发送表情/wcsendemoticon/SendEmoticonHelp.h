//
//  SendEmoticonHelp.h
//
//
//  Created by 戴曦嘉 on 2017/10/11.
//
//

#ifndef SendEmoticonHelp_h
#define SendEmoticonHelp_h

@interface MMInputToolView : UIView
- (void)onExpressionButtonClicked:(id)arg1;

@end

@interface EmoticonBoardView : UIView
- (void)onTapEmoticonWrap:(id)arg1;

@end

@interface EmoticonBoardPageCollectionController : NSObject

@end

@interface EmoticonBoardPageSectionInfo : NSObject

@end

@interface EmoticonBoardPageWrap : NSObject

@end

@interface MMServiceCenter : NSObject
+ (id)defaultCenter;
- (id)getService:(Class)className;
@end

@protocol IMsgExtendOperation <NSObject>

@end

@interface CMessageWrap : NSObject
@property(retain, nonatomic) NSString *m_nsToUsr; // @synthesize m_nsToUsr;
@property(retain, nonatomic) NSString *m_nsFromUsr; // @synthesize m_nsFromUsr;
@property(nonatomic) unsigned int m_uiMessageType; // @synthesize m_uiMessageType;
@property(retain, nonatomic) NSString *m_nsContent; // @synthesize m_nsContent;
@property(retain, nonatomic) id <IMsgExtendOperation> m_extendInfoWithMsgType; // @synthesize m_extendInfoWithMsgType;
@property(nonatomic) unsigned int m_uiMsgFlag; // @synthesize m_uiMsgFlag;
- (id)initWithMsgType:(long long)arg1;

@end


@interface CMessageMgr : NSObject
- (void)AddMsg:(id)arg1 MsgWrap:(id)arg2;
- (void)AddEmoticonMsg:(id)arg1 MsgWrap:(id)arg2;
- (void)UpdateEmoticonMsg:(id)arg1;
- (void)CheckMessageStatus:(id)arg1 Msg:(id)arg2;

@end


@interface CExtendInfoOfEmoticon : NSObject <IMsgExtendOperation, NSCopying>
@property(nonatomic) unsigned int m_uiEmoticonType; // @synthesize m_uiEmoticonType;
@property(retain, nonatomic) NSString *m_nsEmoticonMD5; // @synthesize m_nsEmoticonMD5;
@property(copy, nonatomic) NSString *m_nsEmoticonBelongToProductID; // @synthesize m_nsEmoticonBelongToProductID;
@property(retain,nonatomic) CMessageWrap *m_refMessageWrap; // @synthesize m_refMessageWrap;
+ (void)CreateExtendInfoWithType:(unsigned int)arg1 retExtendInfo:(id *)arg2;
- (void)UpdateContent:(id)arg1;

@end
#endif /* SendEmoticonHelp_h */
