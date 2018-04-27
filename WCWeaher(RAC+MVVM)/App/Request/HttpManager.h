//
//  HttpManager.h
//  WCWeaher(RAC&MVVM)
//
//  Created by zhao weicheng on 2018/4/26.
//  Copyright © 2018年 weichengz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@interface HttpManager : AFHTTPSessionManager
+ (instancetype)shareInstance;
@end
