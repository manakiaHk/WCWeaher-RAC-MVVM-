//
//  LocationManager.m
//  WCWeaher(RAC&MVVM)
//
//  Created by zhao weicheng on 2018/4/27.
//  Copyright © 2018年 weichengz. All rights reserved.
//

#import "LocationService.h"
@interface LocationService()<CLLocationManagerDelegate>
@property (nonatomic,copy) LocationCallBackBlock callback;
@property (nonatomic,copy) LocationCityCallBackBlock cityCallback;
@property (nonatomic,strong ) CLLocationManager *locationManager;
@end

@implementation LocationService
+ (instancetype)shareInstance {
    static  LocationService * _locationService = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _locationService  = [[self alloc] init];
    }) ;
    return _locationService ;
}


- (void)startUpdatingLocationCallBack:(LocationCallBackBlock)callback {
    self.callback = callback;
    [self.locationManager startUpdatingLocation];
}
- (void)startUpdatingLocationCityCallBack:(LocationCityCallBackBlock)callback {
    
    
}
- (CLLocationManager *)locationManager {
    if (!_locationManager&&[CLLocationManager locationServicesEnabled]) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        [_locationManager requestAlwaysAuthorization];
        [_locationManager requestWhenInUseAuthorization];
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 5.0;
    }
    return _locationManager;
}

#pragma mark - 定位失败
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"需要获取您的位置" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert wc_bindAlertButtonClickedBlockNext:^(NSInteger index) {
        NSURL *settingURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication]openURL:settingURL];
    }];
}
#pragma mark - 定位成功
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    NSTimeInterval locationAge = -[currentLocation.timestamp timeIntervalSinceNow];
    if (locationAge > 1.0){
        return;
    }
    [self.locationManager stopUpdatingLocation];
    if (self.callback)self.callback(locations.lastObject);
    
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count >0) {
            CLPlacemark *placeMark = placemarks[0];
            
            if (self.cityCallback) {
                self.cityCallback(placeMark.locality);
            }
            NSLog(@"当前国家 - %@",placeMark.country);//当前国家
            NSLog(@"当前城市 - %@",placeMark.locality);//当前城市
            NSLog(@"当前位置 - %@",placeMark.subLocality);//当前位置
            NSLog(@"当前街道 - %@",placeMark.thoroughfare);//当前街道
            NSLog(@"具体地址 - %@",placeMark.name);//具体地址

        }else if (error == nil && placemarks.count){
            NSLog(@"NO location and error return");
        }else if (error){
            NSLog(@"loction error:%@",error);
        }
    }];
}

@end
