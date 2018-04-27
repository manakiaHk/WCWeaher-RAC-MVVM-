//
//  WDailyItem.h
//  caixun
//
//  Created by zhao weicheng on 2017/9/21.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSWeatherModel.h"
@interface WDailyItem : UIView
@property (nonatomic,strong) JSIndexModel *model;
+(instancetype)loadNibViewFrame:(CGRect)frame;
@end
