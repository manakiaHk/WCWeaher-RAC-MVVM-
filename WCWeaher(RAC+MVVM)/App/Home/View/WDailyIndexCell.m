//
//  WDailyIndexCell.m
//  caixun
//
//  Created by zhao weicheng on 2017/9/21.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import "WDailyIndexCell.h"
#import "WDailyItem.h"
@implementation WDailyIndexCell

- (void)setModel:(JSWeatherModel *)model {
    _model = model;
   
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self layoutItems:_model.index];
    });
    
}

- (void)layoutItems:(NSArray<JSIndexModel*>*)indexs {
    
    NSInteger cols = 2;
    CGFloat itemM = 5;
    CGFloat itemW = (Screen.width - (cols+1)*itemM)/cols;
    CGFloat itemH = 100;
    
    [self.indexContent.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (NSInteger idx = 0 ; idx<indexs.count; idx++) {
        
        NSInteger row = idx / cols;
        NSInteger col = idx % cols;
        CGFloat itemX = itemM + col * (itemW + itemM);
        CGFloat itemY = row * (itemH ) + (row +1)*itemM;
        CGRect  itemFrame = CGRectMake(itemX, itemY, itemW, itemH);
        WDailyItem *item = [WDailyItem loadNibViewFrame:itemFrame];
        item.model = indexs[idx];
        item.layer.cornerRadius =  5;
        item.layer.masksToBounds = YES;
        [self.indexContent addSubview:item];
    }
}

@end
