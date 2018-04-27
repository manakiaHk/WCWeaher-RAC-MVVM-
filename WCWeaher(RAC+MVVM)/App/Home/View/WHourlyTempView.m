//
//  WHourlyTempView.m
//  caixun
//
//  Created by zhao weicheng on 2017/9/20.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import "WHourlyTempView.h"
@interface WHourlyTempView()

@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *temp;

@end
@implementation WHourlyTempView
-(void)setModel:(JSHourlyModel *)model {
    _model = model;
    _time.text = model.time;
    _temp.text = [NSString stringWithFormat:@"%@℃",model.temp];
    _icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",model.img]];
}

+(instancetype)loadNibViewFrame:(CGRect)frame{
    
    WHourlyTempView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    view.frame = frame;
    return view;
    
}

@end
