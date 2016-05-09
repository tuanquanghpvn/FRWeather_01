//
//  DailyService.m
//  EasyWeather
//
//  Created by  on 5/5/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "DailyService.h"

@implementation DailyService

- (void)getDailyWeather:(NSString *)cityID complete:(void(^)(BOOL isLogged,DailyDTO *dailyDTO))completionBlock{
    AFHTTPSessionManager *manager = [AFConfig getManager];
    
    NSDictionary *param = @{ @"id": cityID,
                             @"APPID": @"d77b3fa0998439dc4ec3115d3c1f6cb8"};
    
    [manager GET:@"forecast/daily" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *jsonData = responseObject;
        
        // Convert to WeatherDTO
        DailyDTO *daily = [[DailyDTO alloc] init:jsonData];
        
        completionBlock(YES, daily);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionBlock(NO, nil);
    }];
}

@end
