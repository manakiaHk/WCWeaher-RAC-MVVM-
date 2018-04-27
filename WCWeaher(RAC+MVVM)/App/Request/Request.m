//
//  Request.m
//  WCWeaher(RAC&MVVM)
//
//  Created by zhao weicheng on 2018/4/26.
//  Copyright © 2018年 weichengz. All rights reserved.
//

#import "Request.h"
#import "HttpManager.h"
@implementation Request

+ (void)sendGetWithURL:(NSURL *)url
             parameter:(NSDictionary *)parameter
       requestProgress:(RequestProgress)finishProgress
        requestSuccess:(RequestSuccess)finishedSuccess
          requestError:(RequestError)finishedError; {
    HttpManager *manager = [HttpManager shareInstance];
    [manager GET:url.absoluteString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        if (finishProgress) finishProgress(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (finishedSuccess)finishedSuccess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (finishedError) {
            finishedError(error);
        }
    }];
}

+ (void)sendPostWithURL:(NSURL *)url
              parameter:(NSDictionary *)parameter
        requestProgress:(RequestProgress)finishProgress
         requestSuccess:(RequestSuccess)finishedSuccess
           requestError:(RequestError)finishedError {
    HttpManager *manager = [HttpManager shareInstance];
    [manager POST:url.absoluteString parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        if (finishProgress)finishProgress(uploadProgress);
    }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (finishedSuccess)finishedSuccess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (finishedError)finishedSuccess(error);
    }];
}
@end
