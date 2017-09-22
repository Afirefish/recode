#import "SelectCountry.h"

%hook WCAccountFillPhoneViewController
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	SelectCountry *select = [%c(SelectCountry) singleInstance];
	[select selectCountry:@"HK" inContoller:self];
}
%end

%hook CountryCodePickerViewController 
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;
	SelectCountry *select = [%c(SelectCountry) singleInstance];
	[select searchCountry:@"HK" inContoller:self];
}
%end