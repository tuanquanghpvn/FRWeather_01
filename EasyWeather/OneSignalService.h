//
//  OneSignalService.h
//  EasyWeather
//
//  Created by  on 5/16/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalConfig.h"
#import <OneSignal/OneSignal.h>

@interface OneSignalService : NSObject

@property (nonatomic) OneSignal *oneSignal;

- (void)registerOneSignal:(NSDictionary *) launchOptions;

@end
