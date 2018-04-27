//
//  JSWeatherModel.h
//  caixun
//
//  Created by zhao weicheng on 2017/9/20.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>
@interface JSHourlyModel : NSObject<YYModel>
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *weather;
@property (nonatomic,strong) NSString *temp;
@property (nonatomic,strong) NSString *img;
@end

@interface JSNightModel : NSObject<YYModel>
@property (nonatomic,strong) NSString *weather;
@property (nonatomic,strong) NSString *templow;
@property (nonatomic,strong) NSString *img;
@property (nonatomic,strong) NSString *winddirect;
@property (nonatomic,strong) NSString *windpower;
@end

@interface JSDayModel : NSObject<YYModel>
@property (nonatomic,strong) NSString *weather;
@property (nonatomic,strong) NSString *temphigh;
@property (nonatomic,strong) NSString *img;
@property (nonatomic,strong) NSString *winddirect;
@property (nonatomic,strong) NSString *windpower;
@end

@interface JSDailyModel : NSObject<YYModel>
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *week;
@property (nonatomic,strong) NSString *sunrise;//日出时间
@property (nonatomic,strong) NSString *sunset;//日落时间
@property (nonatomic,strong) JSNightModel *night;
@property (nonatomic,strong) JSDayModel *day;
@end

@interface JSIndexModel : NSObject<YYModel>
@property (nonatomic,strong) NSString *iname;//iname
@property (nonatomic,strong) NSString *ivalue;//指数值
@property (nonatomic,strong) NSString *detail;//指数详情
@end

@interface JSAqiinfoModel : NSObject<YYModel>

@property (nonatomic,strong) NSString *level;//等级
@property (nonatomic,strong) NSString *color;//指数颜色值
@property (nonatomic,strong) NSString *affect;//对健康的影响
@property (nonatomic,strong) NSString *measure;//建议采取的措施
@end

@interface JSAqiModel : NSObject<YYModel>
@property (nonatomic,strong) NSString *so2;//二氧化硫1小时平均
@property (nonatomic,strong) NSString *so224;//二氧化硫24小时平均
@property (nonatomic,strong) NSString *no2;//二氧化氮1小时平均
@property (nonatomic,strong) NSString *no224;//二氧化氮24小时平均
@property (nonatomic,strong) NSString *co;//一氧化碳1小时平均 mg/m3
@property (nonatomic,strong) NSString *co24;//一氧化碳24小时平均 mg/m3
@property (nonatomic,strong) NSString *o3;//臭氧1小时平均
@property (nonatomic,strong) NSString *o38;//臭氧8小时平均
@property (nonatomic,strong) NSString *o324;//臭氧24小时平均
@property (nonatomic,strong) NSString *pm10;//PM10 1小时平均
@property (nonatomic,strong) NSString *pm1024;//PM10 24小时平均
@property (nonatomic,strong) NSString *pm2_5;//PM2.5 1小时平均
@property (nonatomic,strong) NSString *pm2_524;//PM2.5 24小时平均
@property (nonatomic,strong) NSString *iso2;//二氧化硫指数
@property (nonatomic,strong) NSString *ino2;//二氧化氮指数
@property (nonatomic,strong) NSString *ico;//一氧化碳指数
@property (nonatomic,strong) NSString *io3;//臭氧指数
@property (nonatomic,strong) NSString *io38;//臭氧8小时指数
@property (nonatomic,strong) NSString *ipm10;//PM10指数
@property (nonatomic,strong) NSString *ipm2_5;//PM2.5指数
@property (nonatomic,strong) NSString *aqi;//AQI指数
@property (nonatomic,strong) NSString *primarypollutant;//首要污染物
@property (nonatomic,strong) NSString *quality;//空气质量指数类别，有“优、良、轻度污染、中度污染、重度污染、严重污染”6类
@property (nonatomic,strong) NSString *timepoint;//发布时间
@property (nonatomic,strong) JSAqiinfoModel *aqiinfo;//AQI指数信息

@end

@interface JSWeatherModel : NSObject<YYModel>
@property (nonatomic,strong) NSString *city;//城市
@property (nonatomic,strong) NSString *cityid;//城市ID
@property (nonatomic,strong) NSString *citycode;//城市天气代号
@property (nonatomic,strong) NSString *date;//日期
@property (nonatomic,strong) NSString *week;//星期
@property (nonatomic,strong) NSString *weather;//天气
@property (nonatomic,strong) NSString *temp;//气温
@property (nonatomic,strong) NSString *temphigh;//最高气温
@property (nonatomic,strong) NSString *templow;//最低气温
@property (nonatomic,strong) NSString *img;//图片数字
@property (nonatomic,strong) NSString *humidity;//湿度
@property (nonatomic,strong) NSString *pressure;//气压
@property (nonatomic,strong) NSString *windspeed;//风速
@property (nonatomic,strong) NSString *winddirect;//风向
@property (nonatomic,strong) NSString *windpower;//风级
@property (nonatomic,strong) NSString *updatetime;//更新时间
@property (nonatomic,strong) NSArray<JSIndexModel*> *index; //生活指数
@property (nonatomic,strong) JSAqiModel *aqi;//空气质量
@property (nonatomic,strong) NSArray<JSDailyModel*> *daily; //日预报
@property (nonatomic,strong) NSArray<JSHourlyModel*> *hourly; //24小时日报
@end
