//
//  regist.h
//  
//
//  Created by 戴曦嘉 on 2017/8/21.
//
//

#ifndef regist_h
#define regist_h




@interface WCAccountLoginFirstViewController : UIViewController
@end

@interface WCAccountLoginControlLogic
- (void)onFirstViewRegester;
@end

@interface CountryCodeWrap
@property(retain, nonatomic) NSString *m_nsCountryCode; // @synthesize m_nsCountryCode;
@property(retain, nonatomic) NSString *m_nsCountryName; // @synthesize m_nsCountryName;
@property(retain, nonatomic) NSString *m_nsCountryNamePinYin; // @synthesize m_nsCountryNamePinYin;
@property(retain, nonatomic) NSString *m_nsISOCountryCodes; // @synthesize m_nsISOCountryCodes;
@property(nonatomic) unsigned int m_uiCountryNamesChineseStrokesCount; // @synthesize m_uiCountryNamesChineseStrokesCount;

@end

@interface WCAccountFillPhoneViewController : UIViewController
- (void)showCountryCodePickerView;
- (void)CountryCodePickerDidPickCountryCode:(id)arg1;


@end

@interface CountryCodePickerViewController : UIViewController
- (void)OnReturn;

@end

@interface WCAccountPhoneLoginControlLogic
- (void)onFillPhoneNext:(id)arg1 phoneNumber:(id)arg2;
- (void)onPhoneVerifyNext:(id)arg1;

@end


@interface WCAccountPhoneVerifyViewController : UIViewController
@end

@interface WCAccountVoicePrintWelcomeViewController : UIViewController
- (void)onClickCreateBtn;

@end

@interface CreateVoicePrintViewController : UIViewController
- (void)OnTalkButtonPress:(id)arg1;
- (void)onTalkButtonCancel:(id)arg1;
- (void)OnNextButtonPress:(id)arg1;
- (void)onTryVerifyBtn:(id)arg1;

@end

@interface WCAccountRegisterControlLogic
- (void)onRegNickNameReg:(id)arg1 alias:(id)arg2 headImage:(id)arg3;

@end


@interface WCAccountRegisterViewController : UIViewController
@end



#endif /* regist_h */
