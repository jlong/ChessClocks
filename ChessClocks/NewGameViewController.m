#import "ClockTime.h"
#import "NewGameViewController.h"

@interface NewGameViewController()

@property (nonatomic, retain, readwrite) ClockTime *clockTime;

- (IBAction) cancel:(id)sender;
- (IBAction) startNewGame:(id)sender;

@end

@implementation NewGameViewController

@synthesize delegate;
@synthesize settingsTableView;
@synthesize gameLengthPickerController;
@synthesize clockTime;

- (IBAction) cancel:(id)sender {
  [delegate newGameViewControllerDidCancel:self];
}

- (IBAction) startNewGame:(id)sender {
  [delegate newGameViewController:self didStart:self.clockTime];
}

- (void) viewDidLoad {
  self.clockTime = [ClockTime timeWithMinutes:4];
  self.gameLengthPickerController.delegate = self;
  self.gameLengthPickerController.clockTime = self.clockTime;
}

- (void)timePickerController:(TimePickerController *)timePickerController didChangeTime:(ClockTime *)time {
  self.clockTime = time;
  [self.settingsTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"GameLengthCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                   reuseIdentifier:CellIdentifier] autorelease];
	}
  cell.textLabel.text = @"Game Length";
  cell.detailTextLabel.text = [self.clockTime string];

  return cell;
}

@end
