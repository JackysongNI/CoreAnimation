//
//  FiveViewController.m
//  CoreAnimation
//
//  Created by  Jacky on 18/2/7.
//  Copyright © 2018年 Song Guoxiang. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()

@property (nonatomic,strong) UIImageView *jkView;

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI {

    _jkView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80, 160, 160)];
    _jkView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_jkView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, kScreenHeight -100, kScreenWidth-200, 40);
    btn.layer.cornerRadius = 5;
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"变换背景颜色" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnAction:(UIButton *)btn {

    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue = (id)[UIColor greenColor].CGColor;
    anima.duration = 2.0f;
    //如果fillMode＝kCAFillModeForward和removedOnComletion ＝ NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行的初始值，并没有真正被改变的
    [_jkView.layer addAnimation:anima forKey:@"backgroundAnimation"];
    
    
}


@end
