//
//  Hour.m
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "Hour.h"

@implementation Hour

- (void)setData:(WeatherModel *) weatherModel {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    
    self.lblHour.text = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:weatherModel.dateTime]];
    self.lblStatus.text = weatherModel.weatherName;
    self.lblTemp.text = weatherModel.temp;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
