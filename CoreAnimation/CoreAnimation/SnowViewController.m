//
//  SnowViewController.m
//  CoreAnimation
//
//  Created by  Jacky on 18/2/8.
//  Copyright © 2018年 Song Guoxiang. All rights reserved.
//

#import "SnowViewController.h"

@interface SnowViewController ()

@property (nonatomic, strong) CAEmitterLayer *snowlayer;

@end

@implementation SnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupEmitter];
    // Do any additional setup after loading the view.
}

- (void)setupEmitter {

    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    //    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"tree.jpg"];
    
    // 1. 设置CAEmitterLayer
    CAEmitterLayer * snowLayer = [CAEmitterLayer layer];
    [imageView.layer addSublayer:snowLayer];
    self.snowlayer = snowLayer;
    
    snowLayer.emitterShape = kCAEmitterLayerLine;
    snowLayer.emitterMode = kCAEmitterLayerSurface;
    snowLayer.emitterSize = self.view.frame.size;
    snowLayer.emitterPosition = CGPointMake(self.view.bounds.size.width * 0.5, -10); // y最好不要设置为0 最好<0
    
    // 2. 配置cell
    CAEmitterCell * snowCell = [CAEmitterCell emitterCell];
    snowCell.contents = (id)[[UIImage imageNamed:@"snow_white-1"] CGImage];
    
    snowCell.birthRate = 1.f;
    snowCell.lifetime = 200.f;
    snowCell.speed = 10.f;
    
    snowCell.velocity = 2.f;
    snowCell.velocityRange = 10.f;
    snowCell.yAcceleration = 10.f;
    
    snowCell.scale = 0.2;
    snowCell.scaleRange = 0.3f;
    
    snowCell.emissionLongitude = M_PI_2; // 向下
    snowCell.emissionRange = M_PI_4; // 向下
    
    // 3.添加到图层上
    snowLayer.emitterCells = @[snowCell];

}

@end
