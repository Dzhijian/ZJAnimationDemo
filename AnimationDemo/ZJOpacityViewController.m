
//
//  ZJOpacityViewController.m
//  AnimationDemo
//
//  Created by 邓志坚 on 2017/7/23.
//  Copyright © 2017年 dzj. All rights reserved.
//

#import "ZJOpacityViewController.h"

@interface ZJOpacityViewController ()

@property(nonatomic, strong) UIImageView *imageView;

@end

@implementation ZJOpacityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Opacity";
    [self setUpAllView];
}

-(void)setUpAllView{
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - 100, 110, ViewWH*2, ViewWH*2)];
    [self.view addSubview:_imageView];
    _imageView.image = [UIImage imageNamed:@"454"];

    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, ScreenHeight - 200, ScreenWidth-200, 40);
    btn.layer.cornerRadius = 5;
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"改变透明度" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)btnAction:(UIButton *)sender{
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1.0f];
    anima.toValue = [NSNumber numberWithFloat:0.2f];
    
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    anima.duration = 1.0f;
    [_imageView.layer addAnimation:anima forKey:@"opacityAniamtion"];

    
    
    
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
