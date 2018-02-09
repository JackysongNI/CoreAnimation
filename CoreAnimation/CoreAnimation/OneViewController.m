//
//  OneViewController.m
//  CoreAnimation
//
//  Created by  Jacky on 18/2/6.
//  Copyright © 2018年 Song Guoxiang. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIImageView *jkView;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
}

- (void)initUI {

    _jkView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80, 160, 160)];
    _jkView.image = [UIImage imageNamed:@"timg"];
    [self.view addSubview:_jkView];
    
    NSArray *arrTitle = @[@"上移动",@"下移动",@"左移动",@"右移",@"帧动画",@"Path动画"];
    
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
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
            anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_jkView.frame.size.width/2, kScreenHeight/2-80+_jkView.frame.size.height/2)];
            anima.toValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_jkView.frame.size.width/2, kScreenHeight/2-80+_jkView.frame.size.height/2-200)];
            anima.duration = 1.0f;
            anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_jkView.layer addAnimation:anima forKey:@"postionAnimation"];
        
        }
            break;
        case 1:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
            anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_jkView.frame.size.width/2, kScreenHeight/2-80+_jkView.frame.size.height/2)];
            anima.toValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_jkView.frame.size.width/2, kScreenHeight/2-80+_jkView.frame.size.height/2+200)];
            anima.duration = 1.0f;
            anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_jkView.layer addAnimation:anima forKey:@"positionAnimation"];
        }
            break;
        case 2:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
            anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_jkView.frame.size.width/2, kScreenHeight/2-80+_jkView.frame.size.height/2)];
            anima.toValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_jkView.frame.size.height/2-200, kScreenWidth/2+_jkView.frame.size.height/2-80)];
            anima.duration = 1.0f;
            anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_jkView.layer addAnimation:anima forKey:@"positionAnimation"];
        }
            break;
        case 3:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
            anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_jkView.frame.size.width/2, kScreenHeight/2-80+_jkView.frame.size.height/2)];
            anima.toValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_jkView.frame.size.width/2+200, kScreenHeight/2+_jkView.frame.size.height/2-80)];
            anima.duration = 1.0f;
            anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_jkView.layer addAnimation:anima forKey:@"positionAnimation"];
        }
            break;
        case 4:
        {
//            帧动画
            CAKeyframeAnimation  *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2-100)];
            NSValue  *value1 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth, kScreenHeight/2-100)];
            NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2+100)];
            NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth, kScreenHeight/2+100)];
            anima.values = [NSArray arrayWithObjects:value0,value1,value2, value3,nil];
            anima.duration = 2.0f;
            //设置动画的节奏
            anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            anima.delegate  = self;//设置代理，可以检测动画的开始和结束
            [_jkView.layer addAnimation:anima forKey:@"keyFrameAnimation"];
                                                                    
        }
            break;
        case 5:
        {
            CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(kScreenWidth/2-100, kScreenHeight/2-100, 200, 200)];
            anima.path = path.CGPath;
            anima.duration = 2.0f;
            [_jkView.layer addAnimation:anima forKey:@"pathAnimation"];
        }
            break;
        default:
            break;
    }
    
    
}

@end
