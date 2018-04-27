//
//  LaunchViewController.m
//  JitasheApp
//
//  Created by WeiChengZ on 16/12/4.
//  Copyright © 2016年 WeiChengZ. All rights reserved.
//cbapp51

#import "LaunchViewController.h"
#import "WHomeViewController.h"
@interface LaunchViewController ()
{
    NSInteger num;

}
@property (weak, nonatomic) IBOutlet UILabel *timeNum;
@property (nonatomic,strong) NSTimer  *timer;
@end

@implementation LaunchViewController

-(void)dealloc {
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.timeNum.layer.cornerRadius = 5;
    self.timeNum.layer.masksToBounds = YES;
    num = 3;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerChanged) userInfo:nil repeats:YES];
}

- (void)timerChanged{
    --num;
    self.timeNum.text = [NSString stringWithFormat:@"%ld s",num <0?0:num];
    if (num<0) {
        [self enterApp];
        [_timer  invalidate];
        _timer = nil;
    }
    
}
- (void)enterApp{
    WHomeViewController  *home = [[WHomeViewController alloc]init];
    home.modalTransitionStyle = UIModalPresentationNone;
    [self presentViewController:home animated:YES completion:nil];
    
}




@end
