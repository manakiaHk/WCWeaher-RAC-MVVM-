//
//  WHomeViewController.m
//  caixun
//
//  Created by zhao weicheng on 2017/9/19.
//  Copyright © 2017年 zhao weicheng. All rights reserved.
//

#import "WHomeViewController.h"
#import "WHeaderView.h"
#import "WTodayWeatherHeader.h"
#import "JSWeatherModel.h"
#import "WHourlyPreCell.h"
#import "WDailyPreCell.h"
#import "WDailyIndexCell.h"
#import "HomeViewModel.h"
static NSString * WHourlyPreCellID = @"WHourlyPreCell";
static NSString * WDailyPreCellID = @"WDailyPreCell";
static NSString * WDailyIndexCellID = @"WDailyIndexCell";

@interface WHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) JSWeatherModel *weatherModel;
@property (nonatomic,strong) WHeaderView *header;
@property (weak, nonatomic) IBOutlet UIImageView *bgimg;
@property (nonatomic,strong) WTodayWeatherHeader *todayWeatherHeader;
@property (nonatomic,strong) HomeViewModel *viewModel;

@end

@implementation WHomeViewController

- (HomeViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HomeViewModel alloc]init];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModelCallback];

    [self initUI];
    
    [self setMjRefreash];
    
    [self.tableView.mj_header beginRefreshing];
}
- (void)bindViewModelCallback {
    
    @weakify(self);
    self.viewModel.successCallBack = ^(JSWeatherModel *retObj) {
        @strongify(self);
        [self.tableView.mj_header endRefreshing];
        self.weatherModel = retObj;
        self.header.weatherModel = retObj;
        self.todayWeatherHeader.weatherModel = retObj;
        [self.tableView reloadData];
    };
    self.viewModel.errorCallBack = ^(NSError *error) {
        @strongify(self);
        [self.tableView.mj_header endRefreshing];
        ///..code
    };
}

- (void)setMjRefreash {
    @weakify(self);
    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self.viewModel.loadWeatherDataCommand execute:nil];
    }];
}

- (void)initUI {
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.tableView registerNib:[UINib nibWithNibName:WHourlyPreCellID bundle:nil] forCellReuseIdentifier:WHourlyPreCellID];
    [self.tableView registerNib:[UINib nibWithNibName:WDailyPreCellID bundle:nil] forCellReuseIdentifier:WDailyPreCellID];
    [self.tableView registerNib:[UINib nibWithNibName:WDailyIndexCellID bundle:nil] forCellReuseIdentifier:WDailyIndexCellID];
    
    self.tableView.separatorStyle = 0;
    WHeaderView *header = [WHeaderView loadNibViewFrame:CGRectMake(0, 0, Screen.width, self.view.frame.size.height)];
    self.header = header;
    header.weatherModel = self.weatherModel;
    self.tableView.tableHeaderView =header;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section==0) {
        return 3;
    }else {
        return 0;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section==0) {
        WTodayWeatherHeader *header = [WTodayWeatherHeader loadNibViewFrame:CGRectMake(0, 0, Screen.width, 69)];
        _todayWeatherHeader = header;
        header.weatherModel = self.weatherModel;
        return header;
    }
    else {
        return nil;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section==0) {
         return 69;
    }else {
        return 0.001;
    }
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
             return 150;
        }else if (indexPath.row==1){
             return 300;
        }else if(indexPath.row==2) {
            NSInteger cols = 2;
            CGFloat itemM = 5;
            CGFloat itemH = 150;
            NSInteger rows = self.weatherModel.index.count%cols==0?self.weatherModel.index.count/cols:self.weatherModel.index.count/cols+1;
            return (itemH+itemM) *rows +itemM +54;
        }
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
            WHourlyPreCell *cell = [tableView dequeueReusableCellWithIdentifier:WHourlyPreCellID];
            cell.model = self.weatherModel;
            return cell;
            
        }else if(indexPath.row==1){
            
            WDailyPreCell *cell = [tableView dequeueReusableCellWithIdentifier:WDailyPreCellID];
            cell.model = self.weatherModel;
            return cell;
        }else if (indexPath.row==2){
            
            WDailyIndexCell *cell = [tableView dequeueReusableCellWithIdentifier:WDailyIndexCellID];
            cell.model = self.weatherModel;

            return cell;
        }
        
    }
    return [UITableViewCell new];

}

@end
