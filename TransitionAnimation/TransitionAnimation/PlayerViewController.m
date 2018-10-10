//
//  PlayerViewController.m
//  KuWoTransitionAnimation
//
//  Created by 王红庆 on 2018/9/24.
//  Copyright © 2018年 王红庆. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@end

@implementation PlayerViewController

#pragma mark - Life Cycle
- (void)loadView {
    
    self.view = [[UIView alloc] init];
    
    self.view.layer.anchorPoint = CGPointMake(0.5, 1.0);
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.view.frame = [UIScreen mainScreen].bounds;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:pan];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)panGesture:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint point = [recognizer translationInView:self.view];
    
    CGAffineTransform transform = self.view.transform;
    CGFloat viewAngle = atan2(transform.b, transform.a);
    
    CGFloat dx = point.x * cos(viewAngle);
    CGFloat dy = point.y * sin(viewAngle);
    
    CGFloat angle = (dx + dy) / self.view.bounds.size.width;
    
    transform = CGAffineTransformRotate(transform, angle);
    transform.tx += 1 * (dx + dy);
    //    transform = CGAffineTransformTranslate(transform, dx + dy, 0);
    
    self.view.transform = transform;
    
    [recognizer setTranslation:CGPointZero inView:self.view];
}

@end
