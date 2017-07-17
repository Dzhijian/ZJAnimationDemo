//
//  ZJPositionViewController.m
//  AnimationDemo
//
//  Created by 邓志坚 on 2017/7/15.
//  Copyright © 2017年 dzj. All rights reserved.
//

#import "ZJPositionViewController.h"

@interface ZJPositionViewController ()
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
//            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
//            animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth /2 -50 , 80)];
            [ZJCoreAnimationEffect showAnimationType:@"cube" withSubType:kCATransitionFromTop duration:2.0 timingFunction:kCAMediaTimingFunctionLinear view:self.imageView];
        }
            break;
        case 1:
        {
            [ZJCoreAnimationEffect animationFlipFromTop:_imageView];
        }
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
            
        default:
            break;
    }

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
