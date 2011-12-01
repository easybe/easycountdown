//
//  EZCountdown.m
//  Countdown
//
//  Created by Ezra Bühler on 30.12.10.
//  Copyright 2010 HSR. All rights reserved.
//

#import "EZCountdown.h"


@implementation EZCountdown

- (id)initWithView:(NSView *)aView {
    [super init];
    //start = [NSDate timeIntervalSinceReferenceDate]; 
    
    theView = aView;
    timeView = [[aView subviews] objectAtIndex:0];
    
    [timer invalidate]; 
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 
                                             target:self 
                                           selector:@selector(tick) 
                                           userInfo:NULL 
                                            repeats:YES];
    
    NSString *endString = @"2011-01-01 00:00:01 +0100";
    //NSString *endString = @"2010-12-31 19:14:01 +0100";
    
    end = [[NSDate dateWithString:endString] timeIntervalSinceReferenceDate];
    
    
    
    //NSRect frame = [[NSScreen mainScreen] frame];
    
    fontName = @"Courier";
    fontScale = 150;
    
    NSFont *font = [NSFont fontWithName:fontName size:fontScale]; //Bradley Hand ITC TT Bold
    
    [timeView setFont:font];
    
    viewSize = [theView frame].size;
    
    //[timeView :[NSColor redColor]];
    
    return self;
} 

- (void)tick { 
    NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
    
    NSTimeInterval interval = end - now; 
    int diff = (int)interval; 
    //int thousandths = (int)((interval - seconds) * 1000);
    
    int seconds = diff % 60;
    int minutes = (diff / 60) % 60;
    int hours = (diff / 3600) % 24;
    int days = (diff / (3600 * 24));
    
    NSString *output = @"Hello!";
    
    if (days > 0) {
        output = [NSString stringWithFormat:@"%d:%02d:%02d:%02d", days, hours, minutes, seconds];
    } else if (hours > 0) {
        output = [NSString stringWithFormat:@"%d:%02d:%02d", hours, minutes, seconds];
    } else if (minutes > 0) {
        [timeView setFont:[NSFont fontWithName:fontName size:fontScale * 1.25]];
        output = [NSString stringWithFormat:@"%d:%02d", minutes, seconds];
    } else if (seconds > 0) {
        
        if (seconds >= 10) {
            [timeView setFont:[NSFont fontWithName:fontName size:fontScale * 1.5]];
        } else {
            [timeView setFont:[NSFont fontWithName:fontName size:fontScale * 2]];
        }

        output = [NSString stringWithFormat:@"%d", seconds];
    } else {
        [self stop];
        [timeView setFont:[NSFont fontWithName:fontName size:fontScale / 2]];
        [timeView setTextColor:[NSColor whiteColor]];
        output = @"Happy 2011!";
        [[NSNotificationCenter defaultCenter] postNotificationName:@"countdownFinished" object:nil];
    }
    
    //[self centerText];
    
    //NSLog(@"%@", output);

    [timeView setStringValue:output];

}

- (void)centerText {
    NSSize size;
    NSRect frame;
    
    NSRect frame2 = [timeView frame];
    
    //NSLog(@"view height: %f, width: %f", frame.size.w)
    
    [timeView sizeToFit];
    
    NSRect frame1 = [timeView frame];
    
    int textHeight = [timeView frame].size.height;
    
    int y = (viewSize.height - textHeight) / 2;
    
    size.width = viewSize.width;
    size.height = textHeight;
    
    frame.origin.x = 0;
    frame.origin.y = y;
    
    frame.size = size;  
    
    [timeView setFrame:frame];
}

- (void)dealloc {
    [timeView release];
    [super dealloc];
}

- (void)stop 
{
    [timer invalidate];
    timer = nil; 
}

@end
