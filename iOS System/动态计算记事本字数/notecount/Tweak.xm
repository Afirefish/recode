/*#import "note.h"
%hook ICNoteEditorViewController
- (void)viewWillAppear:(BOOL)arg1 // initialize title
{
      %orig;
      NSString *content = self.note.title;
      NSString *contentLength = [NSString stringWithFormat:@"%lu",(unsigned long)[content length]];
      self.title = contentLength;
}

- (void)viewDidDisappear:(BOOL)arg1 // reset title
{
      %orig;
      self.title = nil;
}

- (void)textViewDidChange:(UITextView *)arg1 // Update title
{
      %orig;
      NSString *content = self.textView.text;
      NSString *contentLength = [NSString stringWithFormat:@"%lu",(unsigned long)[content length]];
      self.title = contentLength;
}
%end*/

#import "note.h"
%hook ICNoteEditorViewController
- (void)viewDidLoad
{
	%orig;
	//NSLog(@"start editing");
	[self setTitle:@"Show Note Count!"];
}

- (void)textViewDidChange:(id)arg1
{
	%orig;
	ICNote *note=self.note;
	NSString *text=note.title;
	NSString *count=
	[NSString stringWithFormat:@"%lu",(unsigned long)[text length]];
	[self setTitle:count];
}
%end