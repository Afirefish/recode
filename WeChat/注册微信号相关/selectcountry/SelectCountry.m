//
//  SelectCountry.m
//  
//
//  Created by 戴曦嘉 on 2017/8/25.
//
//

#import "SelectCountry.h"
#import "regist.h"

@interface SelectCountry()
@property (strong,nonatomic) CountryCodeWrap *country;
@end

@implementation SelectCountry


static SelectCountry *_ins = nil;
+ (instancetype)singleInstance {
    //create a single instance
    if (_ins == nil) {
        _ins = [[SelectCountry alloc] init];
    }
    return _ins;
}

- (void)selectCountry:(NSString *)countryCode inContoller:(UIViewController *)viewController {
    if ([viewController isKindOfClass:NSClassFromString(@"WCAccountFillPhoneViewController")]) {
        WCAccountFillPhoneViewController *targetController = (WCAccountFillPhoneViewController *)viewController;
        NSString *countryCode = [self.country m_nsISOCountryCodes];
        if([countryCode isEqualToString:countryCode]) {
            NSLog(@"getThere");
            [targetController CountryCodePickerDidPickCountryCode:self.country];
        } else {
            NSLog(@"not the true country----%@",self.country);
            [targetController showCountryCodePickerView];
        }//end if
    }//end if
}

- (void)searchCountry:(NSString *)countryCode inContoller:(UIViewController *)viewController {
    if ([viewController isKindOfClass:NSClassFromString(@"CountryCodePickerViewController")]) {
        CountryCodePickerViewController *targetController = (CountryCodePickerViewController *)viewController;
        NSArray *allCountry = [targetController valueForKey:@"m_arrData"];
        NSInteger count = [allCountry count];
        NSString *provideCode = countryCode;
        for (int index = 0; index < count; index ++) {
            CountryCodeWrap *country = [allCountry objectAtIndex:index];
            NSString *countryCode = [country m_nsISOCountryCodes];
            if([countryCode isEqualToString:provideCode]) {
                NSLog(@"the wanted country:%@", country);
                self.country = country;
                break;
            }//end if
        }//end for
        [targetController OnReturn];
    }//end if
}



@end

