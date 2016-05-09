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
#import "WeatherService.h"
#import "DailyService.h"
#import "WeatherDTO.h"

@interface HomeTableViewController : UITableViewController

@property (nonatomic) DailyService *dailyService;
@property (nonatomic) NSMutableArray *listCityID;
@property (nonatomic) NSMutableArray *weatherSection;

- (void)loadData;
- (void)fetchNewDataWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

@end
