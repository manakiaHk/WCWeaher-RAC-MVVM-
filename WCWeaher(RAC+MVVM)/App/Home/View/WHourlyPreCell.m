//
//  WHourlyPreCell.m
//  caixun
//
//  Created by zhao weicheng on 2017/9/20.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import "WHourlyPreCell.h"

#import "WHourlyTempView.h"
@implementation WHourlyPreCell

- (void)setModel:(JSWeatherModel *)model {
    _model = model;
    
    [self layoutItems:model.hourly];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.selectionStyle = 0;
    
}

- (void)layoutItems:(NSArray*)hourlys {
    CGFloat itemM = 5;
    CGFloat itemW = 50;
    CGFloat itemH = self.scrollView.frame.size.height;
    CGFloat contentW = (itemW+itemM) * hourlys.count+itemM;
    self.scrollView.contentSize = CGSizeMake(contentW, 0);
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (NSInteger idx = 0; idx<hourlys.count; idx++) {
        CGFloat itemX = itemM + idx * (itemW + itemM);
        WHourlyTempView *item = [WHourlyTempView loadNibViewFrame:CGRectMake(itemX, 0, itemW, itemH)];
        item.layer.cornerRadius = 5;
        item.layer.masksToBounds = YES;
        item.model = hourlys[idx];
        [self.scrollView addSubview:item];
    }
}



@end
