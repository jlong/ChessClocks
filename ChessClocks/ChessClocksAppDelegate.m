#import "ChessClocksAppDelegate.h"

#import "WelcomeViewController.h"
#import "ChessClocksViewController.h"

@implementation ChessClocksAppDelegate

@synthesize window=_window;
@synthesize welcomeViewController=_welcomeViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [application setStatusBarHidden:YES];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)dealloc
{
  [_welcomeViewController release];
  [_window release];
  [super dealloc];
}


#pragma mark
#pragma mark WelcomeViewControllerDelegate

- (void)welcomeViewControllerNewGame:(WelcomeViewController *)viewController;
{
  [[UIApplication sharedApplication]setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
  NewGameViewController *newGameController = [[NewGameViewController alloc]initWithNibName:@"NewGameViewController" bundle:nil];
  newGameController.delegate = self;
  [self.welcomeViewController presentModalViewController:newGameController animated:YES];
  [newGameController release];
}


#pragma mark
#pragma mark NewGameViewControllerDelegate

- (void)newGameViewControllerDidCancel:(NewGameViewController *)newGameViewController
{
  [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
  [self.welcomeViewController dismissModalViewControllerAnimated:YES];
}

- (void)newGameViewController:(NewGameViewController *)newGameViewController didStart:(ClockTime *)clockTime
{
  [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];

  ChessClocksViewController *chessClocksViewController = [[ChessClocksViewController alloc] initWithNibName:@"ChessClocksViewController" bundle:nil];
  self.window.rootViewController = chessClocksViewController;
  [chessClocksViewController startGameWithTime:clockTime];

  [chessClocksViewController release];
  [_welcomeViewController release];
}

@end
