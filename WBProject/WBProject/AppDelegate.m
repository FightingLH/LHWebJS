//
//  AppDelegate.m
//  WBProject
//
//  Created by feeyo on 2017/9/25.
//  Copyright © 2017年 lihuan. All rights reserved.
//
//百度 ECNGkSgDzQweZbpKmpwpW3GGx1LoG4l2
#import "AppDelegate.h"
#import "WBTabBarController.h"
#import "WBPasswordViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[WBTabBarController alloc]init];
//    [WBPasswordViewController configWithWindow:self.window showRootControl:^(BOOL show) {
//        self.window.rootViewController = [[WBTabBarController alloc]init];
//    }];
    [self addCurrentNotification];
    return YES;
}


- (void)addCurrentNotification
{
    
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types != UIUserNotificationTypeNone)
    {
        //定义本地通知对象
        UILocalNotification *notification=[[UILocalNotification alloc]init];
        //设置调用时间
        notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:10];//立即触发
        //设置通知属性
        notification.alertBody=@"HELLO，我是本地通知哦!"; //通知主体
        notification.applicationIconBadgeNumber=10;//应用程序图标右上角显示的消息数
        notification.alertAction=@"打开应用"; //待机界面的滑动动作提示
        notification.soundName=UILocalNotificationDefaultSoundName;//收到通知时播放的声音，默认消息声音
        notification.userInfo = @{@"name":@"lihuan"};
        //调用通知
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }else
    {
          [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound  categories:nil]];
    }
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    
    if (notificationSettings.types!=UIUserNotificationTypeNone) {
        //定义本地通知对象
        UILocalNotification *notification=[[UILocalNotification alloc]init];
        //设置调用时间
        notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:10];
        notification.alertBody=@"HELLO，我是本地通知哦!"; //通知主体
        notification.applicationIconBadgeNumber=10;//应用程序图标右上角显示的消息数
        notification.alertAction=@"打开应用"; //待机界面的滑动动作提示
        notification.soundName=UILocalNotificationDefaultSoundName;
        //调用通知
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification;
{
    NSLog(@"%@",notification.userInfo);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
