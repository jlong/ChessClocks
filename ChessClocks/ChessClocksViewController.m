#import "ChessClocksAppDelegate.h"
#import "ChessClocksViewController.h"
#import "NewGameViewController.h"
#import "PlayerClock.h"
#import "ATMHud.h"

@interface ChessClocksViewController()

@property (nonatomic, retain) PlayerClock *playerClockOne;
@property (nonatomic, retain) PlayerClock *playerClockTwo;
@property (nonatomic, retain) PlayerClock *currentPlayerClock;

- (void)showPauseGameActionSheet;
- (void)showNewGameView;
- (void)hideNewGameView;
- (void)startGame;
- (void)startClocks;
- (void)stopClocks;
- (void)updateClockDisplay;

@end


@implementation ChessClocksViewController

@synthesize playerClockOne, playerClockTwo, currentPlayerClock;
@synthesize playerOneTimeLabel, playerTwoTimeLabel;
@synthesize playerOneBackgroundImage, playerTwoBackgroundImage;

#pragma mark
#pragma mark Overlay

- (void) showStartMessage:(NSString *)message
{
  ATMHud *hud = [[ATMHud alloc] initWithDelegate:self];
  [self.view addSubview:hud.view];
  [hud release];
  [hud setCaption:message];
  [hud show];
}

- (void)userDidTapHud:(ATMHud *)_hud
{
  [_hud hide];
  [self startGame];
}

#pragma mark
#pragma mark Pause Game

- (IBAction)pauseGame:(id) sender
{
  [self stopClocks];
  [self showPauseGameActionSheet];
}

- (void)showPauseGameActionSheet
{
  UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Paused" delegate:self cancelButtonTitle:@"Resume" destructiveButtonTitle:nil otherButtonTitles:@"New Game", nil];
  [actionSheet showInView:self.view];
  [actionSheet release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
  switch (buttonIndex) {
    case 0: // New Game
      [self showNewGameView];
      break;
    case 1: // Resume
      [self startClocks];
      break;
  }
}


#pragma mark
#pragma mark New Game

- (void)showNewGameView
{
  [[UIApplication sharedApplication]setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
  NewGameViewController *newGameController = [[NewGameViewController alloc]initWithNibName:@"NewGameViewController" bundle:nil];
  newGameController.delegate = self;
  [self presentModalViewController:newGameController animated:YES];
  [newGameController release];
}

- (void)hideNewGameView
{
  [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
  [self dismissModalViewControllerAnimated:YES];
}

- (void)newGameViewController:(id)newGameViewController didStart:(ClockTime *)clockTime
{
  [self hideNewGameView];
  [self startGameWithTime:clockTime];
}

- (void)newGameViewControllerDidCancel:(id)newGameViewController
{
  [self hideNewGameView];
  [self showPauseGameActionSheet];
}


#pragma mark
#pragma mark Game

- (void)setCurrentPlayerClock:(PlayerClock *)clock
{
  static NSString *keyPath = @"clockTime";
  
  if (currentPlayerClock != nil) {
    [currentPlayerClock removeObserver:self forKeyPath:keyPath];
    [currentPlayerClock release];
  }
  
  currentPlayerClock = [clock retain];
  
  self.playerOneBackgroundImage.highlighted = (playerClockOne == currentPlayerClock);
  self.playerTwoBackgroundImage.highlighted = (playerClockTwo == currentPlayerClock);

  [currentPlayerClock addObserver:self forKeyPath:keyPath options:0 context:nil];
}

- (void)startGame
{
  self.currentPlayerClock = playerClockOne;
  [self startClocks];
}

- (void)startGameWithTime:(ClockTime *) time
{
  self.playerClockOne = [PlayerClock clockWithTime:time];
  self.playerClockTwo = [PlayerClock clockWithTime:time];
  [self updateClockDisplay];
  [self showStartMessage: @"Tap anywhere to start.\nTap again to switch clocks."];
}

- (void)updateClockDisplay
{
  playerOneTimeLabel.text = playerClockOne.clockTime.string;
  playerTwoTimeLabel.text = playerClockTwo.clockTime.string;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  [self updateClockDisplay];
}

- (void)startClocks
{
  [currentPlayerClock startCountdown];
}

- (void)stopClocks
{
  [currentPlayerClock stopCountdown];
}

- (void) toggleCurrentPlayerClock
{
  [currentPlayerClock stopCountdown];
  if (playerClockOne == currentPlayerClock) {
    self.currentPlayerClock = playerClockTwo;
  } else {
    self.currentPlayerClock = playerClockOne;
  }
  [currentPlayerClock startCountdown];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  [self toggleCurrentPlayerClock];
}

@end
