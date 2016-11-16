//
//  ViewController.m
//  JWD-SudokuViewMove
//
//  Created by 蒋伟东 on 2016/11/16.
//  Copyright © 2016年 YIXIA. All rights reserved.
//

#import "ViewController.h"
#import "JWDSudoKuView.h"

#define KScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight   [[UIScreen mainScreen] bounds].size.height


@interface ViewController ()

@property(nonatomic, strong)NSMutableArray *itemTagArray;//!< 单个View 的tag
@property(nonatomic, strong)NSMutableArray *itemTitleArray;//!<

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUp];

}

- (void)setUp{
    
    self.itemTitleArray = [NSMutableArray arrayWithObjects:
                           @{@"title": @"生活缴费",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"淘票票",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"股票",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"滴滴出行",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"红包",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"亲密付",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"生超市惠",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"我的快递",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"游戏中心",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"我的客服",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"爱心捐赠",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"亲情账户",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"淘宝",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"天猫",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"天猫超市",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"城市服务",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"保险服务",@"imageName": @"YXLiveChatMoreGift"},
                           @{@"title": @"飞机票",@"imageName": @"YXLiveChatMoreGift"},
                           nil];
    self.itemTagArray = [NSMutableArray arrayWithObjects:@"100", @"101", @"102", @"103", @"104", @"105", @"106", @"107", @"108", @"109", @"110", @"111", @"112", @"113", @"114", @"115", @"116", @"117", nil];
    
    JWDSudoKuView *scrollView = [[JWDSudoKuView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) withItemTitleArray:self.itemTitleArray withItemTagArray:self.itemTagArray isAnimation:YES];
    [self.view addSubview:scrollView];
}

@end






































