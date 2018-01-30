//
//  WBTabBarController.m
//  WBProject
//
//  Created by feeyo on 2018/1/26.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBTabBarController.h"



@interface WBTabBarController ()

@end

@implementation WBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChildControllers];



}

- (void)setupChildControllers{
    
    [self setupChildNavigationControllerWithClass:[UINavigationController class] tabBarImageName:@"" tabBarSelectImageName:@"" rootViewControllerClass: [WBEventViewController class] rootViewControllerTitle:@"事件"];
    [self setupChildNavigationControllerWithClass:[UINavigationController class] tabBarImageName:@"" tabBarSelectImageName:@"" rootViewControllerClass: [WBCalendarViewController class] rootViewControllerTitle:@"日历"];
//    [self setupChildNavigationControllerWithClass:[UINavigationController class] tabBarImageName:@"" tabBarSelectImageName:@"" rootViewControllerClass: [WBAroundViewController class] rootViewControllerTitle:@"周边"];
    
     [self setupChildNavigationControllerWithClass:[UINavigationController class] tabBarImageName:@"" tabBarSelectImageName:@"" rootViewControllerClass: [WBPersonalViewController class] rootViewControllerTitle:@"我的"];

}

- (void)setupChildNavigationControllerWithClass:(Class)class tabBarImageName:(NSString *)name tabBarSelectImageName:(NSString *)selectName rootViewControllerClass:(Class)rootViewControllerClass rootViewControllerTitle:(NSString *)title{
    
    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    UINavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    [navVc.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    navVc.tabBarItem.image = [[UIImage imageNamed:name]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@", selectName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.title = title;
    
    [navVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    [navVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:9]} forState:UIControlStateNormal];
   
    [self addChildViewController:navVc];
    [self.tabBar setBarTintColor:[UIColor colorWithRed:0.20f green:0.44f blue:0.53f alpha:1.00f]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
   
}

@end
