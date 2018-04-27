//
//  WTodayWeatherHeader.m
//  caixun
//
//  Created by zhao weicheng on 2017/9/19.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import "WTodayWeatherHeader.h"
@interface WTodayWeatherHeader()
@property (weak, nonatomic) IBOutlet UILabel *todayTemp;
@property (weak, nonatomic) IBOutlet UILabel *todaywether;

@property (weak, nonatomic) IBOutlet UIImageView *todaywherIcon;

@property (weak, nonatomic) IBOutlet UILabel *tomorrowTemp;
@property (weak, nonatomic) IBOutlet UILabel *tomorrowwether;

@property (weak, nonatomic) IBOutlet UIImageView *tomorrowwherIcon;

@end
@implementation WTodayWeatherHeader


- (void)setWeatherModel:(JSWeatherModel *)weatherModel {
    
    _weatherModel = weatherModel;
    _todayTemp.text = [NSString stringWithFormat:@"%@/%@℃",weatherModel.daily.firstObject.day.temphigh,weatherModel.daily.firstObject.night.templow];
    _todaywether.text =weatherModel.daily.firstObject.day.weather;
    _todaywherIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",weatherModel.img]];
    _tomorrowTemp.text = [NSString stringWithFormat:@"%@/%@℃",weatherModel.daily[1].day.temphigh,weatherModel.daily[1].night.templow];
    _tomorrowwether.text = weatherModel.daily[1].day.weather;
    _tomorrowwherIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",weatherModel.daily[1].day.img]];
    NSLog(@"%@-%@",[NSString stringWithFormat:@"%@.png",weatherModel.img],[NSString stringWithFormat:@"%@.png",weatherModel.daily[1].day.img]);
}

+(instancetype)loadNibViewFrame:(CGRect)frame{
    
    WTodayWeatherHeader *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    view.frame = frame;
    return view;
}


@end
