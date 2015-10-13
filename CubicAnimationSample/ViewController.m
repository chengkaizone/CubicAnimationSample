//
//  ViewController.m
//  CubicAnimationSample
//
//  Created by lance on 15/10/13.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "ViewController.h"
#import "easing.h"
#import "YXEasing.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *backView = [[UIView alloc] initWithFrame:self.view.bounds];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = 0;
    [self.view addSubview:backView];
    [UIView animateWithDuration:1.f animations:^{
        backView.alpha = 0.3f;
    }];
    
    
    //创建模拟菜单
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imageView.image = [UIImage imageNamed:@"pic"];
    [self.view addSubview:imageView];
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.keyPath = @"position";
    keyFrameAnimation.duration = 1.f;
    keyFrameAnimation.values = \
        [YXEasing calculateFrameFromPoint:imageView.center
                                  toPoint:CGPointMake(self.view.center.x + 100, self.view.center.y)
                                     func:CubicEaseOut
                               frameCount:1 * 30];
    imageView.center = CGPointMake(self.view.center.x + 100, self.view.center.y);
    [imageView.layer addAnimation:keyFrameAnimation forKey:nil];
    
}


@end
