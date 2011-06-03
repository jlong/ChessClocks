#import "WelcomeViewController.h"
#import "ChessClocksAppDelegate.h"

@implementation WelcomeViewController

- (IBAction)newGame:(id)sender
{
  ChessClocksAppDelegate *appDelegate = (ChessClocksAppDelegate*) [[UIApplication sharedApplication] delegate];
  [appDelegate newGame];
}

@end
