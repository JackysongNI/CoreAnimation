//
//  GroupViewController.m
//  CoreAnimation
//
//  Created by  Jacky on 18/2/8.
//  Copyright © 2018年 Song Guoxiang. All rights reserved.
//

#import "GroupViewController.h"

@interface GroupViewController ()

@property (nonatomic, strong) UIImageView *jkView;

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initUI];
    
}

- (void)initUI {

    _jkView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-50, kScreenHeight/2-50,100 ,100 )];
    _jkView.image = [UIImage imageNamed:@"jc"];
    [self.view addSubview:_jkView];
    
    
    
    
    NSArray *titleArr = @[@"同时",@"连续"];
    for (NSInteger i = 0 ; i < titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(kScreenWidth-100)/4*(i%4)+20*(i%4), kScreenHeight - 150 +60*(i/4), (kScreenWidth-100)/4, 40);
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
            //位移动画
            CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2-50)];
            NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/3, kScreenHeight/2-50)];
            NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/3, kScreenHeight/2+50)];
            NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth*2/3, kScreenHeight/2+50)];
            NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth*2/3, kScreenHeight/2-50)];
            NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth, kScreenHeight/2-50)];
            animation1.values  = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5,nil];
            
            //缩放动画
            CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            animation2.fromValue  = [NSNumber numberWithFloat:0.8f];
            animation2.toValue = [NSNumber numberWithFloat:2.0f];
            
            //跳转动画
            CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
            anima3.toValue = [NSNumber numberWithFloat:M_PI *4];
            
            //组动画
            CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
            groupAnimation.animations = [NSArray arrayWithObjects:animation1,animation2,anima3, nil];
            groupAnimation.duration = 4.0f;
            [_jkView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
            
            
        }
            break;
            
        default:
            break;
    }
}

/**
 *  顺序执行的组动画
 *
 */
- (void)groupAnimation2 {

    CFTimeInterval currentTime = CACurrentMediaTime();
    //位移动画
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/4, kScreenHeight/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/4, kScreenHeight/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2-50)];

    animation1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4, nil];
    animation1.beginTime = currentTime;
    animation1.duration = 2.0f;
    animation1.fillMode = kCAFillModeRemoved;
    animation1.removedOnCompletion = NO;
    [_jkView.layer addAnimation:animation1 forKey:@"sidchisuc"];
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    anima2.beginTime = currentTime+2.0f;
    anima2.duration = 1.0f;
    anima2.fillMode = kCAFillModeForwards;
    anima2.removedOnCompletion = NO;
    [_jkView.layer addAnimation:anima2 forKey:@"bb"];
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    anima3.beginTime = currentTime+3.0f;
    anima3.duration = 1.0f;
    anima3.fillMode = kCAFillModeForwards;
    anima3.removedOnCompletion = NO;
    [_jkView.layer addAnimation:anima3 forKey:@"cc"];
    
}


@end
