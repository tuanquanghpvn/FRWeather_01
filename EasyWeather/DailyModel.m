//
//  DailyModel.m
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "DailyModel.h"

@implementation DailyModel

- (instancetype)init:(NSDictionary *)jsonData {
    self = [super init];
    if (self != nil) {
        self.weathers = [NSMutableArray new];
        
        DailyModel *daily = self;
        daily.cityID = [[jsonData objectForKey:@"city"] objectForKey:@"id"];
        daily.cityName = [[jsonData objectForKey:@"city"] objectForKey:@"name"];
        
        NSDictionary *coord = [[jsonData objectForKey:@"city"] objectForKey:@"coord"];
        daily.lat =  [[coord objectForKey:@"coord"] objectForKey:@"lat"];
        daily.lon = [[coord objectForKey:@"coord"] objectForKey:@"lon"];
        
        NSArray* weather_first = [jsonData objectForKey:@"list"];
        for (NSDictionary *item in weather_first) {
            WeatherModel *weather = [WeatherModel new];
            
            NSDictionary* weather_temp = [[item objectForKey:@"weather"] objectAtIndex:0];
            weather.weatherID = [weather_temp objectForKey:@"id"];
            weather.weatherName = [weather_temp objectForKey:@"main"];
            weather.weatherDescription = [weather_temp objectForKey:@"description"];
            weather.weatherIcon = [weather_temp objectForKey:@"icon"];
            
            int timeInterval = [[item objectForKey:@"dt"] intValue];
            weather.dateTime = [NSDate dateWithTimeIntervalSince1970:timeInterval];
            
            float temp = [[[item objectForKey:@"temp"] objectForKey:@"day"] floatValue] - 273.15;
            weather.temp = [NSString stringWithFormat:@"%.2f", temp];
            weather.tempMax = [[item objectForKey:@"temp"] objectForKey:@"max"];
            weather.tempMin = [[item objectForKey:@"temp"] objectForKey:@"min"];
            weather.tempDay = [[item objectForKey:@"temp"] objectForKey:@"dat"];
            weather.tempNight = [[item objectForKey:@"temp"] objectForKey:@"night"];
            weather.tempEve = [[item objectForKey:@"temp"] objectForKey:@"eve"];
            weather.tempMorn = [[item objectForKey:@"temp"] objectForKey:@"morn"];
            
            
            weather.humidity = [item objectForKey:@"humidity"];
            weather.pressure = [item objectForKey:@"pressure"];
            
            weather.windSpeed = [item objectForKey:@"speed"];
            weather.windDeg = [item objectForKey:@"deg"];
            
            weather.clounds = [item objectForKey:@"clounds"];
            
            [daily.weathers addObject:weather];
        }
    }
    return self;
}

@end
