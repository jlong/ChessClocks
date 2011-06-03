#import "ChessClocksAppDelegate.h"
#import "ChessClocksViewController.h"
#import "ATMHud.h"

@implementation ChessClocksAppDelegate

@synthesize game=_game;
@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [application setStatusBarHidden:YES];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)dealloc
{
  [_window release];
  [super dealloc];
}

#pragma mark
#pragma mark New Game

- (void)newGame
{
  [[UIApplication sharedApplication]setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
  
  NewGameViewController *newGameController = [[NewGameViewController alloc]initWithNibName:@"NewGameViewController" bundle:nil];
  newGameController.delegate = self;
  [_window.rootViewController presentModalViewController:newGameController animated:YES];
  [newGameController release];
}

- (void) showStartMessage:(NSString *)message
{
  ATMHud *hud = [[ATMHud alloc] initWithDelegate:self];
  [_window.rootViewController.view addSubview:hud.view];
  [hud release];
  [hud setCaption:message];
  [hud show];
}

- (void)userDidTapHud:(ATMHud *)_hud
{
  [_hud hide];
  [_game startClocks];
}

- (void)newGameViewControllerDidCancel:(NewGameViewController *)newGameViewController
{
  [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
  [_window.rootViewController dismissModalViewControllerAnimated:YES];
  if (_game != nil)
    [self pauseGame];
}

- (void)newGameViewController:(NewGameViewController *)newGameViewController didCreateGame:(ChessGame *)game
{
  self.game = game;
  
  [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];

  ChessClocksViewController *chessClocksViewController = [[ChessClocksViewController alloc] initWithNibName:@"ChessClocksViewController" bundle:nil];
  self.window.rootViewController = chessClocksViewController;
  [chessClocksViewController release];

  chessClocksViewController.game = game;
  [self showStartMessage: @"Tap to start.\nTap again to switch clocks."];
}

#pragma mark
#pragma mark Pause Game

- (void)pauseGame
{
  [_game stopClocks];
  UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Paused" delegate:self cancelButtonTitle:@"Resume" destructiveButtonTitle:nil otherButtonTitles:@"New Game", nil];
  [actionSheet showInView:_window.rootViewController.view];
  [actionSheet release];
}

- (void)resumeGame
{
  [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
  [_window.rootViewController dismissModalViewControllerAnimated:YES];
  [_game startClocks];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
  switch (buttonIndex) {
    case 0: // New Game
      [self newGame];
      break;
    case 1: // Resume
      [self resumeGame];
      break;
  }
}

@end
