//
//  DailyModel.m
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "DailyModel.h"

@implementation DailyModel

- (instancetype)init:(NSDictionary *)jsonDaily hour:(NSDictionary *)jsonHour {
    self = [super init];
    if (self != nil) {
        
        // Binding Daily Data
        self.weathers = [NSMutableArray new];
        
        DailyModel *daily = self;
        daily.cityID = [[jsonDaily objectForKey:@"city"] objectForKey:@"id"];
        daily.cityName = [[jsonDaily objectForKey:@"city"] objectForKey:@"name"];
        
        NSDictionary *coord = [[jsonDaily objectForKey:@"city"] objectForKey:@"coord"];
        daily.lat =  [[coord objectForKey:@"coord"] objectForKey:@"lat"];
        daily.lon = [[coord objectForKey:@"coord"] objectForKey:@"lon"];
        
        NSArray* weather_first = [jsonDaily objectForKey:@"list"];
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
        
        // Binding Hour Data
        self.hours = [NSMutableArray new];
        NSArray* weather_first_hour = [jsonHour objectForKey:@"list"];
        for (NSDictionary *item in weather_first_hour) {
            WeatherModel *weather = [WeatherModel new];
            
            NSDictionary* weather_temp = [[item objectForKey:@"weather"] objectAtIndex:0];
            weather.weatherID = [weather_temp objectForKey:@"id"];
            weather.weatherName = [weather_temp objectForKey:@"main"];
            weather.weatherDescription = [weather_temp objectForKey:@"description"];
            weather.weatherIcon = [weather_temp objectForKey:@"icon"];
            
            int timeInterval = [[item objectForKey:@"dt"] intValue];
            weather.dateTime = [NSDate dateWithTimeIntervalSince1970:timeInterval];
            
            float temp = [[[item objectForKey:@"main"] objectForKey:@"temp"] floatValue] - 273.15;
            weather.temp = [NSString stringWithFormat:@"%.2f", temp];
            
            weather.humidity = [[item objectForKey:@"main"] objectForKey:@"humidity"];
            weather.pressure = [[item objectForKey:@"main"] objectForKey:@"pressure"];
            
            weather.windSpeed = [[item objectForKey:@"wind"] objectForKey:@"speed"];
            weather.windDeg = [[item objectForKey:@"wind"] objectForKey:@"deg"];
            
            [daily.hours addObject:weather];
        }
        
    }
    return self;
}

@end
