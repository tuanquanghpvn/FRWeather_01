//
//  LoginViewController.m
//  EasyWeather
//
//  Created by  on 5/6/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    
    self.facebookService = [[FacebookService alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {
    if ([self.facebookService currentAccessTokenFacebook]) {
        [self performSegueWithIdentifier:@"segueHomePage" sender:self];
    }
}

- (IBAction)loginFacebook:(id)sender {
    [self.facebookService login:self completion:^(BOOL isLogged) {
        // Get User Info
        if (isLogged) {
            [self.facebookService getUserInfo:^(NSDictionary *userInfo) {
                NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
                [userDefault setObject:userInfo forKey:@"profile"];
                
                NSArray *listCityID = @[@"1581129"];
                [userDefault setObject:listCityID forKey:@"city"];
                
                [userDefault synchronize];
            }];
        }
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
