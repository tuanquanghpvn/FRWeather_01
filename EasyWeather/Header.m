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
    [self loadDataScrollView];
}

- (void)loadDataScrollView {
    for (int i=0; i < 8; i++) {
        Hour *hourView = (Hour *)[[[NSBundle mainBundle] loadNibNamed:@"Hour" owner:self options:nil] lastObject];
        
        hourView.lblHour.text = [NSString stringWithFormat:@"%d", i];
        hourView.lblStatus.text = @"Sun";
        hourView.lblTemp.text = @"28";
        
        [self.scvHour addSubview:hourView];
    
        CGRect frame;
        frame.origin.x = self.scvHour.frame.size.width * 2;
        frame.origin.y = 0;
        frame.size = self.scvHour.frame.size;
        
        [hourView setFrame:frame];
    }
    
    [self.scvHour setContentSize:CGSizeMake(8 * 25, 25)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
