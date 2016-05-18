//
//  OneSignalService.m
//  EasyWeather
//
//  Created by  on 5/16/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "OneSignalService.h"

@implementation OneSignalService

- (void)registerOneSignal:(NSDictionary *) launchOptions {
    // OneSignal
    self.oneSignal = [[OneSignal alloc]
                      initWithLaunchOptions:launchOptions
                      appId:ONE_SIGNAL_ID
                      handleNotification:^(NSString* message, NSDictionary* additionalData, BOOL isActive) {
                          NSLog(@"OneSignal Notification opened:\nMessage: %@", message);
                          
                          if (additionalData) {
                              NSLog(@"additionalData: %@", additionalData);
                              
                              // Check for and read any custom values you added to the notification
                              // This done with the "Additonal Data" section the dashbaord.
                              // OR setting the 'data' field on our REST API.
                              NSString* customKey = additionalData[@"customKey"];
                              if (customKey)
                                  NSLog(@"customKey: %@", customKey);
                          }
                      }];

}

@end
