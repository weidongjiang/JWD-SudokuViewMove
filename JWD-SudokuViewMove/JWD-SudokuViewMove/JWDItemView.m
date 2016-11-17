//
//  JWDItemView.m
//  JWD-SudokuViewMove
//
//  Created by 蒋伟东 on 2016/11/16.
//  Copyright © 2016年 YIXIA. All rights reserved.
//

#import "JWDItemView.h"

@interface JWDItemView ()


@property (nonatomic, strong)UILabel       *label;//!< <#value#>
@property (nonatomic, strong)UIImageView   *imageView;//!< <#value#>
@property (nonatomic, assign) BOOL         isAnimation;//!< <#value#>

@end

@implementation JWDItemView

- (id)initWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName isAnimation:(BOOL)isAnimation{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.title = title;
        self.imageName = imageName;
        self.isAnimation = isAnimation;
        [self setupView];
    }
    return self;
}

- (void)setupView {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-50, self.frame.size.width, 50)];
    self.label = label;
    label.text = _title;
    label.userInteractionEnabled = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor grayColor];
    [self addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50*0.5, 0, self.frame.size.width-50, self.frame.size.height-50)];
    self.imageView = imageView;
    imageView.image = [UIImage imageNamed:self.imageName];
    [self addSubview:imageView];
    
    
    //长按手势
    if (self.isAnimation) {
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(viewLongPressGesture:)];
        [self addGestureRecognizer:longGesture];
    }
    
    //轻拍手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewtapGesture:)];
    [self addGestureRecognizer:tapGesture];
}

- (void)viewLongPressGesture:(UILongPressGestureRecognizer *)gesture {

    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
                    
            if (self.delegate && [self.delegate respondsToSelector:@selector(beginMoveAction:gesture:)]) {
                [self.delegate beginMoveAction:self.tagid gesture:gesture];
            }
            break;
            
        case UIGestureRecognizerStateChanged:
            if ([self.delegate respondsToSelector:@selector(moveViewAction:gesture:)]) {
                
                [self.delegate moveViewAction:self.tagid gesture:gesture];
            }
            break;
            
        case UIGestureRecognizerStateEnded:
            if ([self.delegate respondsToSelector:@selector(endMoveViewAction:gesture:)]) {
                _label.textColor = [UIColor grayColor];
                [self.delegate endMoveViewAction:self.tagid gesture:gesture];
            }
            break;
            
        default:
            break;
    }
}

- (void)viewtapGesture:(UITapGestureRecognizer *)gesture{
    NSLog(@"点击了");

    if (self.delegate && [self.delegate respondsToSelector:@selector(didItemViewAction:)]) {
        [self.delegate didItemViewAction:self.tagid];
    }
    
}

@end









