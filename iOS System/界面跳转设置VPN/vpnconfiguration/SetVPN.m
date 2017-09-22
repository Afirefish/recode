//
//  SetVPN.m
//  
//
//  Created by 戴曦嘉 on 2017/8/23.
//
//

#import "SetVPN.h"
#import "VPNHelp.h"

@implementation SetVPN

- (void)runTask:(NSString *)taskName inContoller:(PSListController *)vpnController {
    if ([taskName isEqualToString:@"addVPN"]) {//添加vpn
        NSDictionary *dic = @{@"VPNType":@"PPTP",
                              @"DisplayName":@"baka",
                              @"Server":@"123",
                              @"Username":@"123",
                              @"Password":@"123"};
        [self addVPNConfiguration:dic inContoller:vpnController];
    } else if ([taskName isEqualToString:@"chooseVPN"]) {//选择某个vpn
        NSString *targetVPN = @"baka";
        [self chooseVPN:targetVPN inContoller:vpnController];
    } else if ([taskName isEqualToString:@"openVPN"]) {//打开vpn
        [self openVPNConnection:vpnController];
    } else if ([taskName isEqualToString:@"closeVPN"]) {//关闭vpn
        [self closeVPNConnection:vpnController];
    } else if ([taskName isEqualToString:@"openVPNCon"]){// 打开添加vpn配置
        [self openVPNConfiguration:vpnController];
    } else {//错误的任务参数
        NSLog(@"this is not my bussiness");
    }//end if
}

- (void)openVPNConfiguration:(PSListController *)vpnController {//打开添加vpn配置
    if ([vpnController isKindOfClass:NSClassFromString(@"VPNController")]) {//在正确的控制器内打开
        VPNController *targetController = (VPNController *)vpnController;
        UITableView *VPNTableView = (UITableView *)[targetController valueForKey:@"_table"];
        NSInteger section = [VPNTableView numberOfSections];
        NSIndexPath *addPath = [NSIndexPath indexPathForRow:0 inSection:section-1];
        [targetController tableView:VPNTableView didSelectRowAtIndexPath: addPath];
    } else {
        NSLog(@"wrong controller");
    }//end if
}


- (void)addVPNConfiguration:(NSDictionary *)vpnDic inContoller:(PSListController *)vpnController {//添加vpn配置
    if ([vpnController isKindOfClass:NSClassFromString(@"VPNSetupListController")]) {//在添加vpn的控制器内操作
        VPNSetupListController *targetController = (VPNSetupListController *)vpnController;
        [targetController setVPNType:@"PPTP" forSpecifier:nil];
        [targetController setDisplayName:@"baka" forSpecifier:nil];
        [targetController setServer:@"123" forSpecifier:nil];
        [targetController setUsername:@"123" forSpecifier:nil];
        [targetController setPassword:@"123" forSpecifier:nil];
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        UISplitViewController *rootVC = (UISplitViewController *)keyWindow.rootViewController;
        UINavigationController *navigationController = (UINavigationController *)[[rootVC viewControllers] firstObject];
        UINavigationBar *navigationBar = [navigationController navigationBar];
        UIView *targetView = [[navigationBar subviews] objectAtIndex:[[navigationBar subviews] count]-2];//获得完成的button
        [targetController saveButtonClicked: targetView];
        NSLog(@"gettheButton");
    } else {
        NSLog(@"wrong controller");
    }//end if
}

- (void)chooseVPN:(NSString *)targetVPN inContoller:(PSListController *)vpnController{//选择和传入名字一致的vpn
    if ([vpnController isKindOfClass:NSClassFromString(@"VPNController")]) {
        VPNController *targetController = (VPNController *)vpnController;
        UITableView *VPNTableView = (UITableView *)[targetController valueForKey:@"_table"];
        NSInteger section = [VPNTableView numberOfSections];
        if (section == 3) {//只有当存在至少一个vpn时才能选择
            for (NSInteger row = 0; row < [VPNTableView numberOfRowsInSection:1];row++) {//遍历所有vpn
                NSIndexPath *vpnPath = [NSIndexPath indexPathForRow:row inSection:1];
                UITableViewCell *vpnCell = [targetController tableView:VPNTableView cellForRowAtIndexPath: vpnPath];
                if ([[[vpnCell textLabel] text]  isEqualToString:targetVPN]) {//找到所需的vpn
                    [targetController tableView:VPNTableView didSelectRowAtIndexPath:vpnPath];
                    break;
                }
                else {
                    NSLog(@"not this vpn");
                }//end if
            }//end for
        } else {
            NSLog(@"there are not enough vpn");
        }//end if
    } else {
        NSLog(@"wrong controller");
    }//end if
}

- (void)openVPNConnection:(PSListController *)vpnController{//打开vpn的开关
    if ([vpnController isKindOfClass:NSClassFromString(@"VPNController")]) {
        VPNController *targetController = (VPNController *)vpnController;
        UITableView *VPNTableView = (UITableView *)[targetController valueForKey:@"_table"];
        NSInteger section = [VPNTableView numberOfSections];
        if (section == 3) {//至少配置了一个vpn才能打开
            NSIndexPath *openPath = [NSIndexPath indexPathForRow:0 inSection:0];
            UITableViewCell *toggleCell = [targetController tableView:VPNTableView cellForRowAtIndexPath: openPath];
            UIView *openSwitch = [[toggleCell subviews] objectAtIndex:[[toggleCell subviews] count]-2];
            [targetController startEnterpriseConnection: openSwitch];
        } else {
            NSLog(@"there are not enough vpn");
        }//end if
    } else {
        NSLog(@"wrong controller");
    }//end if
}


- (void)closeVPNConnection:(PSListController *)vpnController{//关闭vpn的开关
    if ([vpnController isKindOfClass:NSClassFromString(@"VPNController")]) {
        VPNController *targetController = (VPNController *)vpnController;
        UITableView *VPNTableView = (UITableView *)[targetController valueForKey:@"_table"];
        NSInteger section = [VPNTableView numberOfSections];
        if (section == 3) {//至少配置了一个vpn才能关闭
            NSIndexPath *openPath = [NSIndexPath indexPathForRow:0 inSection:0];
            UITableViewCell *toggleCell = [targetController tableView:VPNTableView cellForRowAtIndexPath: openPath];
            UIView *openSwitch = [[toggleCell subviews] objectAtIndex:[[toggleCell subviews] count]-2];
            [targetController cancelEnterpriseConnection: openSwitch];
        } else {
            NSLog(@"there are not enough vpn");
        }//end if
    } else {
        NSLog(@"wrong controller");
    }//end if
}


@end
