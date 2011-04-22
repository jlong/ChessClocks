#import <Foundation/Foundation.h>
#import "ClockTime.h"

@class TimePickerController;

@protocol TimePickerControllerDelegate <NSObject>

- (void)timePickerController:(TimePickerController *)timePickerController didChangeTime:(ClockTime *)clockTime;

@end


@interface TimePickerController : NSObject <UIPickerViewDataSource, UIPickerViewDelegate> {
    
}

@property (nonatomic, retain) ClockTime *clockTime;
@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic, assign) id <TimePickerControllerDelegate> delegate;

@end