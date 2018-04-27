//
//  WDailyItem.m
//  caixun
//
//  Created by zhao weicheng on 2017/9/21.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import "WDailyItem.h"
@interface WDailyItem()
@property (weak, nonatomic) IBOutlet UILabel *details;
@property (weak, nonatomic) IBOutlet UILabel *iname;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation WDailyItem

-(void)setModel:(JSIndexModel *)model {
    _model = model;
    _details.text = @"--";
    _iname.text = model.iname;
    _details.text = model.detail;
    
    if ([model.iname containsString:@"空气"]) {
        _img.image = [UIImage imageNamed:@"空气污染02.png"];
    }else if ([model.iname containsString:@"紫外线"]){
        _img.image = [UIImage imageNamed:@"紫外线02.png"];
    }else if ([model.iname containsString:@"空调"]){
        _img.image = [UIImage imageNamed:@"空调02.png"];
    }else if ([model.iname containsString:@"穿衣"]){
        _img.image = [UIImage imageNamed:@"穿衣02.png"];
    }else if ([model.iname containsString:@"运动"]){
        _img.image = [UIImage imageNamed:@"跑步02.png"];
    }else if ([model.iname containsString:@"感冒"]){
        _img.image = [UIImage imageNamed:@"感冒02.png"];
    }else if ([model.iname containsString:@"洗车"]){
        _img.image = [UIImage imageNamed:@"洗车02.png"];
    }else {
        //.
    }

}

- (void)layoutSubviews {
    [super layoutSubviews];
    _iname.font = [UIFont systemFontOfSize:15];
    _details.font = [UIFont systemFontOfSize:11];

}
+(instancetype)loadNibViewFrame:(CGRect)frame{
    
    WDailyItem *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    view.frame = frame;
    return view;
    
}

@end
