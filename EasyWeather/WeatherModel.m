//
//  WeatherModel.m
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel

- (instancetype)init:(NSDictionary *)jsonData {
    self = [super init];
    if (self != nil) {
        WeatherModel *weather = self;
        
        NSDictionary* weather_first = [[jsonData objectForKey:@"weather"] objectAtIndex:0];
        weather.weatherID = [weather_first objectForKey:@"id"];
        weather.weatherName = [weather_first objectForKey:@"main"];
        weather.weatherDescription = [weather_first objectForKey:@"description"];
        weather.weatherIcon = [weather_first objectForKey:@"icon"];
        
        weather.cityID = [jsonData objectForKey:@"id"];
        weather.weatherName = [jsonData objectForKey:@"name"];
        
        int timeInterval = [[jsonData objectForKey:@"dt"] intValue];
        weather.dateTime = [NSDate dateWithTimeIntervalSinceNow:timeInterval];
        
        weather.lat = [[jsonData objectForKey:@"coord"] objectForKey:@"lat"];
        weather.lon = [[jsonData objectForKey:@"coord"] objectForKey:@"lon"];
        
        weather.temp = [[jsonData objectForKey:@"main"] objectForKey:@"temp"];
        weather.tempMax = [[jsonData objectForKey:@"main"] objectForKey:@"temp_max"];
        weather.tempMin = [[jsonData objectForKey:@"main"] objectForKey:@"temp_min"];
        
        weather.humidity = [[jsonData objectForKey:@"main"] objectForKey:@"humidity"];
        weather.pressure = [[jsonData objectForKey:@"main"] objectForKey:@"pressure"];
        
        weather.windSpeed = [[jsonData objectForKey:@"wind"] objectForKey:@"speed"];
        weather.windDeg = [[jsonData objectForKey:@"wind"] objectForKey:@"deg"];
    }
    return self;
}

@end
