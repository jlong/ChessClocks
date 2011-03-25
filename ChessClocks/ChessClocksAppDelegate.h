//
//  ChessClocksAppDelegate.h
//  ChessClocks
//
//  Created by Adam Williams on 3/25/11.
//  Copyright 2011 Adaloor, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChessClocksViewController;

@interface ChessClocksAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ChessClocksViewController *viewController;

@end
