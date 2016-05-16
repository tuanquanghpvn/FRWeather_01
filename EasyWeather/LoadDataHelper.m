//
//  LoadDataHelper.m
//  EasyWeather
//
//  Created by  on 5/16/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

#import "LoadDataHelper.h"

@implementation LoadDataHelper

- (NSDictionary *)loadJsonData:(NSString *)fileName {
    // Get local json file we'll be using to populate our TableView
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    return dict;
}

@end
