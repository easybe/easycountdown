// Easy's Countdown
// 2010-2012 easyb

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CoreAnimation.h>


@interface EZFireworks : NSObject {
    NSView *theView;

    CALayer *rootLayer;
    CAEmitterLayer *mortor;

    NSNumber *rocketRange;
    NSNumber *fireworkRange;
    NSNumber *fireworkVelocity;
    NSNumber *fireworkVelocityRange;
    NSNumber *rocketVelocity;
    NSNumber *rocketVelocityRange;
    NSNumber *fireworkGravity;
    NSNumber *rocketGravity;
    NSNumber *animationSpeed;
}

- (id)initWithView:(NSView *)aView andRect:(CGRect)aRect;

@end
