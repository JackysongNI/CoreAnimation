//
//  SevenViewController.m
//  CoreAnimation
//
//  Created by  Jacky on 18/2/7.
//  Copyright © 2018年 Song Guoxiang. All rights reserved.
//

#import "SevenViewController.h"

//定义枚举类型
typedef NS_ENUM(NSInteger,CurrentImageType) {
    CurrentImageTypeEnumOne=0,//0
    CurrentImageTypeEnumTwo=1,//1
};


@interface SevenViewController ()

@property (nonatomic,strong) UIImageView *jkView;
//操作类型
@property (nonatomic,assign) CurrentImageType currentType;

@end

@implementation SevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _currentType = CurrentImageTypeEnumOne;
    
    _jkView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80, 160, 160)];
    _jkView.image = [UIImage imageNamed:@"timg"];
    [self.view addSubview:_jkView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, kScreenHeight - 100, kScreenWidth-100, 40);
    btn.layer.cornerRadius = 5;
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"切换图片" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnAction:(UIButton *)btn {
    
    if (_currentType == CurrentImageTypeEnumOne) {
        [self changeImageAnimatedWithView:_jkView AndImage:[UIImage imageNamed:@"jc"]];
        _currentType = CurrentImageTypeEnumTwo;
    }
    else {
        [self changeImageAnimatedWithView:_jkView AndImage:[UIImage imageNamed:@"img1"]];
        _currentType = CurrentImageTypeEnumOne;
        
    }
}
//动画切换图标
- (void)changeImageAnimatedWithView:(UIImageView *)imageV AndImage:(UIImage *)image {
 
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [imageV.layer addAnimation:transition forKey:@"a"];
    [imageV setImage:image];
    
}

@end
