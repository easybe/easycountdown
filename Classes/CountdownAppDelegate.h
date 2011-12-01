//
//  CountdownAppDelegate.h
//  Countdown
//
//  Created by Ezra Bühler on 29.12.10.
//  Copyright 2010 HSR. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class EZCountdown;
@class EZFireworks;

@interface CountdownAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSView *mainView;
    
    IBOutlet NSTextField *timeView;
    
    EZCountdown *countdown;
    EZFireworks *fireworks;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSView *mainView;

- (IBAction)toggleFullScreen:(id)sender;

@end
