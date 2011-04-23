@interface PlayerClock : NSObject {
    
}

@property (nonatomic, retain, readonly) ClockTime *clockTime;

+ (PlayerClock *) clockWithTime:(ClockTime *) time;

- (void) startCountdown;
- (void) stopCountdown;

@end
