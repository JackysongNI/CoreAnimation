//
//  TwoViewController.m
//  CoreAnimation
//
//  Created by  Jacky on 18/2/7.
//  Copyright © 2018年 Song Guoxiang. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@property (nonatomic, strong) UIImageView *jkView;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    
}

- (void)initUI {

    _jkView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80, 160, 160)];
    _jkView.image = [UIImage imageNamed:@"jc"];
    [self.view addSubview:_jkView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, kScreenHeight -100, kScreenWidth-200, 40);
    btn.layer.cornerRadius = 5;
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"改变透明度" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnAction:(UIButton *)btn {

    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1.0f];
    anima.toValue = [NSNumber numberWithFloat:0.2f];
    //如果fillMode＝kCAFillModeForwards和removeOnComletion = NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态，但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变
    anima.duration = 1.0f;
    [_jkView.layer addAnimation:anima forKey:@"opacityAnimation"];
    
}

@end
