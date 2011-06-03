#import <UIKit/UIKit.h>

@class WelcomeViewController;

@protocol WelcomeViewControllerDelegate <NSObject>

- (void)welcomeViewControllerNewGame:(WelcomeViewController *)viewController;

@end

@interface WelcomeViewController : UIViewController {
    
}

@property (nonatomic, assign) IBOutlet id <WelcomeViewControllerDelegate> delegate;

- (IBAction)newGame:(id)sender;

@end
