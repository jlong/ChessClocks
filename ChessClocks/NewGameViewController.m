#import "NewGameViewController.h"


@implementation NewGameViewController

@synthesize delegate;

- (IBAction) cancel:(id)sender {
  [delegate newGameViewControllerDidCancel:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

@end
