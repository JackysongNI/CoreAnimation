//
//  FireViewController.m
//  CoreAnimation
//
//  Created by  Jacky on 18/2/9.
//  Copyright © 2018年 Song Guoxiang. All rights reserved.
//

#import "FireViewController.h"

@interface FireViewController ()

@property (nonatomic, strong) CAEmitterLayer * fireLayer;
@property (nonatomic, strong) CAEmitterLayer * smokeLayer;


@end

@implementation FireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupEmitter];
}

- (void)setupEmitter{
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
    [self.view addSubview:label];
    label.textColor = [UIColor whiteColor];
    label.text = @"点击来控制火焰高度";
    label.textAlignment = NSTextAlignmentCenter;
    
    // 烟雾
    CAEmitterLayer * smokeLayer = [CAEmitterLayer layer];
    self.smokeLayer = smokeLayer;
    [self.view.layer addSublayer:smokeLayer];
    smokeLayer.renderMode = kCAEmitterLayerAdditive;
    smokeLayer.emitterMode = kCAEmitterLayerPoints;
    smokeLayer.emitterPosition = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height - 60); // 中间下部
    
    
    // 火花
    CAEmitterLayer * fireLayer = [CAEmitterLayer layer];
    self.fireLayer = fireLayer;
    [self.view.layer addSublayer:fireLayer];
    fireLayer.emitterSize = CGSizeMake(100.f, 0);
    fireLayer.emitterMode = kCAEmitterLayerOutline;
    fireLayer.emitterShape = kCAEmitterLayerLine;
    fireLayer.renderMode = kCAEmitterLayerAdditive;
    fireLayer.emitterPosition = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height - 60); // 中间下部
    
    // 配置 - 火花
    CAEmitterCell * fireCell = [CAEmitterCell emitterCell];
    fireCell.name = @"fireCell";
    
    fireCell.birthRate = 450.f;
    fireCell.scaleSpeed = 0.5;
    fireCell.lifetime = 0.9f;
    fireCell.lifetimeRange = 0.315;
    
    fireCell.velocity = -80.f;
    fireCell.velocityRange = 30;
    fireCell.yAcceleration = -200; // 向上
    
    fireCell.emissionLongitude = M_PI;
    fireCell.emissionRange = 1.1;
    
    fireCell.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
    fireCell.contents = (id)[[UIImage imageNamed:@"fire_white-1"] CGImage];
    
    // 配置 - 烟雾
    CAEmitterCell * smokeCell = [CAEmitterCell emitterCell];
    smokeCell.name = @"smokeCell";
    
    smokeCell.birthRate = 11.f;
    smokeCell.scale = 0.1;
    smokeCell.scaleSpeed = 0.7;
    smokeCell.lifetime = 3.6;
    
    smokeCell.velocity = -40.f;
    smokeCell.velocityRange = 20;
    smokeCell.yAcceleration = -160; // 向上
    
    smokeCell.emissionLongitude = -M_PI * 0.5;  // 向上
    smokeCell.emissionRange = M_PI * 0.25; // 围绕x轴上方向成90度
    
    smokeCell.spin = 1;
    smokeCell.spinRange = 6;
    
    smokeCell.alphaSpeed = -0.12;
    smokeCell.color = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.27] CGColor];
    smokeCell.contents = (id)[[UIImage imageNamed:@"smoke_white-1"] CGImage];
    
    // 添加动画
    self.smokeLayer.emitterCells = @[smokeCell];
    self.fireLayer.emitterCells = @[fireCell];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setFireAndSmokeHight:event];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setFireAndSmokeHight:event];
}

/**
 * 控制火花和烟雾的高度
 */
- (void)setFireAndSmokeHight:(UIEvent *)event{
    
    // 获取手指所在点
    UITouch * touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    
    // 计算比例
    CGFloat distanceToBottom = self.view.bounds.size.height - touchPoint.y;
    CGFloat per = distanceToBottom / self.view.bounds.size.height;
    
    // 设置数量
    [self setFireAndSmokeCount:2 * per];
}

/**
 * 设置火花的数量
 * ration: 比例系数 0 到 1之间
 */
- (void)setFireAndSmokeCount:(float)ratio{
    
    // 火花
    [self.fireLayer setValue:@(ratio * 500.0) forKeyPath:@"emitterCells.fireCell.birthRate"]; // 产生数量
    [self.fireLayer setValue:[NSNumber numberWithFloat:ratio] forKeyPath:@"emitterCells.fireCell.lifetime"]; // 生命周期
    [self.fireLayer setValue:@(ratio * 0.35) forKeyPath:@"emitterCells.fireCell.lifetimeRange"]; // 生命周期变化范围
    [self.fireLayer setValue:[NSValue valueWithCGPoint:CGPointMake(ratio * 50, 0)] forKeyPath:@"emitterSize"]; // 发射源大小
    // 烟雾
    [self.smokeLayer setValue:@(ratio * 4) forKeyPath:@"emitterCells.smokeCell.lifetime"]; // 生命周期
    [self.smokeLayer setValue:(id)[[UIColor colorWithRed:1 green:1 blue:1 alpha:ratio * 0.3] CGColor] forKeyPath:@"emitterCells.smokeCell.color"]; // 透明度
    
}

@end
