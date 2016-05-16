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
    
    [login logInWithReadPermissions:@[@"public_profile", @"email"] fromViewController:viewController handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
            handleBlock(NO);
        } else if (result.isCancelled) {
            // Handle cancellations
            handleBlock(NO);
        } else {
//            handleBlock(YES);
            [login logInWithPublishPermissions:@[@"publish_actions"] fromViewController:viewController handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                if (error) {
                    handleBlock(NO);
                } else {
                    handleBlock(YES);
                }
            }];
        }
    }];
}

- (void)getUserInfo:(void(^)(NSDictionary *userInfo))handleBlock {
    NSDictionary *parameters = @{@"fields":@"name, email"};
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             NSLog(@"%@", result);
             handleBlock(result);
         }
         handleBlock(nil);
     }];
}

- (void)checkPermission:(void (^)(BOOL isLogged))handleBlock {
    if ([[FBSDKAccessToken currentAccessToken] hasGranted:@"publish_actions"]) {
        // TODO: publish content.
        NSLog(@"You have permission publish");
        handleBlock(YES);
    } else {
        NSLog(@"Need Permission");
        handleBlock(NO);
    }
}

- (void)shareScreenshot:(UIViewController *)viewController img:(UIImage *)imageShare {
    FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
    photo.image = imageShare;
    photo.userGenerated = YES;
    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    content.photos = @[photo];
    
    [FBSDKShareDialog showFromViewController:viewController withContent:content delegate:nil];
}

@end
