#import "ChessClocksAppDelegate.h"

#import "ChessClocksViewController.h"

@implementation ChessClocksAppDelegate


@synthesize window=_window;

@synthesize viewController=_viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window.rootViewController = self.viewController;
  [self.window makeKeyAndVisible];
  [self.viewController startGameWithTimeInterval:5];
  return YES;
}

- (void)dealloc
{
  [_window release];
  [_viewController release];
    [super dealloc];
}

@end