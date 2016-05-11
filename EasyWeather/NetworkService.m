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

- (void)checkNetwork {
    // Allocate a reachability object
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    // Set the blocks
    reach.reachableBlock = ^(Reachability*reach)
    {
        // keep in mind this is called on a background thread
        // and if you are updating the UI it needs to happen
        // on the main thread, like this:
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"REACHABLE!");
        });
    };
    
    reach.unreachableBlock = ^(Reachability*reach)
    {
        NSLog(@"UNREACHABLE!");
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                            message:@"No network found!"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        });
    };
    
    // Start the notifier, which will cause the reachability object to retain itself!
    [reach startNotifier];
}

- (void)getData:(BOOL)type url:(NSString *)urlRequest parameter:(NSDictionary *)param complete:(void (^)(NSDictionary *, NSError *))handeBlock {
    [self checkNetwork];
    
    if (type) {
        [self.sessionManager GET:urlRequest parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *jsonData = responseObject;
            handeBlock(jsonData, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self processingError:error];
        }];
    } else {
        [self.sessionManager POST:urlRequest parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *jsonData = responseObject;
            handeBlock(jsonData, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self processingError:error];
        }];
    }
}

- (void)processingError:(NSError *)error {
    NSLog(@"Error");
    NSLog(@"%@", error);
}

@end
