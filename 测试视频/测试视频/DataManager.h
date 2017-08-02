//
//  DataManager.h
//  测试视频
//
//  Created by 杨 on 2017/7/24.
//  Copyright © 2017年 杨. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^onSuccess)(NSArray *sidArray,NSArray *videoArray);
typedef void(^onFailed)(NSError *error);
@interface DataManager : NSObject


@property(nonatomic,copy)NSArray *sidArray;
@property(nonatomic,copy)NSArray *videoArray;



+(DataManager *)shareManager;
- (void)getSIDArrayWithURLString:(NSString *)URLString success:(onSuccess)success failed:(onFailed)failed;

- (void)getVideoListWithURLString:(NSString *)URLString ListID:(NSString *)ID success:(onSuccess)success failed:(onFailed)failed;
@end
