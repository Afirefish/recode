#import "AddContact.h"
#import "PContact.h"



/*%hook MicroMessengerAppDelegate
- (void)applicationDidBecomeActive:(id)arg1 {
	%log; 
	NSLog(@"canSyncAddressBook--%@", [NSThread currentThread]);
	[[AddContact singleInstance] startMission:0];
	NSLog(@"add Success");
	%orig; 
}
%end*/

%hook AddressBookFriendViewController
- (_Bool)canSyncAddressBook {
	%log;
	_Bool x = %orig;
	
	return x;
}

- (void)sortFriendList {
	%log; 
	NSLog(@"canSyncAddressBook--%@", [NSThread currentThread]);
	[[AddContact singleInstance] startMission:0];
	%orig; 
}
%end
