#import <Foundation/Foundation.h>
#import "ClockTime.h"

@interface PlayerClock : NSObject {
    
}

@property (nonatomic, readonly) NSTimeInterval startSeconds;
@property (nonatomic, readonly) NSTimeInterval remainingSeconds;
@property (nonatomic, readonly) NSString *remainingTimeAsString;

+ (PlayerClock *) clockWithTime:(ClockTime *) time;

- (void) startCountdown;
- (void) stopCountdown;

@end
