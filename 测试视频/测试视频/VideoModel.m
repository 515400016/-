//
//  VideoModel.m
//  测试视频
//
//  Created by 杨 on 2017/7/24.
//  Copyright © 2017年 杨. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"description"]) {
        self.descriptionDe = value;
    }
}
@end
