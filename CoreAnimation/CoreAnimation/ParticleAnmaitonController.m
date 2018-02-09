//
//  ParticleAnmaitonController.m
//  CoreAnimation
//
//  Created by  Jacky on 18/2/8.
//  Copyright © 2018年 Song Guoxiang. All rights reserved.
//

#import "ParticleAnmaitonController.h"
#import "RainViewController.h"
#import "SnowViewController.h"
#import "ColorsViewController.h"
#import "HerartViewController.h"
#import "FireViewController.h"
#import "FireworksViewController.h"
#import "LikeViewController.h"


@interface ParticleAnmaitonController ()

@property (nonatomic, strong) CAEmitterLayer *redpacketLayer;

@end

@implementation ParticleAnmaitonController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self redpacketRain];
    [self CreateBtn];
}

- (void)CreateBtn {

    NSArray *arrTitle = @[@"下雨效果",@"下雪效果",@"五彩效果",@"爱心效果",@"火焰效果",@"烟花效果",@"QQ空间点赞按钮动画",@"红包雨"];
    
    for (NSInteger i =0; i < arrTitle.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(kScreenWidth -100)/4*(i%4)+20*(i%4), kScreenHeight - 150 +60*(i/4), (kScreenWidth -100)/4, 40);
        btn.layer.cornerRadius = 5;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.backgroundColor = [UIColor lightGrayColor];
        btn.tag =i;
        [btn setTitle:arrTitle[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }

}

- (void)btnAction:(UIButton *)btn {

        
        //如果fillMode＝kCAFillModeForwards和removeedOnComletion ＝ NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变
        switch (btn.tag) {
            case 0:
            {
                RainViewController * rainVC = [[RainViewController alloc]init];
                rainVC.title = @"下雨效果";
                [self.navigationController pushViewController:rainVC animated:YES];
                
            }
                break;
            case 1:
            {
                SnowViewController * snowVC = [[SnowViewController alloc]init];
                snowVC.title = @"下雪效果";
                [self.navigationController pushViewController:snowVC animated:YES];
            }
                break;
            case 2:
            {
                ColorsViewController *color = [[ColorsViewController alloc]init];
                color.title = @"五彩效果";
                [self.navigationController pushViewController:color animated:YES];
            }
                break;
            case 3:
            {
                HerartViewController *color = [[HerartViewController alloc]init];
                color.title = @"爱心效果";
                [self.navigationController pushViewController:color animated:YES];
            }
                break;
            case 4:
            {
                FireViewController * fireVC = [[FireViewController alloc]init];
                fireVC.title = @"火焰效果";
                [self.navigationController pushViewController:fireVC animated:YES];
                
            }
                break;
            case 5:
            {
                FireworksViewController * fireworkVC = [[FireworksViewController alloc]init];
                fireworkVC.title = @"烟花效果";
                [self.navigationController pushViewController:fireworkVC animated:YES];
            }
                break;
            case 6:
            {
                LikeViewController * likeVC = [[LikeViewController alloc]init];
                likeVC.title = @"QQ空间点赞按钮动画";
                [self.navigationController pushViewController:likeVC animated:YES];
            }
                break;
            case 7:
            {
                [self.redpacketLayer setValue:@1.f forKey:@"birthRate"];
                [self performSelector:@selector(endRedpacketAnimation) withObject:nil afterDelay:2.f];
            }
                break;
            default:
                break;
        }
    
}

- (void)endRedpacketAnimation {
    [self.redpacketLayer setValue:@0.f forKeyPath:@"birthRate"];
}

/**
 * 红包雨
 */
- (void)redpacketRain {

    // 1. 设置CAEmitterLayer
    CAEmitterLayer * redpacketLayer = [CAEmitterLayer layer];
    
    self.redpacketLayer = redpacketLayer;
    
    redpacketLayer.emitterShape = kCAEmitterLayerLine;  // 发射源的形状 是枚举类型
    redpacketLayer.emitterMode = kCAEmitterLayerSurface; // 发射模式 枚举类型
    redpacketLayer.emitterSize = self.view.frame.size; // 发射源的size 决定了发射源的大小
    redpacketLayer.emitterPosition = CGPointMake(self.view.bounds.size.width * 0.5, -10); // 发射源的位置
    redpacketLayer.birthRate = 0.f; // 每秒产生的粒子数量的系数
    
    // 2. 配置cell
    CAEmitterCell * snowCell = [CAEmitterCell emitterCell];
    snowCell.contents = (id)[[UIImage imageNamed:@"red_paceket-1"] CGImage];  // 粒子的内容 是CGImageRef类型的
    
    snowCell.birthRate = 1.0f;  // 每秒产生的粒子数量
    snowCell.lifetime = 20.f;  // 粒子的生命周期
    
    snowCell.velocity = 8.f;  // 粒子的速度
    snowCell.yAcceleration = 1000.f; // 粒子再y方向的加速的
    
    snowCell.scale = 0.5;  // 粒子的缩放比例
    
    redpacketLayer.emitterCells = @[snowCell];  // 粒子添加到CAEmitterLayer上
    [self.view.layer addSublayer:redpacketLayer];
}



@end
