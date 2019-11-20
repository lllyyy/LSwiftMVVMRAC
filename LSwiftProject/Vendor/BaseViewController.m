
#import "BaseViewController.h"
#import "WRNavigationBar.h"
 
@interface BaseViewController ()
@end

@implementation BaseViewController

- (WRCustomNavigationBar *)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [WRCustomNavigationBar CustomNavigationBar];
    }
    return _customNavBar;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.extendedLayoutIncludesOpaqueBars = YES;
    if (@available(iOS 11.0, *)) {
        //   self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.navigationController.navigationBar.hidden = YES;
    
 	//[self.view setBackgroundColor: [UIColor colorWithHexString:@"#f5f5f5" ] ];
    //导航栏子控件颜色
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor] ];
     //[self.navigationController.navigationBar setBarTintColor: ];
    [self.navigationController.navigationBar setTranslucent:YES];
    UINavigationBar *navBar = self.navigationController.navigationBar;
    [navBar setBackgroundImage:[UIImage imageNamed:@"bg_navbar"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar  setShadowImage:[UIImage new]];
    
    if (self.navigationController.childViewControllers.count != 1) {
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_back"]
                                                                          style:UIBarButtonItemStylePlain   target:self action:@selector(back)];
    }
    
    
    [self setupNavBar];
}

- (void)setupNavBar
{
    [self.view addSubview:self.customNavBar];
    
    // 设置自定义导航栏背景图片
    self.customNavBar.barBackgroundImage = [UIImage imageNamed:@"bg_navbar"];
    [self.customNavBar wr_setBottomLineHidden:NO];
    // 设置自定义导航栏标题颜色
    self.customNavBar.titleLabelColor = [UIColor whiteColor];
    
    if (self.navigationController.childViewControllers.count != 1) {
        [self.customNavBar wr_setLeftButtonWithImage:[UIImage imageNamed:@"menu_back"]  ];
    }
  
    BB_WS(self);
    self.customNavBar.onClickLeftButton = ^{
        [weakSelf back];
    };
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}



 
@end
