#import <UIKit/UIKit.h>
#import "NewGameViewController.h"

@interface ChessClocksViewController : UIViewController <UIActionSheetDelegate, NewGameViewControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UILabel *playerOneTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *playerTwoTimeLabel;

- (IBAction) pauseGame:(id) sender;

- (void) toggleCurrentPlayerClock;
- (void) startGameWithTimeInterval:(NSTimeInterval) seconds;

@end
