//
//  WHeaderView.h
//  caixun
//
//  Created by zhao weicheng on 2017/9/19.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JSWeatherModel.h"
@interface WHeaderView : UIView
@property (nonatomic,strong) JSWeatherModel *weatherModel;
+(instancetype)loadNibViewFrame:(CGRect)frame;

@end
