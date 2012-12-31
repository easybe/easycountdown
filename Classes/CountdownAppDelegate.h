// Easy's Countdown
// 2010-2013 easyb

#import <Cocoa/Cocoa.h>

@class EZCountdown;
@class EZFireworks;

@interface CountdownAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSView *mainView;
    QTMovieView *movieView;

    NSUserDefaults *defaults;
    QTMovie *movie;

    IBOutlet NSTextField *timeView;

    EZCountdown *countdown;
    EZFireworks *fireworks;

    NSFont *font;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSView *mainView;

- (IBAction)toggleFullScreen:(id)sender;
- (IBAction)selectMoviePath:(id)sender;
- (void)showMovie;
- (void)setMoviePath:(NSOpenPanel*)panel returnCode:(int)returnCode contextInfo:(void *)contextInfo;
- (IBAction)showFontMenu:(id)sender;

@end
