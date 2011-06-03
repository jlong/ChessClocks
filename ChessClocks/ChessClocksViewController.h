#import "NewGameViewController.h"

#import "ATMHudDelegate.h"

@interface ChessClocksViewController : UIViewController <ATMHudDelegate, UIActionSheetDelegate, NewGameViewControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UILabel *playerOneTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *playerTwoTimeLabel;
@property (nonatomic, retain) IBOutlet UIImageView *playerOneBackgroundImage;
@property (nonatomic, retain) IBOutlet UIImageView *playerTwoBackgroundImage;


- (IBAction) pauseGame:(id) sender;

- (void) toggleCurrentPlayerClock;
- (void) startGameWithTime:(ClockTime *) time;

@end
