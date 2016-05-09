//
//  FacebookService.m
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016. All rights reserved.
//

#import "FacebookService.h"

@implementation FacebookService

- (BOOL)currentAccessTokenFacebook {
    if ([FBSDKAccessToken currentAccessToken]) {
        return TRUE;
    }
    return FALSE;
}

- (void)login:(UIViewController *)viewController completion:(void (^)(BOOL isLogged))handleBlock {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile", @"email"]
     fromViewController:viewController
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error || result.isCancelled) {
             handleBlock(FALSE);
         } else {
             handleBlock(TRUE);
         }
     }];
}

- (void)getUserInfo:(void(^)(NSDictionary *userInfo))handleBlock {
    NSDictionary *parameters = @{@"fields":@"name, email"};
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             handleBlock(result);
         }
         handleBlock(nil);
     }];
}

- (BOOL)checkPermission {
    return TRUE;
}

- (BOOL)shareCaptureHome {
    return TRUE;
}

@end
