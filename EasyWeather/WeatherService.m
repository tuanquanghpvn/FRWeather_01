//
//  WeatherService.m
//  EasyWeather
//
//  Created by  on 5/5/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "WeatherService.h"

@implementation WeatherService

- (void)getCurrentWeather: (int)cityID complete:(void(^)(BOOL isLogged,WeatherDTO *weatherDTO))completionBlock {
    AFHTTPSessionManager *manager = [AFConfig getManager];
    
    NSDictionary *param = @{ @"id": [NSString stringWithFormat:@"%d", cityID],
                             @"APPID": @"d77b3fa0998439dc4ec3115d3c1f6cb8"};
    
    [manager GET:@"weather" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *jsonData = responseObject;
        
        // Convert to WeatherDTO
        WeatherDTO *weather = [[WeatherDTO alloc] init:jsonData];
        
        completionBlock(YES, weather);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionBlock(NO, nil);
    }];
}

@end
