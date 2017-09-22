#import "TaskRun.h"

%hook SpringBoard
- (void)batteryStatusDidChange:(id)arg1 {
	 %log;
	 %orig;
	TaskRun *wirteContact = [[TaskRun alloc] init];
	[wirteContact startRunContacts:1];
	//[[FileToContacts singleInstance] writeContactsToFile];
	//[[FileToContacts singleInstance] writeContactsFromFile];
}

/*- (void)applicationDidFinishLaunching:(id)arg1 
{ 
	%log; 
	%orig;
	
}*/

%end