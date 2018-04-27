//
//  WHourlyPreCell.h
//  caixun
//
//  Created by zhao weicheng on 2017/9/20.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSWeatherModel.h"
@interface WHourlyPreCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic,strong) JSWeatherModel *model;

@end
