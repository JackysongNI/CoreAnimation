//
//  TransitionViewController.m
//  CoreAnimation
//
//  Created by  Jacky on 18/2/8.
//  Copyright © 2018年 Song Guoxiang. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()

@property (nonatomic, strong) UIImageView *jkView;

@property (nonatomic, strong) UILabel *indexLabel;

@property (nonatomic, assign) NSInteger index;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    [self changeView:YES];
}

- (void)initUI {

    _jkView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-100, kScreenHeight/2-150,200 ,200 )];
    _jkView.image = [UIImage imageNamed:@"img1"];
    [self.view addSubview:_jkView];
    
    _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_jkView.frame)/2-30, CGRectGetHeight(_jkView.frame)/2-20, 60, 40)];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.textColor = [UIColor cyanColor];
    _indexLabel.font = [UIFont systemFontOfSize:30];
    [_jkView addSubview:_indexLabel];
    
    
    NSArray *titleArr = [NSArray arrayWithObjects:@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"Curl",@"UnCurl",@"caOpen",@"caClose", nil];
    for (NSInteger i = 0 ; i < titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(kScreenWidth-100)/4*(i%4)+20*(i%4), kScreenHeight - 170 +60*(i/4), (kScreenWidth-100)/4, 40);
        btn.layer.cornerRadius = 5;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.backgroundColor = [UIColor lightGrayColor];
        btn.tag = i;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 3) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame), kScreenWidth, 20)];
            label.text = @"————以下是私有api,请勿在您将上架的APP内使用————";
            label.adjustsFontSizeToFitWidth = YES;
            label.textColor = [UIColor orangeColor];
            label.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview:label];
            
        }
    }
}

- (void)btnAction:(UIButton *)btn {
    
    switch (btn.tag) {
        case 0:
            [self fadeAnimation];
            break;
        case 1:
            [self moveInAnimation];
            break;
        case 2:
            [self pushAnimation];
            break;
        case 3:
            [self revealAnimation];
            break;
        case 4:
            [self cubeAnimation];
            break;
        case 5:
            [self suckEffectAnimation];
            break;
        case 6:
            [self oglFlipAnimation];
            break;
        case 7:
            [self rippleEffectAnimation];
            break;
        case 8:
            [self pageCurlAnimation];
            break;
        case 9:
            [self pageUnCurlAnimation];
            break;
        case 10:
            [self cameraIrisHollowOpenAnimation];
            break;
        case 11:
            [self cameraIrisHollowCloseAnimation];
            break;
        default:
            break;
    }
    
}

/**
 *  逐渐消失
 */
- (void)fadeAnimation {

    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionFade;//设置动画的类型
    anima.duration = 1.0f;
    [_jkView.layer addAnimation:anima forKey:@"fadeAnimation"];
}
/** 移动覆盖**/
- (void)moveInAnimation {

    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    
    anima.type = kCATransitionFade;//设置动画类型
    anima.subtype = kCATransitionFromRight;//设置动画方向
    anima.duration = 1.0f;
    [_jkView.layer addAnimation:anima forKey:@"moveInAnimation"];
}
/**前推动画**/
- (void)pushAnimation {

    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionPush;//设置动画的类型
    anima.subtype = kCATransitionFromRight;//摄制组动画的方向
    anima.duration = 1.0f;
    [_jkView.layer addAnimation:anima forKey:@"pushAnimation"];
    
}

- (void)revealAnimation {

    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionReveal;//设置动画的类型
    //设置动画的方向
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    [_jkView.layer addAnimation:anima forKey:@"revealAnimation"];
}

/**
 *  立体翻滚效果
 */
- (void)cubeAnimation {

    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cube";//设置动画的类型
    anima.subtype = kCATransitionFromRight;//动画的方向
    anima.duration = 1.0f;
    [_jkView.layer addAnimation:anima forKey:@"revealAnimation"];
}
/**允吸**/

- (void)suckEffectAnimation {

    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"suckEffect";//设置动画的类型
    anima.subtype = kCATransitionFromLeft;//设置动画的方向
    anima.duration = 1.0f;
    [_jkView .layer addAnimation:anima forKey:@"suckEffectAnimation"];
}

-(void)pageUnCurlAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"pageUnCurl";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_jkView.layer addAnimation:anima forKey:@"pageUnCurlAnimation"];
}

/** 平面翻转**/
- (void)oglFlipAnimation {

    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"oglFlip";//设置动画的类型
    anima.subtype = kCATransitionFromRight;//设置动画的方向
    anima.duration = 1.0f;
    [_jkView.layer addAnimation:anima forKey:@"oglFlipAnimation"];
}
/**水滴切换效果**/
- (void)rippleEffectAnimation {

    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"rippleEffect";//设置动画的类型
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    [_jkView.layer addAnimation:anima forKey:@"rippleEffectAnimation"];
}
/**翻页效果**/
- (void)pageCurlAnimation {

    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"pageCurl";//设置动画的类型
    anima.subtype = kCATransitionFromRight;//设置动画的方向
    anima.duration = 1.0f;
    [_jkView.layer addAnimation:anima forKey:@"pageCurlAnimation"];
}

- (void)cameraIrisHollowOpenAnimation {

    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cameralrisHollowOpen";//设置动画的类型
    anima.subtype = kCATransitionFromRight;//设置动画的方向
    anima.duration = 1.0f;
    [_jkView.layer addAnimation:anima forKey:@"cameralrisHollowOpenAnimation"];
}

- (void)cameraIrisHollowCloseAnimation {

    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cameralrisHollowClose";//设置动画的类型
    anima.subtype = kCATransitionFromRight;//设置动画的方向
    anima.duration = 1.0f;
    [_jkView.layer addAnimation:anima forKey:@"cameralrisHollowCloseAnimation"];
}

/**
 *  设置view的值
 *
 */
- (void)changeView:(BOOL)isUp{

    if (_index>1) {
        _index = 0;
    }
    if (_index<0) {
        _index =1;
    }
    NSArray *images = [NSArray arrayWithObjects:[UIImage imageNamed:@"jc"],[UIImage imageNamed:@"timg"], nil];
    
    NSArray *titles = [NSArray arrayWithObjects:@"1号",@"2号", nil];
    _jkView.image = [images objectAtIndex:_index];
    _indexLabel.text = [titles objectAtIndex:_index];
    if (isUp) {
        _index++;
    }else {
        _index--;
    }
}

@end
