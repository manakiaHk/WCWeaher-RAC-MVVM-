//
//  WDailyIndexCell.h
//  caixun
//
//  Created by zhao weicheng on 2017/9/21.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSWeatherModel.h"

typedef void(^NextBlock)();
@interface WDailyIndexCell : UITableViewCell
@property (nonatomic,copy) NextBlock nextBlock;
@property (nonatomic,strong) JSWeatherModel *model;
@property (weak, nonatomic) IBOutlet UIView *indexContent;

@end
