// Easy's Countdown
// 2010-2018 easyb

#import <Cocoa/Cocoa.h>

@interface EZCountdown : NSObject {
    NSTimer *timer;
    NSTimeInterval end;

    NSTextField *timeView;
    NSView *theView;

    NSSize viewSize;

    NSUserDefaults *defaults;
}
- (id)initWithView:(NSView *)aView;
- (void)tick;
- (void)stop;

@end
