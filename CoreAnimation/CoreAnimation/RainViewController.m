//
//  RainViewController.m
//  CoreAnimation
//
//  Created by  Jacky on 18/2/8.
//  Copyright © 2018年 Song Guoxiang. All rights reserved.
//

#import "RainViewController.h"

@interface RainViewController ()

@property (nonatomic, strong) CAEmitterLayer * rainLayer;
@property (nonatomic,weak) UIImageView *imageView;

@end

@implementation RainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    [self setupEmitter];
}

- (void)setupUI {

    //背影图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    self.imageView = imageView;
    imageView.image = [UIImage imageNamed:@"tree"];
    
    //下雨按钮
    UIButton * startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:startBtn];
    startBtn.frame = CGRectMake(20, self.view.bounds.size.height - 60, 80, 40);
    startBtn.backgroundColor = [UIColor whiteColor];
    [startBtn setTitle:@"雨停了" forState:UIControlStateNormal];
    [startBtn setTitle:@"下雨" forState:UIControlStateSelected];
    [startBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [startBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 雨量按钮
    UIButton * rainBIgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:rainBIgBtn];
    rainBIgBtn.tag = 100;
    rainBIgBtn.frame = CGRectMake(140, self.view.bounds.size.height - 60, 80, 40);
    rainBIgBtn.backgroundColor = [UIColor whiteColor];
    [rainBIgBtn setTitle:@"下大点" forState:UIControlStateNormal];
    [rainBIgBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [rainBIgBtn addTarget:self action:@selector(rainButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * rainSmallBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:rainSmallBtn];
    rainSmallBtn.tag = 200;
    rainSmallBtn.frame = CGRectMake(240, self.view.bounds.size.height - 60, 80, 40);
    rainSmallBtn.backgroundColor = [UIColor whiteColor];
    [rainSmallBtn setTitle:@"太大了" forState:UIControlStateNormal];
    [rainSmallBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [rainSmallBtn addTarget:self action:@selector(rainButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)sender {

    if (!sender.selected) {
        sender.selected = !sender.selected;
        NSLog(@"雨停了");
        //停止下雨
        [self.rainLayer setValue:@0.f forKey:@"birthRate"];
        
    } else {
    
        sender.selected = !sender.selected;
        NSLog(@"开始下雨了");
        // 开始下雨
        [self.rainLayer setValue:@1.f forKey:@"birthRate"];
    }
}

- (void)rainButtonClick:(UIButton *)sender {

    NSInteger rate = 1;
    CGFloat scale = 0.05;
    if (sender.tag == 100) {
        NSLog(@"下大了");
        if (self.rainLayer.birthRate < 30) {
            [self.rainLayer setValue:@(self.rainLayer.birthRate + rate) forKeyPath:@"birthRate"];
            [self.rainLayer setValue:@(self.rainLayer.scale + scale) forKeyPath:@"scale"];
        }
    } else if (sender.tag == 200) {
    
        NSLog(@"变小了");
        if (self.rainLayer.birthRate  > 1) {
            [self.rainLayer setValue:@(self.rainLayer.birthRate  - rate) forKeyPath:@"birthRate"];
            [self.rainLayer setValue:@(self.rainLayer.scale - scale) forKeyPath:@"scale"];
        }
    }
}

- (void)setupEmitter {

    //1.设置CAEmitterLayer
    CAEmitterLayer *rainLayer = [CAEmitterLayer layer];
    [self.imageView.layer addSublayer:rainLayer];
    self.rainLayer = rainLayer;
    
    rainLayer.emitterShape = kCAEmitterLayerLine;
    rainLayer.emitterMode = kCAEmitterLayerSurface;
    rainLayer.emitterSize = self.view.frame.size;
    rainLayer.emitterPosition = CGPointMake(self.view.bounds.size.width *0.5, -10);//Y最好不要设置为0，最好《 0
    
    //2.配置粒子
    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
    snowCell.contents = (id)[[UIImage imageNamed:@"rain_white-1.jpg"] CGImage];
    
    snowCell.birthRate = 25.f;
    snowCell.lifetime = 20.f;
    snowCell.speed = 10.f;
    
    snowCell.velocity = 10.f;
    snowCell.velocityRange = 10.f;
    snowCell.yAcceleration = 1000.f;
    
    snowCell.scale = 0.1;
    snowCell.scaleRange = 0.f;
    // 3.添加到图层上
    rainLayer.emitterCells = @[snowCell];
    
}



@end
