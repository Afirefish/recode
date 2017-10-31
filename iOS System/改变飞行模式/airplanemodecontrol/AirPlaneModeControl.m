//
//  AirPlaneModeControl.m
//  
//
//  Created by 戴曦嘉 on 2017/10/31.
//
//

#import "AirPlaneModeControl.h"
#import <dlfcn.h>

@implementation AirPlaneModeControl

- (void)changeAirPlaneMode {
    void *prefs = dlopen("/System/Library/PrivateFrameworks/Preferences.framework/Preferences", RTLD_LAZY);

    Class Prefs = [NSClassFromString(@"PSAirplaneModeSettingsDetail") class];
    if ([Prefs isEnabled]) {
        [Prefs setEnabled:NO];
        NSLog(@"close air plane mode");
    } else {
        [Prefs setEnabled:YES];
        NSLog(@"open air plane mode");
    }
    dlclose(prefs);
}

@end
