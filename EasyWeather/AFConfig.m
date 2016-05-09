//
//  AFConfig.m
//  EasyWeather
//
//  Created by  on 5/5/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "AFConfig.h"

@implementation AFConfig

+ (AFHTTPSessionManager *)getManager {
    NSURL *url_base = [NSURL URLWithString:BASE_URL];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url_base sessionConfiguration:configuration];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    return manager;
}

@end
