#import <Foundation/Foundation.h>

@class NewGameViewController;

@protocol NewGameViewControllerDelegate <NSObject>

- (void)newGameViewControllerDidCancel:(NewGameViewController *)newGameViewController;
- (void)newGameViewController:(NewGameViewController *)newGameViewController didStart:(NSTimeInterval)startSeconds;

@end
