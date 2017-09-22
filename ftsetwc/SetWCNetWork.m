//
//  SetWCNetWork.m
//  
//
//  Created by 戴曦嘉 on 2017/9/20.
//
//

#import "SetWCNetWork.h"
#import "NetHelp.h"
#import <dlfcn.h>

@implementation SetWCNetWork

- (void)openWCNetwork {
    
    //打开私有c函数的框架的动态库
    void *CoreTelephonyHandle = dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", RTLD_LAZY);
    //打开设置的ui框架的动态库
    void *AppCellularUsage = dlopen("/System/Library/PrivateFrameworks/PreferencesUI.framework/PreferencesUI", RTLD_LAZY);
    //打开微信app设置的框架的动态库
    void *SystemPolicyForApp = dlopen("/System/Library/PrivateFrameworks/Preferences.framework/Preferences", RTLD_LAZY);
    
    //私有c函数的调用
    NSLog(@"getThere1");
    CFTypeRef (*connectionCreateOnTargetQueue)(CFAllocatorRef, NSString *, dispatch_queue_t, void*) = dlsym(CoreTelephonyHandle, "_CTServerConnectionCreateOnTargetQueue");
    NSLog(@"getThere2");
    int (*changeCellularPolicy)(CFTypeRef, NSString *, NSDictionary *) = dlsym(CoreTelephonyHandle, "_CTServerConnectionSetCellularUsagePolicy");
    if (!connectionCreateOnTargetQueue || !changeCellularPolicy) {
        NSLog(@"ZIKCellularAuthorization：调用changeCellularPolicy失败");
        return;
    }else {
        NSLog(@"success0");
    }
    NSLog(@"getThere3");
    CFTypeRef connection = connectionCreateOnTargetQueue(kCFAllocatorDefault,@"com.apple.Preferences",dispatch_get_main_queue(),NULL);
    NSLog(@"getThere4");
    int x = changeCellularPolicy(connection, @"com.tencent.xin", @{@"kCTCellularUsagePolicyDataAllowed":@(YES)});
    NSLog(@"getThere5--%d",x);
    
   //高层设置权限的调用
    Class PSSystemPolicyForApp = NSClassFromString(@"PSSystemPolicyForApp");
    id systemPolicyForApp = [[PSSystemPolicyForApp alloc] init];
    [systemPolicyForApp performSelector:NSSelectorFromString(@"setBundleIdentifier:") withObject:@"com.tencent.xin"];
    
    Class PSUIAppCellularUsageGroupController = NSClassFromString(@"PSUIAppCellularUsageGroupController");
    id appCellularUsageGroupController = [[PSUIAppCellularUsageGroupController alloc] init];
    [appCellularUsageGroupController performSelector:NSSelectorFromString(@"setEnabled:") withObject:@(YES)];
    
    Class PSSpecifier = NSClassFromString(@"PSSpecifier");
    id specifier = [PSSpecifier performSelector:NSSelectorFromString(@"groupSpecifierWithID:") withObject:@"com.tencent.xin"];
    [specifier performSelector:NSSelectorFromString(@"setTarget:") withObject:appCellularUsageGroupController];
    [specifier performSelector:NSSelectorFromString(@"setCellType:") withObject:@6];
    [specifier performSelector:NSSelectorFromString(@"setName:") withObject:@"\xe5\xbe\xae\xe4\xbf\xa1"];
    NSLog(@"what this--%@",specifier);
    
    [appCellularUsageGroupController performSelector:NSSelectorFromString(@"setAppCellularDataEnabled:forSpecifier:") withObject:@(YES) withObject:specifier];
    [systemPolicyForApp performSelector:NSSelectorFromString(@"setAppCellularDataEnabled:forSpecifier:")withObject:@(YES) withObject:specifier];
    NSLog(@"getHere");
    //关闭这些动态库
    dlclose(SystemPolicyForApp);
    dlclose(AppCellularUsage);
    dlclose(CoreTelephonyHandle);


}


@end
