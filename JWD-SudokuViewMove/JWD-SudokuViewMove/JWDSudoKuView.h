//
//  JWDSudoKuView.h
//  JWD-SudokuViewMove
//
//  Created by 蒋伟东 on 2016/11/16.
//  Copyright © 2016年 YIXIA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWDSudoKuView : UIScrollView
- (id)initWithFrame:(CGRect)frame withItemTitleArray:(NSMutableArray *)itemTitleArray withItemTagArray:(NSMutableArray *)itemTagArray isAnimation:(BOOL)isAnimation;
@end
