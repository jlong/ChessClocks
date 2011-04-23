#import "PlayerClock.h"

@interface PlayerClock()

@property (nonatomic, retain, readwrite) ClockTime *clockTime;
@property (nonatomic, retain, readwrite) NSTimer *timer;

@end


@implementation PlayerClock

@synthesize clockTime;
@synthesize timer;

+ (PlayerClock *) clockWithTime:(ClockTime *) time {
  PlayerClock *clock = [[[PlayerClock alloc] init] autorelease];
  clock.clockTime = time;
  return clock;
}

- (void) startCountdown {
  self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

- (void) stopCountdown {
  if (timer) {
    [timer invalidate];
    self.timer = nil;
  }
}

- (void) tick {
  if ([clockTime isExpired])
    [self stopCountdown];
  else
    self.clockTime = [clockTime timeDecremented];
}

- (void) dealloc {
  [self stopCountdown];
  [super dealloc];
}

@end
