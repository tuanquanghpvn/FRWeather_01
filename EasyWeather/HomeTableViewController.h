//
//  HomeTableViewController.h
//  EasyWeather
//
//  Created by  on 5/4/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCell.h"
#import "Header.h"
#import "DailyAPI.h"
#import "WeatherModel.h"

@interface HomeTableViewController : UITableViewController

@property (nonatomic) DailyAPI *dailyAPI;
@property (nonatomic) NSMutableArray *listCityID;
@property (nonatomic) NSMutableArray *weatherSection;

- (void)loadData;

@end
