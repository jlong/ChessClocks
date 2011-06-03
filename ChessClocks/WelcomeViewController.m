#import "WelcomeViewController.h"

@implementation WelcomeViewController

@synthesize delegate=_delegate;

- (IBAction)newGame:(id)sender
{
  [self.delegate welcomeViewControllerNewGame:self];
}

@end
