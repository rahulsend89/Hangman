#import <UIKit/UIKit.h>

@class animatioViewViewController;

@interface animatioViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    animatioViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet animatioViewViewController *viewController;

@end

