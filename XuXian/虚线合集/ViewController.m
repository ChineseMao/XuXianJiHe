//
//  ViewController.m
//  虚线合集
//
//  Created by 毛韶谦 on 2018/7/31.
//  Copyright © 2018年 毛韶谦. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self imaginaryLine];
    [self bianYuanLine];
}


//虚线
- (void)imaginaryLine {
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 1)];
    [self.view addSubview:line];
    //绘制虚线
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:line.bounds];
    [shapeLayer setPosition:CGPointMake(line.frame.size.width / 2.0,line.frame.size.height)];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //设置虚线颜色
    [shapeLayer setStrokeColor:[UIColor blackColor].CGColor];
    //设置虚线宽度
    [shapeLayer setLineWidth:0.5];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //设置虚线的线宽及间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:5], [NSNumber numberWithInt:2], nil]];
    //创建虚线绘制路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置虚线绘制路径起点
    CGPathMoveToPoint(path, NULL, 0, 0);
    //设置虚线绘制路径终点
    CGPathAddLineToPoint(path, NULL, line.frame.size.width, 0);
    //设置虚线绘制路径
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //添加虚线
    [line.layer addSublayer:shapeLayer];
}

//添加线框
- (void)bianYuanLine {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 130, self.view.frame.size.width - 40, 30)];
    [self.view addSubview:imageView];
    //给控件边缘加虚线
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = [UIColor redColor].CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRect:imageView.bounds].CGPath;
    border.frame = imageView.bounds;
    border.lineWidth = .5f;
    border.lineCap = @"square";
    border.lineDashPattern = @[@4, @2];
    [imageView.layer addSublayer:border];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
