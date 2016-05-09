//
//  NetworkService.m
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "NetworkService.h"

@implementation NetworkService

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        NSURL *url_base = [NSURL URLWithString:BASE_URL];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url_base sessionConfiguration:configuration];
        [self.sessionManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [self.sessionManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    }
    return self;
}

- (void)getData:(BOOL)type url:(NSString *)urlRequest parameter:(NSDictionary *)param complete:(void (^)(NSDictionary *, NSError *))handeBlock {
    if (type) {
        [self.sessionManager GET:urlRequest parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *jsonData = responseObject;
            handeBlock(jsonData, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            handeBlock(nil, error);
        }];
    } else {
        [self.sessionManager POST:urlRequest parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *jsonData = responseObject;
            handeBlock(jsonData, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            handeBlock(nil, error);
        }];
    }
}

@end
