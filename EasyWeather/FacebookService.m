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
    
    [login logInWithPublishPermissions:@[@"publish_actions"] fromViewController:nil handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            handleBlock(NO);
        } else if (result.isCancelled) {
            handleBlock(NO);
        } else {
            if ([result.grantedPermissions containsObject:@"publish_actions"]) {
                [login logInWithReadPermissions:@[@"email", @"user_birthday"] fromViewController:viewController handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                    if (error) {
                        // Process error
                        handleBlock(NO);
                    } else if (result.isCancelled) {
                        // Handle cancellations
                        handleBlock(NO);
                    } else {
                        handleBlock(YES);
                    }
                }];
            } else {
                handleBlock(NO);
            }
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
