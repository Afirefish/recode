//
//  RequestOK.m
//  
//
//  Created by 戴曦嘉 on 2017/10/10.
//
//

#import "RequestOK.h"
#import "RequestOKHelp.h"

@implementation RequestOK

#import "RequestOKHelp.h"

- (void)runTask {
    SayHelloViewController *sayHello = [[[NSClassFromString(@"SayHelloViewController") class] alloc] init];
    SayHelloDataLogic *logic = [[[NSClassFromString(@"SayHelloDataLogic") class] alloc] initWithScene:3 delegate: sayHello];
    [logic getChatName:3];
    [logic loadData:3];
    [sayHello initData];
    [sayHello initTableView];
    [sayHello initView];
    UITabBarController *rootViewController = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController *mmNavigation = (UINavigationController *)[rootViewController selectedViewController];
    [mmNavigation  pushViewController: sayHello animated:YES];
    NSMutableDictionary *dicv1 = [logic valueForKey:@"m_dicSections"];
    NSArray *v1Arr = [dicv1 objectForKey:@"Hello_ContactListLatest"];
    NSLog(@"dic?----%@",[dicv1 objectForKey:@"Hello_ContactListLatest"]);
    NSInteger count = [v1Arr count];
    //NSLog(@"v1 count is %ld",(long)count);
    for (int i = 0; i < count; ++i)
    {
        id con = [logic getContactForUserName:[v1Arr objectAtIndex:i]];
        NSLog(@"contact information ---------%@",con);
        NSNumber *friendScene = (NSNumber *)[con valueForKey:@"m_uiFriendScene"];
        unsigned int scene = [friendScene integerValue];
        if (scene == 3)
        {
            [sayHello verifyContactWithOpCode:con opcode:3];
            NSLog(@"the %d friend add ok",i);
        }
    }
}

@end
