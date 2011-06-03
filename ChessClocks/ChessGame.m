#import "ChessGame.h"

@implementation ChessGame

@synthesize clockOne=_clockOne;
@synthesize clockTwo=_clockTwo;
@synthesize currentClock=_currentClock;
@synthesize runningClocks=_runningClocks;

- (id)initWithTime:(ClockTime *)time
{
  if ((self = [super init]) != nil) {
    self.clockOne = [PlayerClock clockWithTime:time];
    self.clockTwo = [PlayerClock clockWithTime:time];
  }
  return self;
}

- (void)startClocks
{
  if (_currentClock == nil)
    self.currentClock = _clockOne;
  [_currentClock startCountdown];
  _runningClocks = YES;
}

- (void)stopClocks
{
  [_currentClock stopCountdown];
  _runningClocks = NO;
}

- (void) toggleClocks
{
  [_currentClock stopCountdown];
  if (_clockOne == _currentClock) {
    self.currentClock = _clockTwo;
  } else {
    self.currentClock = _clockOne;
  }
  [_currentClock startCountdown];
}


@end
