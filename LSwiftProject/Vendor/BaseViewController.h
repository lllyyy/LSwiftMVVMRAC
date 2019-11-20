 
#import <UIKit/UIKit.h>
#import "WRCustomNavigationBar.h"
#define isPX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define STATUS_BAR_HEIGHT (isPX ? 44.f : 20.f)

#define NAVIGATION_BAR_HEIGHT (isPX ? 88.f : 64.f)


#define BB_WS(ws) __weak typeof(self)weakSelf = ws;
#define BB_SS(ss) __weak typeof(self)strongSelf = ss;
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScrollTabbar  45.f
#define SafeAreaBottomHeight (isPX ? 34.f : 0.f)
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS


@interface BaseViewController : UIViewController
@property (nonatomic, strong) WRCustomNavigationBar *customNavBar;

- (void)back;
@end
