//
//  DailyService.h
//  EasyWeather
//
//  Created by  on 5/5/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherDTO.h"
#import "DailyDTO.h"
#import "AFConfig.h"

@interface DailyService : NSObject

- (void)getDailyWeather: (NSString *)cityID complete:(void(^)(BOOL isLogged,DailyDTO *dailyDTO))completionBlock;

@end
