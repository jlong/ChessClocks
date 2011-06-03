@interface ChessClocksViewController : UIViewController {

}

@property (nonatomic, retain) ChessGame *game;

@property (nonatomic, retain) IBOutlet UILabel *playerOneTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *playerTwoTimeLabel;
@property (nonatomic, retain) IBOutlet UIImageView *playerOneBackgroundImage;
@property (nonatomic, retain) IBOutlet UIImageView *playerTwoBackgroundImage;

- (IBAction) pauseGame:(id) sender;

@end
