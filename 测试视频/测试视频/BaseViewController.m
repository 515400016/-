//
//  BaseViewController.m
//  测试视频
//
//  Created by 杨 on 2017/7/24.
//  Copyright © 2017年 杨. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
- (id)init{
    self = [super init];
    if (self) {
        self.enablePanGesture = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  whiteColor];
    
}

- (void)addHud
{
    if (!_hud) {
        _hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
}
- (void)addHudWithMessage:(NSString*)message
{
    if (!_hud)
    {
        _hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        _hud.labelText=message;
    }
    
}
- (void)removeHud
{
    if (_hud) {
        [_hud removeFromSuperview];
        _hud=nil;
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
}

@end
