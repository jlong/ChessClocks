#import <UIKit/UIKit.h>
#import "ClockTime.h"
#import "TimePickerController.h"

@class NewGameViewController;

@protocol NewGameViewControllerDelegate <NSObject>

- (void)newGameViewControllerDidCancel:(NewGameViewController *)newGameViewController;
- (void)newGameViewController:(NewGameViewController *)newGameViewController didStart:(ClockTime *)clockTime;

@end


@interface NewGameViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, TimePickerControllerDelegate> {
}

@property (nonatomic, assign) id <NewGameViewControllerDelegate> delegate;
@property (nonatomic, retain, readonly) ClockTime *clockTime;

@property (nonatomic, retain) IBOutlet TimePickerController *gameLengthPickerController;
@property (nonatomic, assign) IBOutlet UITableView *settingsTableView;

- (IBAction) cancel:(id)sender;
- (IBAction) startNewGame:(id)sender;

@end