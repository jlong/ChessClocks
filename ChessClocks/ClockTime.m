@interface ClockTime()

@property (nonatomic, readwrite) NSUInteger minutes;
@property (nonatomic, readwrite) NSUInteger seconds;

@end

@implementation ClockTime

@synthesize minutes, seconds;

+ (id) timeWithMinutes:(NSUInteger)min {
  return [[[self alloc] initWithMinutes:min seconds:0] autorelease];
}

+ (id) timeWithMinutes:(NSUInteger)min seconds:(NSUInteger)sec {
  return [[[self alloc] initWithMinutes:min seconds:sec] autorelease];
}

- (id) initWithMinutes:(NSUInteger)min seconds:(NSUInteger)sec {
  self = [super init];
  if (nil != self) {
    self.minutes = min;
    self.seconds = sec;
  }
  return self;
}

- (BOOL) isExpired {
  return self.totalSeconds < 1;
}

- (NSString *) string {
  return [NSString stringWithFormat:@"%u:%02u min", minutes, seconds];
}

- (id) timeDecremented {
  NSUInteger min = minutes;
  NSUInteger sec = seconds;
  if (sec == 0 && min > 0) {
    min = min - 1;
    sec = 59;
  } else {
    sec = sec - 1;
  }
  return [ClockTime timeWithMinutes:min seconds:sec];
}

- (id) timeWithMinutes:(NSUInteger)min {
  return [ClockTime timeWithMinutes:min seconds:seconds];
}

- (id) timeWithSeconds:(NSUInteger)sec {
  return [ClockTime timeWithMinutes:minutes seconds:sec];
}

- (NSUInteger) totalSeconds {
  return minutes * 60 + seconds;
}

@end
