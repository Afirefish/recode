#import "AddContact.h"

%hook CNContactListViewController
- (void)viewDidAppear:(BOOL)arg1 {
	%log;
	%orig;
	[[AddContact singleInstance] addContact];
}
%end