#import "WelcomeViewController.h"
#import "NewGameViewController.h"
#import "ChessGame.h"
#import "ATMHudDelegate.h"

@interface ChessClocksAppDelegate : NSObject<
    UIApplicationDelegate,
    NewGameViewControllerDelegate,
    ATMHudDelegate,
    UIActionSheetDelegate>
{
}

@property (nonatomic, retain) ChessGame *game;
@property (nonatomic, retain) IBOutlet UIWindow *window;

// Initializing
// Welcome
// Starting
// Running
// Paused

//- (void) welcome;
// shows welcome
// * New Game

- (void) newGame;
// shows new game
// * Start Game
// * Cancel

//- (void) startGame;
// shows Clocks

//- (void) togglePlayer;
// toggles player clocks

- (void) pauseGame;
// shows action sheet
// * New Game
// * Resume Game

- (void) resumeGame;
// shows Clocks
// * Toggle Player
// * Pause Game

@end
