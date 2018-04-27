//
//  BaseViewModel.m
//  WCWeaher(RAC&MVVM)
//
//  Created by zhao weicheng on 2018/4/26.
//  Copyright © 2018年 weichengz. All rights reserved.
//

#import "BaseViewModel.h"
#import "Request.h"
@implementation BaseViewModel

- (void)sendGetWithURL:(NSURL *)url RACSubscriber:(id<RACSubscriber>)subscriber parameter:(NSDictionary *)dic {
    [Request sendGetWithURL:url parameter:dic requestProgress:^(id requestProgress) {
        if (self.progressCallBack)self.progressCallBack(requestProgress);
    } requestSuccess:^(id retObj) {
        [subscriber sendNext:retObj];
        [subscriber sendCompleted];
    } requestError:^(NSError *requestError) {
        if (self.errorCallBack)self.errorCallBack(requestError);
        [subscriber sendCompleted];
    }];
}
- (void)sendPostWithURL:(NSURL *)url RACSubscriber:(id<RACSubscriber>)subscriber parameter:(NSDictionary *)dic {
    [Request sendPostWithURL:url parameter:dic requestProgress:^(id requestProgress) {
       if (self.progressCallBack)self.progressCallBack(requestProgress);
    } requestSuccess:^(id retObj) {
        [subscriber sendNext:retObj];
        [subscriber sendCompleted];
    } requestError:^(NSError *requestError) {
        if (self.errorCallBack)self.errorCallBack(requestError);
        [subscriber sendCompleted];
    }];
}
@end
