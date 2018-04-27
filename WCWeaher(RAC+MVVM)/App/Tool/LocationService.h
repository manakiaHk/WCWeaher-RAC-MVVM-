//
//  LocationManager.h
//  WCWeaher(RAC&MVVM)
//
//  Created by zhao weicheng on 2018/4/27.
//  Copyright © 2018年 weichengz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationCallBackBlock)(CLLocation *location);
typedef void(^LocationCityCallBackBlock)(NSString *city);
@interface LocationService : NSObject
+ (instancetype)shareInstance;
- (void)startUpdatingLocationCallBack:(LocationCallBackBlock)callback;
- (void)startUpdatingLocationCityCallBack:(LocationCityCallBackBlock)callback;
@end
