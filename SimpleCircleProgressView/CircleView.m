//
//  CircleView.m
//  CircleProgressview
//
//  Created by Jason on 16/11/10.
//  Copyright © 2016年 com.JaosnQJl. All rights reserved.
//

#import "CircleView.h"
@implementation CircleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect {
    [self drawCircleProgress];
}
- (UILabel *)label
{
    if (_label == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,self.bounds.size.width,20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        label.font = [UIFont systemFontOfSize:11];
        [self addSubview:label];
        _label = label;
    }
    return _label;
}

- (void)drawCircleProgress
{
    CGPoint center = CGPointMake(15, 15);
    CGFloat radius = 15;//环形进度条的半径
    CGFloat startA = -M_PI_2;//进度条起点
    CGFloat endA = -M_PI_2 + M_PI * 2 * _progress;//设置终点位置
    
    //获取环形路径(画一个圆形，填充色为透明色，设置线框宽度为5，这样就获得了一个环形)
    _progressLayer = [CAShapeLayer layer];//创建一个track shape layer
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [[UIColor clearColor] CGColor];//填充色为无色
    _progressLayer.strokeColor = [[UIColor redColor] CGColor];//指定path的渲染颜色，这里可以设置任意不透明颜色
    _progressLayer.opacity = 1.0f;//背景色的透明度
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = 4;
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    _progressLayer.path = [path CGPath];//把path传递给layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
    [self.layer addSublayer:_progressLayer];
    
    
//    //生成渐变色
//    CALayer *gradientLayer = [CALayer layer];
//    
//    //左侧渐变色
//    CAGradientLayer *leftLayer = [CAGradientLayer layer];
//    leftLayer.frame = CGRectMake(0, 0, self.bounds.size.width / 2, self.bounds.size.height);    // 分段设置渐变色
//    leftLayer.locations = @[@0.3, @0.9, @1];
//    leftLayer.colors = @[(id)[UIColor yellowColor].CGColor, (id)[UIColor greenColor].CGColor];
//    [gradientLayer addSublayer:leftLayer];
//    
//    //右侧渐变色
//    CAGradientLayer *rightLayer = [CAGradientLayer layer];
//    rightLayer.frame = CGRectMake(self.bounds.size.width / 2, 0, self.bounds.size.width / 2, self.bounds.size.height);
//    rightLayer.locations = @[@0.3, @0.9, @1];
//    rightLayer.colors = @[(id)[UIColor yellowColor].CGColor, (id)[UIColor redColor].CGColor];
//    [gradientLayer addSublayer:rightLayer];
//    
//    [gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
//    [self.layer addSublayer:gradientLayer];
    
}
- (void)drawProgress:(CGFloat )progress
{
    _progress = progress;
    _progressLayer.opacity = 0;
    [self setNeedsDisplay];
}
@end
