//
//  LoginViewController.h
//  EasyWeather
//
//  Created by  on 5/6/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewController.h"
#import "FacebookService.h"


@interface LoginViewController : UIViewController

@property (nonatomic) FacebookService* facebookService;

@end
