#import "TimePickerController.h"

@implementation TimePickerController

@synthesize pickerView;
@synthesize delegate;
@synthesize clockTime;

- (id) init {
  self = [super init];
  if (nil != self) {
    self.clockTime = [ClockTime timeWithMinutes:0];
  }
  return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return 2;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
  return 90.0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 60;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  if (component == 0) {
    return [NSString stringWithFormat:@"        %02i", row];
  } else {
    return [NSString stringWithFormat:@"%02i", row];
  }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  if (component == 0) {
    clockTime = [self.clockTime timeWithMinutes:row];
  } else {
    clockTime = [self.clockTime timeWithSeconds:row];
  }
  [delegate timePickerController:self didChangeTime:self.clockTime];
}

- (void) setClockTime:(ClockTime *)time {
  [clockTime release];
  clockTime = [time retain];
  if (clockTime != nil && pickerView != nil) {
    [pickerView selectRow:clockTime.minutes inComponent:0 animated:TRUE];
    [pickerView selectRow:clockTime.seconds inComponent:1 animated:TRUE];
  }
}
@end
