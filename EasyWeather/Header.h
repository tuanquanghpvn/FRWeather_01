//
//  Header.h
//  EasyWeather
//
//  Created by  on 5/4/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherModel.h"
#import "DailyModel.h"
#import "Hour.h"

@interface Header : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UILabel *lblCityName;
@property (weak, nonatomic) IBOutlet UIScrollView *scvHour;

- (void)setData:(DailyModel *)dailyModel;
- (void)loadDataScrollView:(NSMutableArray *) jsonHour;

@end
