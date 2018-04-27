//
//  HomeViewModel.m
//  WCWeaher(RAC&MVVM)
//
//  Created by zhao weicheng on 2018/4/26.
//  Copyright © 2018年 weichengz. All rights reserved.
//

#import "HomeViewModel.h"
#import "JSWeatherModel.h"
#import "HomeViewModel.h"
@implementation HomeViewModel

- (RACCommand *)loadWeatherDataCommand {//绑定命令
    if (!_loadWeatherDataCommand) {
        _loadWeatherDataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            return [self racSignalForLoadingWeatherData];///绑定命令信号
        }];
        [_loadWeatherDataCommand.executionSignals.switchToLatest subscribeNext:^(id retSuccessObj) {//订阅命令信号
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:retSuccessObj options:NSJSONReadingMutableContainers error:nil];
            if ([resultDic[@"status"] isEqualToString:@"0"]) {
                JSWeatherModel *model = [JSWeatherModel yy_modelWithDictionary:resultDic[@"result"]];
                if (self.successCallBack)self.successCallBack(model);
            }else {
                if (self.errorCallBack)self.errorCallBack(resultDic[@"result"]);
            }
        }];
    }
    return _loadWeatherDataCommand;
}
- (RACSignal*)racSignalForLoadingWeatherData {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSDictionary *param = @{
                              @"appkey":@"2deb9e6509b88064",
                              @"city":@"成都"
                              };
        [self sendGetWithURL:[NSURL URLWithString:@"http://api.jisuapi.com/weather/query"] RACSubscriber:subscriber parameter:param];
        return nil;
    }];
}
@end
