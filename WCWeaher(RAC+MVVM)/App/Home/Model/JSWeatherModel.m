//
//  JSWeatherModel.m
//  caixun
//
//  Created by zhao weicheng on 2017/9/20.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import "JSWeatherModel.h"

@implementation JSWeatherModel

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{
             @"index" : [JSIndexModel class],
             @"daily" : [JSDailyModel class],
             @"hourly" : [JSHourlyModel class]
             };
    
}


@end
@implementation JSHourlyModel

@end

@implementation JSDailyModel

@end

@implementation JSNightModel

@end
@implementation JSDayModel

@end
@implementation JSIndexModel

@end

@implementation JSAqiModel

@end
@implementation JSAqiinfoModel

@end
