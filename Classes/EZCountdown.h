//
//  EZCountdown.h
//  Countdown
//
//  Created by Ezra Bühler on 30.12.10.
//  Copyright 2010 HSR. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface EZCountdown : NSObject {
    NSTimer *timer;
    //NSDate *targetDate;
    NSTimeInterval end;
    
    NSTextField *timeView;
    NSView *theView;
    
    NSSize viewSize;
    
    NSString *fontName;
    int fontScale;
}
- (id)initWithView:(NSView *)aView;
- (void)centerText;
- (void)tick;
- (void)stop;

@end
