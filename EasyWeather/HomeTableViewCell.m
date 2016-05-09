//
//  HomeTableViewCell.m
//  EasyWeather
//
//  Created by  on 5/4/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellData:(WeatherModel *)weatherModel {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle: NSDateFormatterLongStyle];
    
    self.lblDay.text = [dateFormatter stringFromDate:weatherModel.dateTime];
    self.lblStatus.text = [NSString stringWithFormat:@"%@ - %@", weatherModel.weatherName, weatherModel.temp];
}

@end
