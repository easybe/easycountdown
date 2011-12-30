// Easy's Countdown
// 2010-2012 easyb

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

    NSUserDefaults *defaults;
}
- (id)initWithView:(NSView *)aView;
- (void)centerText;
- (void)tick;
- (void)stop;

@end
