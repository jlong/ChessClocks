#import "PlayerClock.h"

@interface PlayerClock()

@property (nonatomic, readwrite) NSTimeInterval startSeconds;
@property (nonatomic, readwrite) NSTimeInterval remainingSeconds;
@property (nonatomic, retain, readwrite) NSTimer *timer;

@end


@implementation PlayerClock

@synthesize startSeconds, remainingSeconds, timer;

+ (PlayerClock *) clockWithSeconds:(NSTimeInterval) startSeconds {
  PlayerClock *clock = [[PlayerClock alloc] init];
  clock.startSeconds = startSeconds;
  clock.remainingSeconds = startSeconds;
  return [clock autorelease];
}

- (NSString *)remainingTimeAsString {
  NSUInteger minute = (int) remainingSeconds / 60;
  NSUInteger second = remainingSeconds - (minute * 60);
  return [NSString stringWithFormat:@"%02u:%02u", minute, second];
}

- (void) startCountdown {
  self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(decrement) userInfo:nil repeats:YES];
}

- (void) stopCountdown {
  if (timer) {
    [timer invalidate];
    self.timer = nil;
  }
}

- (void) decrement {
  self.remainingSeconds = remainingSeconds - 1.0;
}

- (void) dealloc {
  [self stopCountdown];
  [super dealloc];
}

@end
