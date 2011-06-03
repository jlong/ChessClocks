#import "ChessClocksAppDelegate.h"
#import "ChessClocksViewController.h"
#import "PlayerClock.h"

@implementation ChessClocksViewController

@synthesize game=_game;
@synthesize playerOneTimeLabel, playerTwoTimeLabel;
@synthesize playerOneBackgroundImage, playerTwoBackgroundImage;


- (void)updateClockDisplay
{
  playerOneTimeLabel.text = _game.clockOne.clockTime.string;
  playerTwoTimeLabel.text = _game.clockTwo.clockTime.string;
  self.playerOneBackgroundImage.highlighted = (_game.clockOne == _game.currentClock);
  self.playerTwoBackgroundImage.highlighted = (_game.clockTwo == _game.currentClock);
}

- (void)setGame:(ChessGame *)game {
  static NSString *clockTimeKeyPath = @"clockTime";
  static NSString *currentClockKeyPath = @"currentClock";

  [self willChangeValueForKey:@"game"];
  
  if (_game != nil) {
    [_game removeObserver:self forKeyPath:currentClockKeyPath];
    [_game.clockOne removeObserver:self forKeyPath:clockTimeKeyPath];
    [_game.clockTwo removeObserver:self forKeyPath:clockTimeKeyPath];
    [_game release];
  }
  
  _game = [game retain];
  [_game addObserver:self forKeyPath:currentClockKeyPath options:0 context:nil];
  [_game.clockOne addObserver:self forKeyPath:clockTimeKeyPath options:0 context:nil];
  [_game.clockTwo addObserver:self forKeyPath:clockTimeKeyPath options:0 context:nil];
  
  [self updateClockDisplay];
  
  [self didChangeValueForKey:@"game"];
}

- (IBAction)pauseGame:(id) sender
{
  ChessClocksAppDelegate *appDelegate = (ChessClocksAppDelegate*) [[UIApplication sharedApplication] delegate];
  [appDelegate pauseGame];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  [self updateClockDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  [_game toggleClocks];
}

@end
