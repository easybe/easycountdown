// Easy's Countdown
// 2010-2014 easyb

#import "MDVerticallyCenteredTextFieldCell.h"

@implementation MDVerticallyCenteredTextFieldCell

- (NSRect)adjustedFrameToVerticallyCenterText:(NSRect)frame {
    // super would normally draw text at the top of the cell
    CGFloat textHeight = MAX([[self font] ascender], [[self font] descender]) * 2;
    NSInteger offset = floor((NSHeight(frame) - textHeight) / 2);
    return NSInsetRect(frame, 0.0, offset);
}

- (void)editWithFrame:(NSRect)aRect inView:(NSView *)controlView
         editor:(NSText *)editor delegate:(id)delegate event:(NSEvent *)event {
    [super editWithFrame:[self adjustedFrameToVerticallyCenterText:aRect]
          inView:controlView editor:editor delegate:delegate event:event];
}

- (void)selectWithFrame:(NSRect)aRect inView:(NSView *)controlView
                 editor:(NSText *)editor delegate:(id)delegate
                  start:(NSInteger)start length:(NSInteger)length {

    [super selectWithFrame:[self adjustedFrameToVerticallyCenterText:aRect]
                    inView:controlView editor:editor delegate:delegate
                     start:start length:length];
}

- (void)drawInteriorWithFrame:(NSRect)frame inView:(NSView *)view {
    [super drawInteriorWithFrame:
       [self adjustedFrameToVerticallyCenterText:frame] inView:view];
}

@end
