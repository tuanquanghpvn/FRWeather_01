//
//  NetworkHelper.m
//  EasyWeather
//
//  Created by  on 5/11/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "NetworkHelper.h"

@implementation NetworkHelper

- (BOOL)isNetworkAvailable {
    if ([[AFNetworkReachabilityManager sharedManager] isReachable]) {
        return YES;
    }
    return NO;
}

@end
