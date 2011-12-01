//
//  CountdownAppDelegate.m
//  Countdown
//
//  Created by Ezra Bühler on 29.12.10.
//  Copyright 2010 HSR. All rights reserved.
//

#import "CountdownAppDelegate.h"

#import "EZCountdown.h"
#import "EZFireworks.h"

@implementation CountdownAppDelegate

@synthesize window, mainView;

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    [window setContentView:mainView]; 
    
    countdown = [[EZCountdown alloc] initWithView:mainView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(countdownFinished:) name:@"countdownFinished" object:nil];
    
    //[self toggleFullScreen:self];
}

- (void)countdownFinished:(NSNotification *) notification {
    NSRect screenRect = [[NSScreen mainScreen] frame];
    
    fireworks = [[EZFireworks alloc] initWithView:mainView andRect:CGRectMake(0, 0, screenRect.size.width, screenRect.size.height)];
    
}

- (IBAction)toggleFullScreen:(id)sender {
    if ([mainView isInFullScreenMode] == NO) {
        [mainView enterFullScreenMode:[NSScreen mainScreen] withOptions:nil];
        //[mainView setFrameSize:[[NSScreen mainScreen] frame].size];
        //[countdown centerText];
    } else {
        [mainView exitFullScreenModeWithOptions:nil];
        //[countdown centerText];
    }
    
    NSLog(@"view height:%f", [mainView frame].size.height);
    NSLog(@"view width:%f", [mainView frame].size.width);
    NSLog(@"screen height:%f", [[NSScreen mainScreen] frame].size.height);
    NSLog(@"screen width:%f", [[NSScreen mainScreen] frame].size.width);

}


- (void)applicationWillTerminate:(NSNotification *)notification {
 
}


//Quit app when the window is closed
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
    return YES;
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
	return NSTerminateNow;
}


@end
