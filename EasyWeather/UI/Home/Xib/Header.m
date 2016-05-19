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
    [self loadDataScrollView:dailyModel.hours];
}

- (void)loadDataScrollView:(NSMutableArray *) jsonHour {
    float width = 50;
    
    NSUInteger index = 0;
    for (WeatherModel *weatherModel in jsonHour) {
        Hour *hourView = (Hour *)[[[NSBundle mainBundle] loadNibNamed:@"Hour" owner:self options:nil] lastObject];
        // Set Frame
        CGRect frame = hourView.bounds;
        frame.origin.x = frame.size.width / 1.5 * index;
        width = width + frame.size.width / 1.5;
        frame.origin.y = 0;
        [hourView setFrame:frame];
        
        // Set Data
        [hourView setData:weatherModel];
        
        [self.scvHour addSubview:hourView];
        index++;
    }
    
    [self.scvHour setContentSize:CGSizeMake(width, self.scvHour.bounds.size.height)];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.lblCityName.text = @"";
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
