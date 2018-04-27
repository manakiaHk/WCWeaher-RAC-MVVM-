//
//  HttpManager.m
//  WCWeaher(RAC&MVVM)
//
//  Created by zhao weicheng on 2018/4/26.
//  Copyright © 2018年 weichengz. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager
+ (instancetype)shareInstance {
    static  HttpManager * _httpManager = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _httpManager  = [[self alloc] init] ;
        _httpManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _httpManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [_httpManager.requestSerializer setTimeoutInterval:30];
        [_httpManager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/javascript",@"text/plain",nil]];
    }) ;
    return _httpManager ;
}
@end
