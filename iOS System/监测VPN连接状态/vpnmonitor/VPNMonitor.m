//
//  VPNMonitor.m
//  
//
//  Created by 戴曦嘉 on 2017/9/26.
//
//

#import "VPNMonitor.h"
#import "Header.h"

@implementation VPNMonitor

- (BOOL)checkVPNStatus {
    __block BOOL status = NO;
     NSBundle* vpnBundle = [NSBundle bundleWithPath:@"/System/Library/PreferenceBundles/VPNPreferences.bundle"];
    if ([vpnBundle load] == NO) {
        NSLog(@"bundle load failed");
        status = NO;
        return status;
    }
    VPNConnectionStore *vpnStore = [NSClassFromString(@"VPNConnectionStore") sharedInstance];
    __block VPNConnection *vpn = (VPNConnection *)[vpnStore currentConnectionWithGrade:[vpnStore currentOnlyConnectionGrade]];
    if (vpn == nil) {
        NSLog(@"not get VPN");
        status = NO;
        return status;
    }
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserverForName:@"VPNConnectionStatusChanged" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"vpnStatus--%llu",[vpn status]);
        if ([vpn status] == 1) {
            NSLog(@"not connected------");
            status = NO;
        } else if([vpn status] == 3){
            NSLog(@"connected-----");
            status = YES;
        } else if ([vpn status] == 2){
            NSLog(@"myconnecting-----");
            status = NO;
        }
    }];
    return status;
}


@end
