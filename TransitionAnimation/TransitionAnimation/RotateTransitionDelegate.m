//
//  RotateTransitionDelegate.m
//  KuWoTransitionAnimation
//
//  Created by 王红庆 on 2018/9/24.
//  Copyright © 2018年 王红庆. All rights reserved.
//

#import "RotateTransitionDelegate.h"

@implementation RotateTransitionDelegate

/// 返回提供 modal 转场动画的对象
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
/// 详细的转场动画细节
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 容器视图
    UIView *containerView = [transitionContext containerView];
    
    // 目标视图
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    // 将目标视图添加到容器视图中
    [containerView addSubview:toView];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
         usingSpringWithDamping:0.8
          initialSpringVelocity:10
                        options:0
                     animations:^{
                         
                     } completion:^(BOOL finished) {
                         
                     }];
    
    // 转场动画的末尾必须调用的方法
    [transitionContext completeTransition:YES];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

@end
