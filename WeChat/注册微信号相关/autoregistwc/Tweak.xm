#import "regist.h"

%hook WCAccountLoginFirstViewController
- (void)viewDidAppear:(_Bool)arg1 {//刚进去的月亮界面
	%log;
	%orig;
	WCAccountLoginControlLogic *login = (WCAccountLoginControlLogic *)[self valueForKey:@"m_delegate"];
	[login onFirstViewRegester];
}
%end


%hook WCAccountFillPhoneViewController
- (void)viewDidAppear:(_Bool)arg1 {//输入手机号
	%log;
	%orig;
	WCAccountPhoneLoginControlLogic *registphone = (WCAccountPhoneLoginControlLogic *)[self valueForKey:@"m_delegate"];
	[registphone onFillPhoneNext:@"+86" phoneNumber:@"18804205069"];
}
%end

%hook WCAccountPhoneVerifyViewController
- (void)viewDidAppear:(_Bool)arg1 {//输入验证码
	%log;
	%orig;
	WCAccountPhoneLoginControlLogic *verify = (WCAccountPhoneLoginControlLogic *)[self valueForKey:@"m_delegate"];
	[verify onPhoneVerifyNext:@"123456"];
}
%end

%hook WCAccountVoicePrintWelcomeViewController
- (void)viewDidAppear:(_Bool)arg1 {//开始声音
	%log;
	%orig;
	[self onClickCreateBtn];
}
%end

%hook CreateVoicePrintViewController
- (void)viewDidAppear:(_Bool)arg1 {//录入声音，点下一步，继续录入声音，完成
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
- (void)viewDidAppear:(_Bool)arg1 {//注册昵称，头像
	%log;
	%orig;
	WCAccountRegisterControlLogic *registName = (WCAccountRegisterControlLogic *)[self valueForKey:@"m_delegate"];
	[registName onRegNickNameReg:@"名字" alias:nil headImage:nil];//最后的参数传入UIImage
}
%end	



	
