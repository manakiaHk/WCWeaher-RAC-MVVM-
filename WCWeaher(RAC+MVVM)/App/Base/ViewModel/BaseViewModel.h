//
//  BaseViewModel.h
//  WCWeaher(RAC&MVVM)
//
//  Created by zhao weicheng on 2018/4/26.
//  Copyright © 2018年 weichengz. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^RequestSuccessCallBack)(id retObj);
typedef void(^RequestErrorCallBack)(id error);
typedef void(^RequestProgressCallBack)(id progress);
@interface BaseViewModel : NSObject
@property (strong, nonatomic) RequestSuccessCallBack successCallBack;
@property (strong, nonatomic) RequestErrorCallBack errorCallBack;
@property (strong, nonatomic) RequestProgressCallBack progressCallBack;
- (void)sendGetWithURL:(NSURL *)url RACSubscriber:(id<RACSubscriber>)subscriber parameter:(NSDictionary *)dic;
- (void)sendPostWithURL:(NSURL *)url RACSubscriber:(id<RACSubscriber>)subscriber parameter:(NSDictionary *)dic;
@end
