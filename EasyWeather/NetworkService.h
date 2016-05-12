//
//  NetworkService.h
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "GlobalConfig.h"
#import "NetworkHelper.h"

@interface NetworkService : UIViewController

@property (nonatomic) AFHTTPSessionManager * sessionManager;

@property (nonatomic) BOOL type;
@property (nonatomic) NSDictionary *param;
@property (nonatomic) NSString *urlRequest;

@property (nonatomic, copy) void (^handlerBlock)(NSDictionary *, NSError *);

- (void)getData:(BOOL)type url:(NSString *)urlRequest parameter:(NSDictionary *)param complete:(void(^)(NSDictionary *data, NSError *error))handeBlock;
- (void)processingError:(NSError *)error;

@end
