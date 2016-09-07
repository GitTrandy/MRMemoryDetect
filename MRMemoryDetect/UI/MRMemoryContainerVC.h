//
//  MRMemoryContainerVC.h
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRMemoryContainerView.h"
#import "MRMemoryMainVC.h"
#import "MRMemoryNavigationController.h"

@interface MRMemoryContainerVC : UIViewController
{
    MRMemoryMainVC *_mainVC;
}

@property (nonatomic, strong) MRMemoryContainerView *containerView;

@end
