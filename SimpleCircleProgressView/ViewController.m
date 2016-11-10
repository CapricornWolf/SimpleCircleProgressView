//
//  ViewController.m
//  CircleProgressview
//
//  Created by Jason on 16/11/10.
//  Copyright © 2016年 com.JaosnQJl. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"
@interface ViewController ()
@property (nonatomic,strong)CircleView * circleview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.circleview = [[CircleView alloc]initWithFrame:CGRectMake(100, 100, 30, 30)];
    self.circleview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.circleview];
}
- (IBAction)scroll:(UISlider *)sender {
    self.circleview.label.text = [NSString stringWithFormat:@"%.0f",sender.value * 100];
    [self.circleview drawProgress:sender.value];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
