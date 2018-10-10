//
//  ViewController.m
//  TransitionAnimation
//
//  Created by 王红庆 on 2018/9/24.
//  Copyright © 2018年 王红庆. All rights reserved.
//

#import "ViewController.h"
#import "PlayerViewController.h"
#import "RotateTransitionDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *demoView;
@property (nonatomic, strong) RotateTransitionDelegate *rotateDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
//    self.demoView = [[UIView alloc] init];
//    self.demoView.backgroundColor = [UIColor whiteColor];
//    // 设置 anchorPoint 一定要在设置 frame 之前,不然 frame 会根据 anchorPoint 重新调整位置
//    self.demoView.layer.anchorPoint = CGPointMake(0.5, 1);
//    self.demoView.frame = self.view.bounds;
//    [self.view addSubview:self.demoView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (![segue.destinationViewController isKindOfClass:[PlayerViewController class]]) {
        return;
    }
    PlayerViewController *vc = segue.destinationViewController;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self.rotateDelegate;
}

#pragma mark - Getters And Setters
- (RotateTransitionDelegate *)rotateDelegate {
    if (_rotateDelegate == nil) {
        _rotateDelegate = [[RotateTransitionDelegate alloc] init];
    }
    return _rotateDelegate;
}

@end
