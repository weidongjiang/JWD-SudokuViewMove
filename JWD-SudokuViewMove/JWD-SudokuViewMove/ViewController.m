//
//  ViewController.m
//  JWD-SudokuViewMove
//
//  Created by 蒋伟东 on 2016/11/16.
//  Copyright © 2016年 YIXIA. All rights reserved.
//

#import "ViewController.h"
#import "JWDItemView.h"

#define KScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight   [[UIScreen mainScreen] bounds].size.height

#define KNum            3
#define kMarginWidth    (self.view.frame.size.width/KNum)

@interface ViewController ()<JWDItemViewDelegate>


@property(nonatomic, strong)NSMutableArray *itemTagArray;//!< 单个View 的tag
@property(nonatomic, strong)NSMutableArray *itemTitleArray;//!<
@property(nonatomic, strong)NSMutableArray *itemViewArray;//!< <#value#>
@property(nonatomic, strong)UIScrollView   *scrollView;//!< <#value#>
@property(nonatomic, assign)CGPoint        point;//!< <#value#>
@property(nonatomic, strong)JWDItemView    *itemView;//!< <#value#>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpData];
    
    [self setUpUI];


}

- (void)setUpData{
    

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

}

- (void)setUpUI {
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.900 alpha:1.0];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, KScreenWidth, KScreenHeight)];
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.scrollEnabled = YES;
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    
    self.itemViewArray = [NSMutableArray array];
    
    CGFloat widthx, heighty;
    widthx = 0;
    heighty = 10;
    for (int i = 0; i < self.itemTitleArray.count; i++) {
        
        NSString *title = self.itemTitleArray[i][@"title"];
        NSString *imageName =  self.itemTitleArray[i][@"imageName"];
        
        JWDItemView *itemView = [[JWDItemView alloc] initWithFrame:CGRectMake(widthx, heighty, kMarginWidth-1, kMarginWidth-1) title:title imageName:imageName];
        itemView.delegate = self;
        [self.scrollView addSubview:itemView];
        
        widthx = widthx + kMarginWidth;
        if (widthx == KScreenWidth) {
            widthx = 0;
            heighty+=kMarginWidth;
        }
        itemView.tagid = self.itemTagArray[i];
        itemView.viewPoint = itemView.center;
        
        [self.itemViewArray addObject:itemView];
        
    }
    self.scrollView.contentSize = CGSizeMake(KScreenWidth, heighty);

}
#pragma mark -
#pragma mark - JWDItemViewDelegate
- (void)beginMoveAction:(NSString *)tag {
    NSLog(@"开始 移动");
    JWDItemView *itemView;
    for (int i = 0; i<self.itemViewArray.count; i++) {
        itemView = self.itemViewArray[i];
        if (tag == itemView.tagid) {
            break;
        }
    }
    [self.scrollView bringSubviewToFront:itemView];
    self.point = itemView.viewPoint;
    itemView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    
    self.itemView = itemView;
    
    
}
- (void)moveViewAction:(NSString *)tag gesture:(UILongPressGestureRecognizer *)gesture {
    NSLog(@"移动 中");

}
- (void)endMoveViewAction:(NSString *)tag {
    NSLog(@"移动 结束");


}



@end






































