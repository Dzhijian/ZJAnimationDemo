//
//  ZJPositionViewController.m
//  AnimationDemo
//
//  Created by 邓志坚 on 2017/7/15.
//  Copyright © 2017年 dzj. All rights reserved.
//

#import "ZJPositionViewController.h"

@interface ZJPositionViewController ()<CAAnimationDelegate>

@property(nonatomic, strong) UIImageView *imageView;
@end

@implementation ZJPositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"Position";
    [self setUpAllView];
    
}

-(void)setUpAllView{
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - 50, 160, ViewWH, ViewWH)];
    [self.view addSubview:_imageView];
    _imageView.image = [UIImage imageNamed:@"123"];
    
    NSArray *titleArr = [NSArray arrayWithObjects:@"上移",@"下移",@"左移",@"右移",@"帧动画",@"Path动画", nil];
    for (NSInteger i = 0 ; i < titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(ScreenWidth-100)/4*(i%4)+20*(i%4), ScreenHeight - 240 +60*(i/4), (ScreenWidth-100)/4, 40);
        btn.layer.cornerRadius = 6;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.backgroundColor = [UIColor orangeColor];
        btn.tag = i;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }

}

-(void)btnAction:(UIButton *)sender{
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
    //anima.fillMode = kCAFillModeForwards;
    //anima.removedOnCompletion = NO;

    switch (sender.tag) {
        case 0:
        {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
            animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, 210)];
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2 , 60)];
            animation.duration = 1.0f;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_imageView.layer addAnimation:animation forKey:@"positionAnimation"];

        }
            break;
        case 1:
        {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
            animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, 210)];
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2 , 350)];
            animation.duration = 1.0f;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_imageView.layer addAnimation:animation forKey:@"positionAnimation"];
        }
            break;
        case 2:
        {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
            animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, 210)];
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2 - 120 , 210)];
            animation.duration = 1.0f;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_imageView.layer addAnimation:animation forKey:@"positionAnimation"];
        }
            break;
        case 3:
        {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
            animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, 210)];
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2 + 120 , 210)];
            animation.duration = 1.0f;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_imageView.layer addAnimation:animation forKey:@"positionAnimation"];
        }
            break;
        case 4:
        {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(50, 70)];
            NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth - ViewWH/2, 80)];
            NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(50, 260)];
            NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth - ViewWH, 360)];
            animation.values = [NSArray arrayWithObjects:value0,value1,value2,value3, nil];
            animation.duration = 3.0f;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            animation.delegate =  self; //设置代理，可以检测动画的开始和结束
            [_imageView.layer addAnimation:animation forKey:@"keyFrameAnimation"];

        }
            break;
        case 5:
        {
            
            CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(ScreenWidth/2-50, ScreenHeight/2-50-64, 150, 150)];
            anima.path = path.CGPath;
            anima.duration = 2.0f;
            [_imageView.layer addAnimation:anima forKey:@"pathAnimation"];
            
        }
            break;
            
        default:
            break;
    }

}


#pragma mark - CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim{

    NSLog(@"动画开始--->%s",__func__);
    
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"动画end--->%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
