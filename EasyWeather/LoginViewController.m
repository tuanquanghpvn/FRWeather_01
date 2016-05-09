//
//  LoginViewController.m
//  EasyWeather
//
//  Created by  on 5/6/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
}

- (void)viewDidAppear:(BOOL)animated {
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
        NSLog(@"User is logged in!");
        [self performSegueWithIdentifier:@"segueHomePage" sender:self];
    }
}

- (IBAction)loginFacebook:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    [login
     logInWithReadPermissions: @[@"public_profile", @"email"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSDictionary *parameters = @{@"fields":@"name, email"};
             [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
              startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                  if (!error) {
                      NSLog(@"fetched user:%@", result);
                      
                      NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
                      [userDefault setObject:result forKey:@"profile"];
                      
                      NSArray *listCityID = @[@"1581129"];
                      [userDefault setObject:listCityID forKey:@"city"];
                      
                      [userDefault synchronize];
                  }
              }];
         }
     }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
