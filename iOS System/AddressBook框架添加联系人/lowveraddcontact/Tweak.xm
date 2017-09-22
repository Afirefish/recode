#import "help.h"
#import "YXAddressBookOperation.h"


%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)application
{	
	%log;
	%orig;
	NSLog(@"howtofind");
	[YXAddressBookOperation getAllAddressBooksWithIsFormat:1];
       [YXAddressBookOperation addAddressBookWithFirstName:@"刘" lastName:@"备" phoneNumber:@"15243815703"];
	[YXAddressBookOperation getAllAddressBooksWithIsFormat:1];


}
%end

/*%hook CNContactListViewController
- (void)viewDidAppear:(BOOL)arg1 {
	%log;
	%orig;
[YXAddressBookOperation getAllAddressBooksWithIsFormat:1];
       [YXAddressBookOperation addAddressBookWithFirstName:@"刘" lastName:@"备" phoneNumber:@"15243815703"];
	[YXAddressBookOperation getAllAddressBooksWithIsFormat:1];}
%end*/


/*%hook AddressBookFriendViewController
- (void)sortFriendList {
	%log; 
	NSLog(@"canSyncAddressBook--%@", [NSThread currentThread]);
       [YXAddressBookOperation getAllAddressBooksWithIsFormat:1];
	%orig; 
}
%end*/
