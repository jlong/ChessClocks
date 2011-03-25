#import <UIKit/UIKit.h>
#import "NewGameViewControllerDelegate.h"

@interface NewGameViewController : UIViewController {

}

@property (nonatomic, retain) id <NewGameViewControllerDelegate> delegate;

- (IBAction) cancel:(id)sender;

@end