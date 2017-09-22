%hook SBScreenFlash
- (void)flashColor:(id)arg1 withCompletion:(id)arg2
{
	arg1=[UIColor magentaColor];
	%orig;
	
}
%end