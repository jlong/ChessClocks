#import <Foundation/Foundation.h>


@interface PlayerClock : NSObject {
    
}

@property (nonatomic, readonly) NSTimeInterval startSeconds;
@property (nonatomic, readonly) NSTimeInterval remainingSeconds;
@property (nonatomic, readonly) NSString *remainingTimeAsString;

+ (PlayerClock *) clockWithSeconds:(NSTimeInterval) startSeconds;

- (void) startCountdown;
- (void) stopCountdown;

@end
