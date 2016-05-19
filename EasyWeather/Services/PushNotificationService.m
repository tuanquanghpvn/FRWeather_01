//
//  PushNotificationService.m
//  EasyWeather
//
//  Created by  on 5/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "PushNotificationService.h"

@implementation PushNotificationService

- (void)scheduleNotification {
    DailyAPI *dailyAPI = [DailyAPI new];
    [dailyAPI getDailyWeather:@"1581129" complete:^(BOOL isLogged, DailyModel *dailyDTO) {
        
        NSLog(@"Did Register for Remote Notifications with Device Token (%@)", dailyDTO);
        
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:7];
        notification.alertBody = @"This is local notification!";
        notification.timeZone = [NSTimeZone defaultTimeZone];
        notification.soundName = UILocalNotificationDefaultSoundName;
//        notification.applicationIconBadgeNumber = 10;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }];
}

@end
