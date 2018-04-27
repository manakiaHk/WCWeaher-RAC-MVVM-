//
//  WDailyPreCell.m
//  caixun
//
//  Created by zhao weicheng on 2017/9/20.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import "WDailyPreCell.h"
#import "WDailyTempView.h"
@implementation WDailyPreCell
- (void)setModel:(JSWeatherModel *)model {
    _model = model;
    
    
    @weakify(self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self);
        [self layoutItems:model.daily];
    });
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.selectionStyle = 0;
    
    self.icon.image = [UIImage imageNamed:@"日历.png"];
}


- (void)layoutItems:(NSArray<JSDailyModel*>*)dailys {
    
    CGFloat overW = 0.1; //溢出尺寸scorll产生滑动效果
    
    CGFloat itemW = Screen.width/dailys.count +overW <60?60:Screen.width/dailys.count +overW;
    CGFloat itemM = 5;
    CGFloat itemH = self.scrollView.frame.size.height;
    CGFloat contentW = (itemW+itemM)*dailys.count +itemM;
    
    
    
    self.scrollView.contentSize = CGSizeMake(contentW, 0);
    
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (NSInteger idx = 0; idx<dailys.count; idx++) {
        
//        CGFloat itemX = itemW*idx;
        CGFloat itemX = itemM + idx * (itemW + itemM);
        
        WDailyTempView *item = [WDailyTempView loadNibViewFrame:CGRectMake(itemX, 0, itemW, itemH)];
        item.layer.cornerRadius = 5;
        item.layer.masksToBounds = YES;
        
        if ([dailys[idx].date isEqualToString:[self getTaday]]) {
            dailys[idx].week = @"今天";
            dailys[idx+1].week = @"明天";
            
        }
        
        item.model = dailys[idx];
       
        [self.scrollView addSubview:item];
        
    }
}
- (NSString *)getTaday
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:[NSDate date]];
    
        NSInteger year=[comps year];
        NSInteger month = [comps month];
        NSInteger day = [comps day];
    
        NSString *monthstr = month<10?[NSString stringWithFormat:@"0%ld",(long)month]:[NSString stringWithFormat:@"%ld",(long)month];
    
        NSString *daystr = day<10?[NSString stringWithFormat:@"0%ld",(long)day]:[NSString stringWithFormat:@"%ld",(long)day];
    
    
        NSString * dateStr = [NSString stringWithFormat:@"%@-%@-%@",
                              [NSString stringWithFormat:@"%ld", (long)year],
                              monthstr,
                              daystr
                              ];
    

    NSLog(@"%@",dateStr);
    
 
    
    return dateStr;
    
}

@end
