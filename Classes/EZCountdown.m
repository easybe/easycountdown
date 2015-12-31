// Easy's Countdown
// 2010-2014 easyb

#import "EZCountdown.h"

@implementation EZCountdown

- (id)initWithView:(NSView *)aView {
    [super init];

    theView = aView;
    [theView setWantsLayer:YES];

    timeView = [[aView subviews] objectAtIndex:0];

    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tick)
                     userInfo:NULL repeats:YES];

    viewSize = [theView frame].size;

    defaults = [NSUserDefaults standardUserDefaults];

    return self;
}

- (void)tick {
    NSString *fontName = [defaults objectForKey:@"fontName"];
    float fontBaseSize = [defaults floatForKey:@"fontSize"];
    [timeView setFont:[NSFont fontWithName:fontName size:fontBaseSize]];
    NSColor *fgColor = (NSColor *)[NSUnarchiver unarchiveObjectWithData:[defaults objectForKey:@"fgColor"]];
    [timeView setTextColor:fgColor];
    NSColor *bgColor = (NSColor *)[NSUnarchiver unarchiveObjectWithData:[defaults objectForKey:@"bgColor"]];
    theView.layer.backgroundColor = bgColor.CGColor;
    NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
    end = [[defaults objectForKey:@"endDate"] timeIntervalSinceReferenceDate] + 1;

    NSTimeInterval interval = end - now;
    int diff = (int)interval;

    int seconds = diff % 60;
    int minutes = (diff / 60) % 60;
    int hours = (diff / 3600) % 24;
    int days = (diff / (3600 * 24));

    NSString *output;

    if (days > 0) {
        output = [NSString stringWithFormat:@"%d:%02d:%02d:%02d", days, hours, minutes, seconds];
    } else if (hours > 0) {
        output = [NSString stringWithFormat:@"%d:%02d:%02d", hours, minutes, seconds];
    } else if (minutes > 0) {
        [timeView setFont:[NSFont fontWithName:fontName size:fontBaseSize * 1.25]];
        output = [NSString stringWithFormat:@"%d:%02d", minutes, seconds];
    } else if (seconds > 0) {

        if (seconds >= 10) {
            [timeView setFont:[NSFont fontWithName:fontName size:fontBaseSize * 1.5]];
        } else {
            [timeView setFont:[NSFont fontWithName:fontName size:fontBaseSize * 2]];
        }

        output = [NSString stringWithFormat:@"%d", seconds];
    } else {
        [self stop];
        [timeView setFont:[NSFont fontWithName:fontName size:fontBaseSize / 2]];
        [timeView setTextColor:[NSColor whiteColor]];
        output = [defaults stringForKey:@"endMsg"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"countdownDidEnd" object:nil];
    }

    [timeView setStringValue:output];
}

- (void)stop {
    [timer invalidate];
    timer = nil;
}

- (void)dealloc {
    [super dealloc];
}

@end
