//
//  ThirdViewController.m
//  CoreAnimation
//
//  Created by  Jacky on 18/2/7.
//  Copyright © 2018年 Song Guoxiang. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (nonatomic, strong) UIImageView *jkView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI {

    _jkView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80, 160, 160)];
    _jkView.image = [UIImage imageNamed:@"jc"];
    [self.view addSubview:_jkView];
    
    NSArray *titleArr = @[@"缩放",@"X缩放",@"Y缩放"];
    for (NSInteger i =0; i < titleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(kScreenWidth-100)/4*(i%4)+20*(i%4), kScreenHeight-150 +60*(i/4), (kScreenWidth-100)/4, 40);
        btn.layer.cornerRadius = 5;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.backgroundColor = [UIColor lightGrayColor];
        btn.tag = i;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)btnAction:(UIButton *)btn {

    switch (btn.tag) {
        case 0:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            anima.toValue = [NSNumber numberWithFloat:2.0f];
            anima.duration = 1.0f;
            [_jkView.layer addAnimation:anima forKey:@"scaleAnimation"];
            
        }
            break;
        case 1:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
            anima.toValue = [NSNumber numberWithFloat:2.0f];
            anima.duration = 1.0f;
            [_jkView.layer addAnimation:anima forKey:@"scaleAnimationX"];
        }
            break;
        case 2:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
            anima.toValue = [NSNumber numberWithFloat:2.0f];
            anima.duration = 1.0f;
            [_jkView.layer addAnimation:anima forKey:@"scaleAnimationY"];
        }
        default:
            break;
    }
}

@end
