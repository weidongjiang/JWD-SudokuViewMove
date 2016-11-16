//
//  JWDItemView.h
//  JWD-SudokuViewMove
//
//  Created by 蒋伟东 on 2016/11/16.
//  Copyright © 2016年 YIXIA. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol JWDItemViewDelegate <NSObject>

- (void)beginMoveAction:(NSString *)tag gesture:(UILongPressGestureRecognizer *)gesture;//移动前
- (void)moveViewAction:(NSString *)tag gesture:(UILongPressGestureRecognizer *)gesture;//移动中
- (void)endMoveViewAction:(NSString *)tag gesture:(UILongPressGestureRecognizer *)gesture;//结束移动

- (void)didItemViewAction:(NSString *)tag ;


@end


@interface JWDItemView : UIView

@property (nonatomic, assign) CGPoint     viewPoint;
@property (nonatomic, strong) NSString    *tagid;
@property (nonatomic, strong) NSString    *title;//!< 标题
@property (nonatomic, strong) NSString    *imageName;//!< 图片

@property (nonatomic, assign) id<JWDItemViewDelegate>delegate;//!< <#value#>


- (id)initWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName;


@end
