//
//  CircleView.h
//  CircleProgressview
//
//  Created by Jason on 16/11/10.
//  Copyright © 2016年 com.JaosnQJl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
@property(nonatomic,assign)CGFloat progress;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
- (void)drawProgress:(CGFloat )progress;
@end
