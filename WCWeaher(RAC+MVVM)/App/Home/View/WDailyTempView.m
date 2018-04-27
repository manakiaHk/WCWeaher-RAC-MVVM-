//
//  WDailyTempView.m
//  caixun
//
//  Created by zhao weicheng on 2017/9/20.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import "WDailyTempView.h"

@interface WDailyTempView ()
@property (weak, nonatomic) IBOutlet UILabel *weak;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *dayweather;
@property (weak, nonatomic) IBOutlet UIImageView *dayicon;
@property (weak, nonatomic) IBOutlet UILabel *daytemp;

@property (weak, nonatomic) IBOutlet UILabel *nightweather;
@property (weak, nonatomic) IBOutlet UIImageView *nighticon;
@property (weak, nonatomic) IBOutlet UILabel *nighttemp;
@property (weak, nonatomic) IBOutlet UILabel *winddrt;
@property (weak, nonatomic) IBOutlet UILabel *windpower;

@end
@implementation WDailyTempView

- (void)setModel:(JSDailyModel *)model {
    _model = model;
    _weak.text = model.week;
    
    if ([model.week isEqualToString:@"今天"]) {
        _weak.textColor = SetHexColor(0xCAFFFF);
        _date.textColor = SetHexColor(0xCAFFFF);
        _dayweather.textColor = SetHexColor(0xCAFFFF);
        _daytemp.textColor = SetHexColor(0xCAFFFF);
        _nightweather.textColor = SetHexColor(0xCAFFFF);
        _nighttemp.textColor = SetHexColor(0xCAFFFF);
        _windpower.textColor = SetHexColor(0xCAFFFF);
        _winddrt.textColor = SetHexColor(0xCAFFFF);
        
    }
    if ([model.week isEqualToString:@"明天"]||[model.week isEqualToString:@"后天"]){
        _weak.font = [UIFont systemFontOfSize:12];
        
    }
    if ([model.week isEqualToString:@"今天"]
        ||[model.week isEqualToString:@"明天"]
        ||[model.week isEqualToString:@"后天"]) {
        self.backgroundColor =   SetHexColor(0x28303B);
    }
    
       
       NSDateFormatter *form = [[NSDateFormatter alloc]init];
       [form setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
       [form setDateFormat:@"yyyy-MM-dd"];
       NSDate *date = [form dateFromString:model.date];
       [form setDateFormat:@"MM/dd"];
    _date.text =[form stringFromDate:date];
    _dayweather.text = model.day.weather;
    _dayicon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",model.day.img]];
    _daytemp.text = [NSString stringWithFormat:@"%@℃",model.day.temphigh];
    _nightweather.text = model.night.weather;
    _nighticon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",model.night.img]];
    _nighttemp.text = [NSString stringWithFormat:@"%@℃",model.night.templow];
    _winddrt.text = model.day.winddirect;
    _windpower.text = model.day.windpower;
    
}
                               
+(instancetype)loadNibViewFrame:(CGRect)frame{
    
    WDailyTempView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    view.frame = frame;
    return view;
    
}



@end
