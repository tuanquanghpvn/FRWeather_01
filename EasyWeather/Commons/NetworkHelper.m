//
//  NetworkHelper.m
//  EasyWeather
//
//  Created by  on 5/11/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "NetworkHelper.h"

@implementation NetworkHelper

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    }
    return self;
}

- (BOOL)isNetworkAvailable {
    return [[AFNetworkReachabilityManager sharedManager] isReachable];
}

@end
