//
//  WHeaderView.m
//  caixun
//
//  Created by zhao weicheng on 2017/9/19.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import "WHeaderView.h"
@interface WHeaderView()
@property (weak, nonatomic) IBOutlet UIView *airQbg;
@property (weak, nonatomic) IBOutlet UILabel *temp;
@property (weak, nonatomic) IBOutlet UILabel *updateTime;
@property (weak, nonatomic) IBOutlet UILabel *wtherType;
@property (weak, nonatomic) IBOutlet UIImageView *wtherIcon;
@property (weak, nonatomic) IBOutlet UILabel *tempRange;
@property (weak, nonatomic) IBOutlet UILabel *weak;
@property (weak, nonatomic) IBOutlet UIImageView *airQimg;
@property (weak, nonatomic) IBOutlet UILabel *airQ;
@property (weak, nonatomic) IBOutlet UILabel *wind;
@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UILabel *pm25;
@property (weak, nonatomic) IBOutlet UILabel *wtherMsg;
@property (weak, nonatomic) IBOutlet UILabel *sunrise;
@property (weak, nonatomic) IBOutlet UILabel *sundown;
@property (weak, nonatomic) IBOutlet UILabel *pressure;
@property (weak, nonatomic) IBOutlet UILabel *city;

@end
@implementation WHeaderView

- (void)setWeatherModel:(JSWeatherModel *)weatherModel {
    _weatherModel = weatherModel;
    
    _city.text = weatherModel.city;
    _temp.text = weatherModel.temp==nil?@"--":weatherModel.temp;
    _updateTime.text =[NSString stringWithFormat:@"update:%@",weatherModel.updatetime==nil?@"--":weatherModel.updatetime];
    _wtherType.text = weatherModel.weather==nil?@"":weatherModel.weather;
    _wtherIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",weatherModel.img]];
    _tempRange.text = [NSString stringWithFormat:@"%@~%@℃",weatherModel.templow==nil?@"--":weatherModel.templow, weatherModel.temphigh==nil
                       ?@"--":weatherModel.temphigh];
    _weak.text = weatherModel.week==nil?@"--":weatherModel.week;
    _airQ.text = [NSString stringWithFormat:@"AQI: index %@/%@",weatherModel.aqi.aqi==nil?@"--":weatherModel.aqi.aqi,weatherModel.aqi.quality==nil?@"--":weatherModel.aqi.quality];
    _wind.text = [NSString stringWithFormat:@"%@ %@",weatherModel.winddirect==nil?@"--":weatherModel.winddirect,weatherModel.windpower==nil?@"--":weatherModel.windpower];
    _humidity.text = [NSString stringWithFormat:@"%@%%",weatherModel.humidity==nil?@"--":weatherModel.humidity];
    _pm25.text = [NSString stringWithFormat:@"index %@",weatherModel.aqi.pm2_5==nil?@"--":weatherModel.aqi.pm2_5];
    _sunrise.text = [NSString stringWithFormat:@"am.%@",weatherModel.daily.firstObject.sunrise==nil?@"--":weatherModel.daily.firstObject.sunrise];
    _sundown.text = [NSString stringWithFormat:@"pm.%@",weatherModel.daily.firstObject.sunset==nil?@"--":weatherModel.daily.firstObject.sunset];
    _pressure.text = [NSString stringWithFormat:@" %@kPa",weatherModel.pressure==nil?@"--":[NSString stringWithFormat:@"%0.f",[weatherModel.pressure doubleValue]/10.0]];
    

    NSInteger aqi = weatherModel.aqi.aqi.integerValue;
    if (aqi<=50) { //优
        self.airQimg.backgroundColor = [UIColor greenColor];
    }else if (aqi<=100){//良
         self.airQimg.backgroundColor = [UIColor yellowColor];
    } else if (aqi<=150){//轻度污染
         self.airQimg.backgroundColor = [UIColor orangeColor];
    }else if (aqi<=200){//中度污染
         self.airQimg.backgroundColor = [UIColor redColor];
    }else if (aqi<=300){//重度污染
         self.airQimg.backgroundColor = [UIColor purpleColor];
    }else {//严重污染
         self.airQimg.backgroundColor = [UIColor brownColor];
    }
    
    
  NSString *msg_scr = [NSString stringWithFormat:@"%@%@",weatherModel.aqi.aqiinfo.affect==nil?@"":weatherModel.aqi.aqiinfo.affect,weatherModel.aqi.aqiinfo.measure==nil?@"":weatherModel.aqi.aqiinfo.measure];
    _wtherMsg.text = msg_scr;

}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.airQimg.layer.cornerRadius = self.airQimg.frame.size.height/2;
    self.airQimg.layer.masksToBounds = YES;
}

+(instancetype)loadNibViewFrame:(CGRect)frame{
    
    WHeaderView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    view.frame = frame;
    return view;
}


@end
