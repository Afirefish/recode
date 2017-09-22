%hook MMSearchBar
- (_Bool)searchBar:(id)arg1 shouldChangeTextInRange:(struct _NSRange)arg2 replacementText:(id)arg3 {
	%log;
	return YES;
}
%end