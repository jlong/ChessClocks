@interface ClockTime : NSObject {
    
}

@property (nonatomic, readonly) NSUInteger minutes;
@property (nonatomic, readonly) NSUInteger seconds;
@property (nonatomic, readonly) NSUInteger totalSeconds;

+ (ClockTime *) timeWithMinutes:(NSUInteger)min;
+ (ClockTime *) timeWithMinutes:(NSUInteger)min seconds:(NSUInteger)sec;

- (id) initWithMinutes:(NSUInteger)min seconds:(NSUInteger)sec;

- (BOOL) isExpired;

- (NSString *) string;
- (NSString *) stringLabeled;

- (id) timeDecremented;

- (id) timeWithMinutes:(NSUInteger)min;

- (id) timeWithSeconds:(NSUInteger)sec;

@end
