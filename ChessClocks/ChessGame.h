#import "PlayerClock.h"

@interface ChessGame : NSObject {
    
}

@property (nonatomic, retain) PlayerClock *clockOne;
@property (nonatomic, retain) PlayerClock *clockTwo;
@property (nonatomic, retain) PlayerClock *currentClock;
@property (nonatomic, readonly) BOOL runningClocks;

- (id)initWithTime:(ClockTime*)time;

- (void)startClocks;
- (void)stopClocks;
- (void)toggleClocks;

@end
