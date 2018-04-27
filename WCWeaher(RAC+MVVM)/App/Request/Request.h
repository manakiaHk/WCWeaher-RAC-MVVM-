//
//  Request.h
//  WCWeaher(RAC&MVVM)
//
//  Created by zhao weicheng on 2018/4/26.
//  Copyright © 2018年 weichengz. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^RequestSuccess)(id retObj);
typedef void(^RequestError)(NSError *requestError);
typedef void(^RequestProgress)(id requestProgress);
@interface Request : NSObject
/**
 *  Get请求
 *
 *  @param url          请求的url
 *  @param parameter    参数,字典形式
 *  @param finishedSuccess  成功返回
 *  @param finishedError 失败返回
 */
+ (void)sendGetWithURL:(NSURL *)url
             parameter:(NSDictionary *)parameter
       requestProgress:(RequestProgress)finishProgress
        requestSuccess:(RequestSuccess)finishedSuccess
          requestError:(RequestError)finishedError;
/**
 *  Post请求
 *
 *  @param url          整个请求的url
 *  @param parameter     参数，字典形式
 *  @param finishedSuccess  成功返回
 *  @param finishedError 失败返回错误描述字符串
 */
+ (void)sendPostWithURL:(NSURL *)url
              parameter:(NSDictionary *)parameter
        requestProgress:(RequestProgress)finishProgress
         requestSuccess:(RequestSuccess)finishedSuccess
           requestError:(RequestError)finishedError;
@end
