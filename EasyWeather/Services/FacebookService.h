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
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface FacebookService : NSObject

- (BOOL)currentAccessTokenFacebook;
- (void)login:(UIViewController *)viewController completion:(void (^)(BOOL isLogged))handlerBlock;
- (void)getUserInfo:(void (^)(NSDictionary *userInfo))handleBlock;
- (void)checkPermission:(void (^)(BOOL isLogged))handleBlock;
- (void)shareScreenshot:(UIViewController *)viewController img:(UIImage *)imageShare;

@end
