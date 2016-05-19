//
//  DailyModel.h
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherModel.h"

@interface DailyModel : NSObject

@property (nonatomic) NSString *cityID;
@property (nonatomic) NSString *cityName;

@property (nonatomic) NSString *lon;
@property (nonatomic) NSString *lat;

@property (nonatomic) NSMutableArray *weathers;
@property (nonatomic) NSMutableArray *hours;

- (instancetype)init:(NSDictionary *)jsonDaily hour:(NSDictionary *)jsonHour;

@end
