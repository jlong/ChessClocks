#import <UIKit/UIKit.h>

@interface ChessClocksViewController : UIViewController {
    
}

@property (nonatomic, retain) IBOutlet UILabel *playerOneTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *playerTwoTimeLabel;

- (void) toggleCurrentPlayerClock;
- (void) startGameWithTimeInterval:(NSTimeInterval) seconds;

@end
