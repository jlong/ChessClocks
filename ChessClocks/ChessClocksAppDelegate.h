#include "WelcomeViewController.h"
#include "NewGameViewController.h"

@interface ChessClocksAppDelegate : NSObject <UIApplicationDelegate, NewGameViewControllerDelegate, WelcomeViewControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WelcomeViewController *welcomeViewController;

@end
