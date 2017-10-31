//
//  AirPlaneModeControl.h
//  
//
//  Created by 戴曦嘉 on 2017/10/31.
//
//

#import <Foundation/Foundation.h>


@interface PSAirplaneModeSettingsDetail : NSObject
+ (BOOL)isEnabled;
+ (void)setEnabled:(BOOL)arg1;

@end

@interface AirPlaneModeControl : NSObject
- (void)changeAirPlaneMode;

@end


