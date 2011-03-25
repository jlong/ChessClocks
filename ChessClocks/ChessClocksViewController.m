#import "ChessClocksViewController.h"
#import "PlayerClock.h"

@interface ChessClocksViewController()

@property (nonatomic, retain) PlayerClock *playerClockOne;
@property (nonatomic, retain) PlayerClock *playerClockTwo;
@property (nonatomic, retain) PlayerClock *currentPlayerClock;

- (void)startClocks;

@end


@implementation ChessClocksViewController

@synthesize playerClockOne, playerClockTwo, currentPlayerClock;
@synthesize playerOneTimeLabel, playerTwoTimeLabel;

- (void) startGameWithTimeInterval:(NSTimeInterval) seconds {
  self.playerClockOne = [PlayerClock clockWithSeconds:seconds];
  [playerClockOne addObserver:self forKeyPath:@"remainingSeconds" options:0 context:nil];
  
  self.playerClockTwo = [PlayerClock clockWithSeconds:seconds];
  [playerClockTwo addObserver:self forKeyPath:@"remainingSeconds" options:0 context:nil];

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

- (void) toggleCurrentPlayerClock {
  [currentPlayerClock stopCountdown];
  if (playerClockOne == currentPlayerClock)
    currentPlayerClock = playerClockTwo;
  else
    currentPlayerClock = playerClockOne;
  [currentPlayerClock startCountdown];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  [self toggleCurrentPlayerClock];
}

@end
