//
//  ZJScaleViewController.m
//  AnimationDemo
//
//  Created by 邓志坚 on 2017/7/23.
//  Copyright © 2017年 dzj. All rights reserved.
//

#import "ZJScaleViewController.h"

@interface ZJScaleViewController ()

@property(nonatomic, strong) UIImageView *imageView;

@end

@implementation ZJScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Opacity";
    [self setUpAllView];
}

-(void)setUpAllView{
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - 50, 160, ViewWH, ViewWH)];
    [self.view addSubview:_imageView];
    _imageView.image = [UIImage imageNamed:@"454"];
    
    
    NSArray *titleArr = @[@"缩放",@"X缩放",@"Y缩放"];
    for (NSInteger i = 0 ; i < titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(ScreenWidth-100)/4*(i%4)+20*(i%4), ScreenHeight - 150 +60*(i/4), (ScreenWidth-100)/4, 40);
        btn.layer.cornerRadius = 5;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.backgroundColor = [UIColor lightGrayColor];
        btn.tag = i;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

-(void)btnAction:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            anima.toValue = [NSNumber numberWithFloat:2.0f];
            anima.duration = 1.0f;
            [_imageView.layer addAnimation:anima forKey:@"scaleAnimation"];
        }
            break;
        case 1:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];//同上
            anima.toValue = [NSNumber numberWithFloat:2.0f];
            anima.duration = 1.0f;
            [_imageView.layer addAnimation:anima forKey:@"scaleAnimationX"];
        }
            break;
        case 2:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];//同上
            anima.toValue = [NSNumber numberWithFloat:2.0f];
            anima.duration = 1.0f;
            [_imageView.layer addAnimation:anima forKey:@"scaleAnimationY"];
        }
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
