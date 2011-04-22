#import "ChessClocksAppDelegate.h"
#import "ChessClocksViewController.h"
#import "NewGameViewController.h"
#import "ClockTime.h"
#import "PlayerClock.h"

@interface ChessClocksViewController()

@property (nonatomic, retain) PlayerClock *playerClockOne;
@property (nonatomic, retain) PlayerClock *playerClockTwo;
@property (nonatomic, retain) PlayerClock *currentPlayerClock;

- (void)showPauseGameActionSheet;
- (void)showNewGameView;
- (void)startClocks;
- (void)stopClocks;

@end


@implementation ChessClocksViewController

@synthesize playerClockOne, playerClockTwo, currentPlayerClock;
@synthesize playerOneTimeLabel, playerTwoTimeLabel;

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  switch (buttonIndex) {
    case 0: // New Game
      [self showNewGameView];
      break;
    case 1: // Resume
      [self startClocks];
      break;
  }
}

- (void) newGameViewController:(id)newGameViewController didStart:(ClockTime *)clockTime {
  [self dismissModalViewControllerAnimated:YES];
  [self startGameWithTime:clockTime];
}

- (void) newGameViewControllerDidCancel:(id)newGameViewController {
  [self dismissModalViewControllerAnimated:YES];
  [self showPauseGameActionSheet];
}

- (void) showNewGameView {
  NewGameViewController *newGameController = [[NewGameViewController alloc]initWithNibName:@"NewGameViewController" bundle:nil];
  newGameController.delegate = self;
  [self presentModalViewController:newGameController animated:YES];
  [newGameController release];
}

- (IBAction) pauseGame:(id) sender {
  [self stopClocks];
  [self showPauseGameActionSheet];
}

- (void) showPauseGameActionSheet {
  UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Paused" delegate:self cancelButtonTitle:@"Resume" destructiveButtonTitle:nil otherButtonTitles:@"New Game", nil];
  [actionSheet showInView:self.view];
  [actionSheet release];
}

- (void) setCurrentPlayerClock:(PlayerClock *)clock {
  if (currentPlayerClock != nil) {
    [currentPlayerClock removeObserver:self forKeyPath:@"remainingSeconds"];
    [currentPlayerClock release];
  }
  currentPlayerClock = [clock retain];
  [currentPlayerClock addObserver:self forKeyPath:@"remainingSeconds" options:0 context:nil];
}

- (void) startGameWithTime:(ClockTime *) time {
  self.playerClockOne = [PlayerClock clockWithTime:time];
  self.playerClockTwo = [PlayerClock clockWithTime:time];
  self.currentPlayerClock = playerClockOne;
  [self startClocks];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if (object == playerClockOne)
    playerOneTimeLabel.text = playerClockOne.remainingTimeAsString;
  else if (object == playerClockTwo)
    playerTwoTimeLabel.text = playerClockTwo.remainingTimeAsString;
}

- (void)startClocks {
  playerOneTimeLabel.text = playerClockOne.remainingTimeAsString;
  playerTwoTimeLabel.text = playerClockTwo.remainingTimeAsString;
  [currentPlayerClock startCountdown];
}

- (void)stopClocks {
  [currentPlayerClock stopCountdown];
}

- (void) toggleCurrentPlayerClock {
  [currentPlayerClock stopCountdown];
  if (playerClockOne == currentPlayerClock)
    self.currentPlayerClock = playerClockTwo;
  else
    self.currentPlayerClock = playerClockOne;
  [currentPlayerClock startCountdown];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  [self toggleCurrentPlayerClock];
}

@end
