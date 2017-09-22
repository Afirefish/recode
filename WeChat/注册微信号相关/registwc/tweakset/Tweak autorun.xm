#import "regist.h"

%hook WCAccountLoginFirstViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	WCAccountLoginControlLogic *login = (WCAccountLoginControlLogic *)[self valueForKey:@"m_delegate"];
	[login onFirstViewRegester];
}
%end


%hook WCAccountFillPhoneViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	
	CountryCodeWrap *country = [self valueForKey:@"m_curCountryCode"];
	NSString *countryCode = [country m_nsISOCountryCodes];
	NSString *provideCode = @"HK";
	if([countryCode isEqualToString:provideCode]) {

		[self CountryCodePickerDidPickCountryCode: country];
		WCAccountPhoneLoginControlLogic *registphone = (WCAccountPhoneLoginControlLogic *)[self valueForKey:@"m_delegate"];
		[registphone onFillPhoneNext:[country m_nsCountryCode]  phoneNumber:@"18804205069"];
	} else {
		[self showCountryCodePickerView];
	}
}
%end

%hook WCAccountFillPhoneViewController 
- (void)viewDidAppear:(_Bool)arg1 {
	NSArray *allCountry = [self valueForKey:@"m_arrData"];
	NSInteger count = [allCountry count];
	NSString *provideCode = @"HK";
	for (int index = 0; index < count; row ++) {
		CountryCodeWrap *country = [allCountry objectAtIndex:index];
		NSString *countryCode = [country m_nsISOCountryCodes];
		if([countryCode isEqualToString:provideCode]) {
			break;
		}
	}
	NSLog(@"the wanted country:%@", country);
}



/*%hook WCAccountPhoneVerifyViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	WCAccountPhoneLoginControlLogic *verify = (WCAccountPhoneLoginControlLogic *)[self valueForKey:@"m_delegate"];
	[verify onPhoneVerifyNext:@"123456"];
}
%end

%hook WCAccountVoicePrintWelcomeViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	[self onClickCreateBtn];
}
%end

%hook CreateVoicePrintViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	UIButton *talkButton1 = (UIButton *)[self valueForKey:@"_talk_button"];
	if (talkButton1 != nil) {
		[self OnTalkButtonPress:talkButton1];
		[self onTalkButtonCancel:talkButton1];
	}
	UIButton *nextButton = (UIButton *)[self valueForKey:@"_next_button"];
	if (nextButton != nil) {
		[self OnNextButtonPress:nextButton];
	}
	UIButton *talkButton2 = (UIButton *)[self valueForKey:@"_talk_button"];
	if (talkButton2 != nil) {
		[self OnTalkButtonPress:talkButton2];
		[self onTalkButtonCancel:talkButton2];
	}
	UIButton *doneButton = (UIButton *)[self valueForKey:@"_done_button"];
	if (doneButton != nil) {
		[self onTryVerifyBtn:doneButton];
	}
}
%end

%hook WCAccountRegisterViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	WCAccountRegisterControlLogic *registName = (WCAccountRegisterControlLogic *)[self valueForKey:@"m_delegate"];
	WCAccountTextFieldItem *item = [self valueForKey:@"m_textFieldNameItem"];
	[item setText:@"name"];
	[self WCBaseInfoItemEndEdit:item];
	[self onGetHeadImage:nil];
	//[registName onRegNickNameReg:@"笨蛋和奏" alias:nil headImage:nil];
}
%end*/	



	
