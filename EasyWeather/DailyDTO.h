//
//  DailyDTO.h
//  EasyWeather
//
//  Created by  on 5/5/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherDTO.h"

@interface DailyDTO : NSObject

@property (nonatomic) NSString *cityID;
@property (nonatomic) NSString *cityName;

@property (nonatomic) NSString *lon;
@property (nonatomic) NSString *lat;

@property (nonatomic) NSMutableArray *weathers;

- (instancetype)init:(NSDictionary *)jsonData;

@end
