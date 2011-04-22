#import "ClockTime.h"

@interface ClockTime()

@property (nonatomic, readwrite) NSUInteger minutes;
@property (nonatomic, readwrite) NSUInteger seconds;

@end

@implementation ClockTime

@synthesize minutes, seconds;

+ (ClockTime *) timeWithMinutes:(NSUInteger)min {
  return [[[self alloc] initWithMinutes:min seconds:0] autorelease];
}

- (id) initWithMinutes:(NSUInteger)min seconds:(NSUInteger)sec {
  self = [super init];
  if (nil != self) {
    self.minutes = min;
    self.seconds = sec;
  }
  return self;
}

- (NSString *) string {
  return [NSString stringWithFormat:@"%u:%02u min", minutes, seconds];
}

- (id) timeWithMinutes:(NSUInteger)min {
  return [[[ClockTime alloc] initWithMinutes:min seconds:seconds] autorelease];
}

- (id) timeWithSeconds:(NSUInteger)sec {
  return [[[ClockTime alloc] initWithMinutes:minutes seconds:sec] autorelease];
}

- (NSUInteger) totalSeconds {
  return minutes * 60 + seconds;
}

@end
