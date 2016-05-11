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
    
    [self.networkService getData:TRUE url:@"forecast/daily" parameter:param complete:^(NSDictionary *data_daily, NSError *error) {
        
        NSDate *now = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *components = [calendar components:NSCalendarUnitHour fromDate:now];
        long cnt = (24 - [components hour]) / 3;
        NSDictionary *param = @{ @"id": cityID,
                                 @"APPID": APP_ID,
                                 @"cnt": [NSString stringWithFormat:@"%ld", cnt]};
        
        
        [self.networkService getData:TRUE url:@"forecast" parameter:param complete:^(NSDictionary *data_hour, NSError *error) {
            // Convert to WeatherDTO
            DailyModel *daily = [[DailyModel alloc] init:data_daily hour:data_hour];
            completionBlock(YES, daily);
        }];
    }];
}

@end
