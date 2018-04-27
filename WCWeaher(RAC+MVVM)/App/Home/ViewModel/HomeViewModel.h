//
//  HomeViewModel.h
//  WCWeaher(RAC&MVVM)
//
//  Created by zhao weicheng on 2018/4/26.
//  Copyright © 2018年 weichengz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
@interface HomeViewModel : BaseViewModel
@property (strong, nonatomic) RACCommand * loadWeatherDataCommand;
@end
