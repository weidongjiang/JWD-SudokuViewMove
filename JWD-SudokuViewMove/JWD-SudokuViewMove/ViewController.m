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
@property(nonatomic, assign)CGPoint        itempoint;//!< <#value#>
@property(nonatomic, assign)JWDItemView    *itemView;//!< <#value#>

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
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
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

- (void)didItemViewAction:(NSString *)tag {
    NSLog(@"只是点击了");

}

- (void)beginMoveAction:(NSString *)tag gesture:(UILongPressGestureRecognizer *)gesture{
    
    CGPoint beginPoint = [gesture locationInView:self.scrollView];
    
    
    JWDItemView *itemView;
    for (int i = 0; i<self.itemViewArray.count; i++) {
        itemView = self.itemViewArray[i];
        if (tag == itemView.tagid) {
            break;
        }
    }
    [self.scrollView bringSubviewToFront:itemView];
    self.itempoint = itemView.viewPoint;
    itemView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    
    self.itemView = itemView;
    
    
}
- (void)moveViewAction:(NSString *)tag gesture:(UILongPressGestureRecognizer *)gesture {
    
    // 1 获取一定前的 View tagid
    NSInteger fromtagid = [self.itemView.tagid integerValue];
    NSLog(@"fromtagid --- %ld",(long)fromtagid);
    // 2 计算坐标转换
    // 2.1 实时获取 View 在superview 中的新坐标
    CGPoint newPoint = [gesture locationInView:self.scrollView];
    
    NSLog(@"移动 实时获取 View 在superview 中的新坐标 ---X %f  y %f",newPoint.x,newPoint.y);
    NSLog(@"移动 实时获取 self.itemView   中的新坐标 ---X %f  y %f",self.itemView.frame.origin.x,self.itemView.frame.origin.y);
    
    // newPoint.x - self.itemView.frame.origin.x 相减后正好满足 手机屏幕坐标系的 移动方向 但是这是 x 的移动 要转换成 center.x的移动，才能符合过半就移动
    //移动后的X坐标
    CGFloat moveX = newPoint.x - self.itemView.frame.origin.x;
    //移动后的Y坐标
    CGFloat moveY = newPoint.y - self.itemView.frame.origin.y;
    
    NSLog(@"移动后的坐标 -- moveX %f moveY %f",moveX,moveY);

    // View 随手移动的 center.x
    self.itemView.center = CGPointMake(self.itemView.center.x + moveX-kMarginWidth/2, self.itemView.center.y + moveY-kMarginWidth/2);
    
    // 2.2 获取目标位置
    /**
     
     知道View 要取得 center.x 那么接下来就是 如何获取 目标View 的 tagid
     有两中情况，1 center.x 还在移动的 首次View中 不做移动排列  2 center.x 超出首次移动的 View中 这时候才去计算 需要达到的目标 tagid
     判断给定的点是否被一个CGRect包含,可以用CGRectContainsPoint函数
     
     */
    NSInteger totagid = [self moveViewOfCenterPoint:self.itemView.center selectItemView:self.itemView itemViewArray:self.itemViewArray];
    
    NSLog(@"totagid --- %ld",(long)totagid);
    
    
    // 上面已经知道了  fromtagid 和 totagid
    // 3 更改 View在数组中的位置
    
    // 4 所选中的View有两种情况，在移动过程中向前移动 和 向后移动
    // 4.1 向前移动
    if (totagid<fromtagid-100 && totagid>=0) {
        
        JWDItemView *toView = self.itemViewArray[totagid];
        self.itemView.center = toView.center;
        NSInteger beginIndex = fromtagid-100;
        // 记住 self.itemView.center 动画移动完毕后 需要修改数据源
        self.itempoint = toView.viewPoint;
        
        // 遍历执行动画
        for (NSInteger i=beginIndex; i>totagid; i--) {
            
            JWDItemView *itemView1 = self.itemViewArray[i];
            JWDItemView *itemView2 = self.itemViewArray[i-1];
            
            NSLog(@" //////// itemView 1 center x%f y%f  itemView 1 center x%f y%f ",itemView1.center.x,itemView1.center.y,itemView2.center.x,itemView2.center.y);
            
            [UIView animateWithDuration:1 animations:^{
                
                itemView2.center = itemView1.viewPoint;
                NSLog(@" >>>>>>> itemView 1 center x%f y%f  itemView 1 center x%f y%f ",itemView1.center.x,itemView1.center.y,itemView2.center.x,itemView2.center.y);

            }];
        }
        
        // 动画完毕后 修改 移动 View 在数组的 索引
        [self.itemViewArray removeObject:self.itemView];
        [self.itemViewArray insertObject:self.itemView atIndex:totagid];
        
        [self updteAllItemView];

        
    }
    
    
    // 4.2 向后移动
    if (totagid>fromtagid-100 && totagid<self.itemTagArray.count) {
        
        JWDItemView *toView = self.itemViewArray[totagid];
        self.itemView.center = toView.center;
         NSInteger beginIndex = fromtagid-100;
        // 记住 self.itemView.center 动画移动完毕后 需要修改数据源
        self.itempoint = toView.viewPoint;
        
        // 遍历执行动画
        for (NSInteger i=beginIndex; i<totagid; i++) {
            JWDItemView *itemView1 = self.itemViewArray[i];
            JWDItemView *itemView2 = self.itemViewArray[i+1];
            [UIView animateWithDuration:1 animations:^{
                
                itemView2.center = itemView1.viewPoint;
            }];
        }
        
        // 动画完毕后 修改 移动 View 在数组的 索引
        [self.itemViewArray removeObject:self.itemView];
        [self.itemViewArray insertObject:self.itemView atIndex:totagid];
        
        [self updteAllItemView];
        
    }
    
    
    
    

}
- (void)endMoveViewAction:(NSString *)tag gesture:(UILongPressGestureRecognizer *)gesture{
    CGPoint endPoint = [gesture locationInView:self.scrollView];
    
    NSLog(@"结束  移动 实时获取 View 在superview 中的新坐标 ---X %f  y %f",endPoint.x,endPoint.y);

    // 移动结束 收回放大的 View
    self.itemView.center = self.itempoint;
    self.itemView.transform = CGAffineTransformIdentity;

}
// 获取目标位置
/**
 
 知道View 要取得 center.x 那么接下来就是 如何获取 目标View 的 tagid
 有两中情况，1 center.x 还在移动的 首次View中 不做移动排列  2 center.x 超出首次移动的 View中 这时候才去计算 需要达到的目标 tagid
 判断给定的点是否被一个CGRect包含,可以用CGRectContainsPoint函数
 
 */
- (NSInteger)moveViewOfCenterPoint:(CGPoint)point selectItemView:(UIView *)selectItemView  itemViewArray:(NSMutableArray *)itemViewArray {

    for (NSInteger i = 0 ; i<itemViewArray.count; i++) {
        UIView *view = itemViewArray[i];
        if (selectItemView != view) {
            if (CGRectContainsPoint(view.frame, point)) {
                return i;
            }
        }
    }
    return -100;
}

-(void)updteAllItemView {

    // 修改 选中 View 的 tagid
    for (NSInteger i=0; i<self.itemViewArray.count; i++) {
        JWDItemView *itemView = self.itemViewArray[i];
        itemView.tagid = self.itemTagArray[i];
        itemView.viewPoint = itemView.center;
    }
}


@end






































