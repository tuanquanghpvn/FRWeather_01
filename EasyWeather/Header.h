//
//  Header.h
//  EasyWeather
//
//  Created by  on 5/4/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyModel.h"

@interface Header : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UILabel *lblCityName;

- (void)setData:(DailyModel *)dailyModel;

@end
