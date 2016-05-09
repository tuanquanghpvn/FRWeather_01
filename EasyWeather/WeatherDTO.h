//
//  WeatherDTO.h
//  EasyWeather
//
//  Created by  on 5/5/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDTO : NSObject

@property (nonatomic) NSString *weatherID;
@property (nonatomic) NSString *weatherName;
@property (nonatomic) NSString *weatherDescription;
@property (nonatomic) NSString *weatherIcon;

@property (nonatomic) NSString *cityID;
@property (nonatomic) NSString *cityName;
@property (nonatomic) NSDate *dateTime;

@property (nonatomic) NSString *lon;
@property (nonatomic) NSString *lat;

@property (nonatomic) NSString *temp;
@property (nonatomic) NSString *tempMin;
@property (nonatomic) NSString *tempMax;
@property (nonatomic) NSString *tempDay;
@property (nonatomic) NSString *tempNight;
@property (nonatomic) NSString *tempEve;
@property (nonatomic) NSString *tempMorn;

@property (nonatomic) NSString *pressure;
@property (nonatomic) NSString *humidity;

@property (nonatomic) NSString *windSpeed;
@property (nonatomic) NSString *windDeg;

@property (nonatomic) NSString *clounds;

- (instancetype)init:(NSDictionary *)jsonData;

@end
