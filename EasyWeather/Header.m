//
//  Header.m
//  EasyWeather
//
//  Created by  on 5/4/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "Header.h"

@implementation Header

- (void)setData:(DailyModel *)dailyModel {
    self.lblCityName.text = dailyModel.cityName;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
