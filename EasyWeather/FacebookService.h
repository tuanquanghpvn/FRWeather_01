//
//  FacebookService.h
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface FacebookService : NSObject

- (BOOL)currentAccessTokenFacebook;
- (void)login:(UIViewController *)viewController completion:(void (^)(BOOL isLogged))handlerBlock;
- (void)getUserInfo:(void (^)(NSDictionary *userInfo))handleBlock;
- (BOOL)checkPermission;
- (BOOL)shareCaptureHome;

@end
