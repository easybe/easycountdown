// Easy's Countdown
// 2010-2012 easyb

#import "EZCountdown.h"


@implementation EZCountdown

- (id)initWithView:(NSView *)aView {
    [super init];

    theView = aView;
    timeView = [[aView subviews] objectAtIndex:0];

    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tick)
                     userInfo:NULL repeats:YES];

    defaults = [NSUserDefaults standardUserDefaults];
    end = [[defaults objectForKey:@"endDate"] timeIntervalSinceReferenceDate];

    fontName = @"Courier";
    fontScale = 150;

    NSFont *font = [NSFont fontWithName:fontName size:fontScale];

    [timeView setFont:font];

    viewSize = [theView frame].size;

    return self;
}

- (void)tick {
    NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
    end = [[defaults objectForKey:@"endDate"] timeIntervalSinceReferenceDate];

    NSTimeInterval interval = end - now;
    int diff = (int)interval;

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
        output = [defaults stringForKey:@"endMsg"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"countdownDidEnd" object:nil];
    }

    //[self centerText];

    [timeView setStringValue:output];
}

// FIXME:
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

- (void)stop {
    [timer invalidate];
    timer = nil;
}

- (void)dealloc {
    [timeView release];
    [super dealloc];
}

@end
