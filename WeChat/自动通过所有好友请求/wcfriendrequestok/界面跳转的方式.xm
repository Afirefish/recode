//界面跳转

%hook SayHelloViewController
- (void)viewDidAppear:(BOOL)animated {
    %log;
    %orig;
    MMTableView *tableView = [self valueForKey:@"m_tableView"];
    NSInteger row = [tableView numberOfRowsInSection:0];
    for ( NSInteger x = 0; x < row - 1; x ++){
        NSIndexPath *index = [NSIndexPath indexPathForRow:x inSection:0];
        ContactsItemCell *cell = [self tableView:tableView cellForRowAtIndexPath:index];
        UITableViewCellContentView *contentView = [cell valueForKey:@"contentView"];
        ContactsItemView *targetView = [[contentView subviews] firstObject];
        if ( [[[targetView subviews] lastObject]  isKindOfClass:[NSClassFromString(@"FixTitleColorButton") class]]) {
            [self onContactsItemViewRightButtonClick:targetView];
        }
    }
}
%end

%hook ContactInfoViewController
- (void)viewDidAppear:(BOOL)animated {
    %log;
    %orig;
    [(UINavigationController *)[self parentViewController] popViewControllerAnimated:YES];
}
%end