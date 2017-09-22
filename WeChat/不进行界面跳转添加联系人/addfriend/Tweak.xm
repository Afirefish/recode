#import "addFriend.h"



%hook NewMainFrameViewController
- (void)viewDidAppear:(BOOL)animated {
	%log;
	%orig;
	CContactMgr *con = [[%c(CContactMgr) alloc] init];
	CContact *contact  = (CContact *)[con getContactForSearchByName:@"v1_d3813462982a480ce7791ceb234376e084c199d0faae05d05e966d07a4df5fd0595fb668c82e370bb8c78f2586cfb885@stranger"];
	NSLog(@"give me value----%@", contact);
	ContactInfoViewController *contactViewController = [[objc_getClass("ContactInfoViewController") alloc] init];
	[contact setM_nsUsrName:@"v1_d3813462982a480ce7791ceb234376e084c199d0faae05d05e966d07a4df5fd0595fb668c82e370bb8c78f2586cfb885@stranger"];
	[contact setM_nsAntispamTicket:@"v2_d0541c3b7241b51d016fb19fb88fb9dfd6989f3145c2803f5d8d563e1479d3f0b10c8125124dd7c1aadfbb82ce80d92f@stranger"];
	[contact setM_bFromNewDB:1];
        [contact setM_uiType:0];
        [contact setM_uiFriendScene:3];
        [contactViewController setM_contact:contact];
        [contactViewController setM_uiFromScene: 6];
        [contactViewController setM_uiAddFriendStatScene:2];
        [contactViewController updateContactFromServer];
        [contactViewController checkNeedForcedUpdateForMemberDetail];
	UITabBarController *rootViewController = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
	UINavigationController *mmNavigation = (UINavigationController *)[rootViewController selectedViewController];
	[mmNavigation  pushViewController:contactViewController animated:YES];
}
%end

%hook CBaseContact
- (NSString *)m_nsEncodeUserName 
{ %log; NSString * r = %orig; HBLogDebug(@" m_nsEncodeUserName = %@", r); return r; }
- (NSString *)m_nsUsrName 
{ %log; NSString * r = %orig; HBLogDebug(@" m_nsEncodeUserName = %@", r); return r; }

%end
