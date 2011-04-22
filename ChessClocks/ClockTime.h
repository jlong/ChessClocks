#import <Foundation/Foundation.h>


@interface ClockTime : NSObject {
    
}

@property (nonatomic, readonly) NSUInteger minutes;
@property (nonatomic, readonly) NSUInteger seconds;
@property (nonatomic, readonly) NSUInteger totalSeconds;

+ (ClockTime *) timeWithMinutes:(NSUInteger)min;

- (id) initWithMinutes:(NSUInteger)minutes seconds:(NSUInteger)seconds;

- (NSString *) string;

- (id) timeWithMinutes:(NSUInteger)minutes;

- (id) timeWithSeconds:(NSUInteger)minutes;

@end
