//
//  AppDelegate.m
//  测试视频
//
//  Created by 杨 on 2017/7/24.
//  Copyright © 2017年 杨. All rights reserved.
//

#import "AppDelegate.h"
#import "TencentNewsViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[TencentNewsViewController new]];
    [[DataManager shareManager] getSIDArrayWithURLString:@"http://c.m.163.com/nc/video/home/0-10.html"
                                                 success:^(NSArray *sidArray, NSArray *videoArray) {
                                                     self.sidArray =[NSArray arrayWithArray:sidArray];
                                                     self.videoArray = [NSArray arrayWithArray:videoArray];
                                                 }
                                                  failed:^(NSError *error) {
                                                      
                                                  }];
    //截图返回，地址为https://github.com/zhengwenming/ScreenShotBack
    self.screenshotView = [[ScreenShotView alloc] initWithFrame:CGRectMake(0, 0, self.window.frame.size.width, self.window.frame.size.height)];
    [self.window insertSubview:self.screenshotView atIndex:0];
    self.screenshotView.hidden = YES;
    
    [self.window makeKeyAndVisible];
    return YES;
}
+(AppDelegate *)shareAppDelegate{
    return (AppDelegate *) [UIApplication sharedApplication].delegate;
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
