//
//  AppDelegate.h
//  测试视频
//
//  Created by 杨 on 2017/7/24.
//  Copyright © 2017年 杨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "ScreenShotView.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (copy, nonatomic) NSArray *sidArray;
@property (copy, nonatomic) NSArray *videoArray;

@property (nonatomic, strong) ScreenShotView *screenshotView;
+(AppDelegate *)shareAppDelegate;


@end

