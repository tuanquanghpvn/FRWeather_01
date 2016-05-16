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
    // NetworkHelper *networkHelper = [NetworkHelper new];
    // [networkHelper isNetworkAvailable]
    // HardCode
    if (YES) {
        if (type) {
            [self.sessionManager GET:urlRequest parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *jsonData = responseObject;
                handeBlock(jsonData, nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self processingError:error];
                handeBlock(nil, error);
            }];
        } else {
            [self.sessionManager POST:urlRequest parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *jsonData = responseObject;
                handeBlock(jsonData, nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self processingError:error];
                handeBlock(nil, error);
            }];
        }
    } else {
        self.type = type;
        self.param = param;
        self.urlRequest = urlRequest;
        self.handlerBlock = handeBlock;
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Network not found!" message:@"Do you want retry?"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:@"Cancel", nil];
        
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == [alertView cancelButtonIndex]) {
        [self getData:self.type url:self.urlRequest parameter:self.param complete:self.handlerBlock];
    }
}

- (void)processingError:(NSError *)error {
    NSLog(@"Error");
    NSLog(@"%@", error);
}

@end
