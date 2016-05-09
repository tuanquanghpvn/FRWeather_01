//
//  AFConfig.h
//  EasyWeather
//
//  Created by  on 5/5/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#define BASE_URL @"http://api.openweathermap.org/data/2.5/"
#define APP_ID @"d77b3fa0998439dc4ec3115d3c1f6cb8"

@interface AFConfig : NSObject

+ (AFHTTPSessionManager *) getManager;

@end
