//
//  DailyAPI.m
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "DailyAPI.h"

@implementation DailyAPI

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        self.networkService = [[NetworkService alloc] init];
    }
    return self;
}

- (void)getDailyWeather:(NSString *)cityID complete:(void(^)(BOOL isLogged, DailyModel *dailyDTO))completionBlock{
    NSDictionary *param = @{ @"id": cityID,
                             @"APPID": APP_ID};
    
    [self.networkService getData:TRUE url:@"forecast/daily" parameter:param complete:^(NSDictionary *data, NSError *error) {
        // Convert to WeatherDTO
        DailyModel *daily = [[DailyModel alloc] init:data];
        completionBlock(YES, daily);
    }];
}

@end
