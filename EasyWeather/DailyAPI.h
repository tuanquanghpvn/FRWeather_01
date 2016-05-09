//
//  DailyAPI.h
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherModel.h"
#import "DailyModel.h"
#import "GlobalConfig.h"
#import "NetworkService.h"

@interface DailyAPI : NSObject

@property (nonatomic) NetworkService *networkService;

- (void)getDailyWeather: (NSString *)cityID complete:(void(^)(BOOL isLogged, DailyModel *dailyDTO))completionBlock;

@end
