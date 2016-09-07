//
//  MRMemoryContainerVC.m
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import "MRMemoryContainerVC.h"

@implementation MRMemoryContainerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mainVC = [[MRMemoryMainVC alloc] init];
    
    self.containerView = [[MRMemoryContainerView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 150, 40, 40, 40)];
    self.containerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.containerView];
    
    
    
    [self.containerView mr_touchBlock:^(NSSet<UITouch *> *touches, UIEvent *event) {
        [self.navigationController pushViewController:_mainVC animated:YES];
    }];
}


@end
