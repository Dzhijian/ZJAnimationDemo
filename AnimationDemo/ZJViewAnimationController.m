//
//  ZJPositionViewController.m
//  AnimationDemo
//
//  Created by 邓志坚 on 2017/7/14.
//  Copyright © 2017年 dzj. All rights reserved.
//

#import "ZJViewAnimationController.h"

@interface ZJViewAnimationController ()

@property(nonatomic, strong) UIImageView *imageView;
@end

@implementation ZJViewAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Position";
    
    [self setUpAllView];
    
}

/*
 1.CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty)（平移:设置平移量）
 
 2.CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)（缩放:设置缩放比例）仅通过设置缩放比例就可实现视图扑面而来和缩进频幕的效果。
 
 3.CGAffineTransformMakeRotation(CGFloat angle)（旋转:设置旋转角度)
 
 CGAffineTransformIdentity ： 单位矩阵变换，一般用于仿射变换的初始化或者还原。
 CGAffineTransformEqualToTransform(CGAffineTransform t1,
 CGAffineTransform t2) ： 判断两个变换矩阵是否相等
 
 CGAffineTransformConcat(CGAffineTransform t1,
 CGAffineTransform t2) ： 得到两个矩阵相加后得到的最终矩阵
 
 CGPoint CGPointApplyAffineTransform(CGPoint point,
 CGAffineTransform t) ： 某点通过矩阵变换之后的点
 
 CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform t) ： 某个size通过矩阵变换之后的size
 
 CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform t) ： 某个Rect通过矩阵变换之后的区域
 */

-(void)setUpAllView{
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - 50, 160, ViewWH, ViewWH)];
    [self.view addSubview:_imageView];
    _imageView.image = [UIImage imageNamed:@"745"];
    
    NSArray *titleArr = [NSArray arrayWithObjects:@"位移",@"缩放",@"旋转",@"组合",@"反转", nil];
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
    switch (sender.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self scaleAnimation];
            break;
        case 2:
            [self rotationAnimation];
            break;
        case 3:
            [self combinationAnimation];
            break;
        case 4:
            [self  invertAnimation];
            break;
            
        default:
            break;
    }
}
#pragma mark -  位移  右移150
-(void)positionAnimation{
    _imageView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _imageView.transform = CGAffineTransformMakeTranslation(100, 80);
    }];
}

#pragma mark -  缩放  放大两倍
-(void)scaleAnimation{
    _imageView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _imageView.transform = CGAffineTransformMakeScale(2, 2);
    }];
}

#pragma mark -  旋转  旋转180°
-(void)rotationAnimation{
    _imageView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }];
}

#pragma mark -  组合动画
-(void)combinationAnimation{
    _imageView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI);
        CGAffineTransform transform2 = CGAffineTransformScale(transform1, 0.5, 0.5);
        _imageView.transform = CGAffineTransformTranslate(transform2, -200, 0);
    }];
}

#pragma mark -  反转
-(void)invertAnimation{
    _imageView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        //反转
        _imageView.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(11, 11));
    }];
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
