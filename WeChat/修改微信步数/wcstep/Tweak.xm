%hook MicroMessengerAppDelegate
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {
	%log;
	_Bool r = %orig;
	NSString *myWXID = [NSClassFromString(@"SettingUtil") performSelector:@selector(getCurUsrName)];
	NSLog(@"myWXID %@",myWXID);
	return r;
}
%end;


%hook WCDeviceStepObject
- (unsigned int)m7StepCount {
	%log;
	unsigned int r = %orig;
	NSLog(@"这个不能直接改了吗？%u",r);
  	return 10000;
}

- (unsigned int)hkStepCount {
	%log;
	unsigned int r = %orig;
	NSLog(@"这个！！不能直接改了吗？%u",r);
  	return 10000;
}

%end

%hook HealthKitSampleSource
- (unsigned int)uiStepCount {
	%log;
	unsigned int r = %orig;
	NSLog(@"这个呢 不能直接改了吗？%u",r);
	return 10000;
}
%end