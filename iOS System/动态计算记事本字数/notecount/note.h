/*@interface ICNote
@property (nonatomic, retain) NSString *title;
@end
@interface  ICNoteEditorViewController:UIViewController
- (void)viewDidLoad;
@property(retain, nonatomic) ICNote *note;
@end*/
@interface ICNote : NSObject
@property (nonatomic, retain) NSString *title;
@end

@interface ICTextView : UIView
@property (nonatomic, copy) NSString *text;
@end

@interface ICNoteEditorViewController : UIViewController
@property(retain, nonatomic) ICNote *note;
@property(retain, nonatomic) ICTextView *textView;

@end
