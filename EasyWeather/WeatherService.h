//
//  WeatherService.h
//  EasyWeather
//
//  Created by  on 5/5/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherDTO.h"
#import "AFConfig.h"

@interface WeatherService : NSObject

- (void)getCurrentWeather: (int)cityID complete:(void(^)(BOOL isLogged,WeatherDTO *weatherDTO))completionBlock;

@end
