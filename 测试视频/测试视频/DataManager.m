//
//  DataManager.m
//  测试视频
//
//  Created by 杨 on 2017/7/24.
//  Copyright © 2017年 杨. All rights reserved.
//

#import "DataManager.h"
#import "VideoModel.h"
#import "SidModel.h"
@implementation DataManager
+(DataManager *)shareManager{
    
    static DataManager* manager = nil;
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        
        manager = [[[self class] alloc] init];
    });
    
    return manager;
    
}

- (void)getSIDArrayWithURLString:(NSString *)URLString success:(onSuccess)success failed:(onFailed)failed{
    dispatch_queue_t global_t = dispatch_get_global_queue(0, 0);
    dispatch_async(global_t, ^{
        NSURL *url = [NSURL URLWithString:URLString];
        NSMutableArray *sidArray = [NSMutableArray array];
        NSMutableArray *videoArray = [NSMutableArray array];
        
        
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData *  data, NSError *  connectionError) {
            if (connectionError) {
                NSLog(@"错误%@",connectionError);
                failed(connectionError);
            }else{
                NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                for (NSDictionary * video in [dict objectForKey:@"videoList"]) {
                    VideoModel * model = [[VideoModel alloc] init];
                    [model setValuesForKeysWithDictionary:video];
                    [videoArray addObject:model];
                }
                self.videoArray = [NSArray arrayWithArray:videoArray];
                // 加载头标题
                for (NSDictionary *d in [dict objectForKey:@"videoSidList"]) {
                    SidModel *model= [[SidModel alloc] init];
                    [model setValuesForKeysWithDictionary:d];
                    [sidArray addObject:model];
                }
                self.sidArray = [NSArray arrayWithArray:sidArray];
                
            }
            if (success) {
                success(sidArray,videoArray);
            }
            
        }];
        
    });
    
}

- (void)getVideoListWithURLString:(NSString *)URLString ListID:(NSString *)ID success:(onSuccess)success failed:(onFailed)failed{
    dispatch_queue_t global_t = dispatch_get_global_queue(0, 0);
    dispatch_async(global_t, ^{
        NSURL *url = [NSURL URLWithString:URLString];
        NSMutableArray *listArray = [NSMutableArray array];
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData *  data, NSError *  connectionError) {
            if (connectionError) {
                NSLog(@"错误%@",connectionError);
                failed(connectionError);
            }else{
                NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSArray *videoList = [dict objectForKey:ID];
                for (NSDictionary * video in videoList) {
                    VideoModel * model = [[VideoModel alloc] init];
                    [model setValuesForKeysWithDictionary:video];
                    [listArray addObject:model];
                }
                if (success) {
                    success(listArray,nil);
                }
            }
            
        }];
        
    });
    
}
@end
