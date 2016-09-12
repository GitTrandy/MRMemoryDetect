//
//  MRMemoryDetect.m
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import "MRMemoryDetect.h"
#import "NSObject+MRDealloc.h"
#import "MRMemoryContainerVC.h"
#import "FBAllocationTrackerManager.h"

@interface MRMemoryDetect()
{
    MRMemoryContainerVC *_containerVC;
}

@property (nonatomic, strong) NSMutableDictionary *memoryObjDic;
@property (nonatomic, strong) MRMemoryDetectWindow *memoryDetectWindow;

@end

@implementation MRMemoryDetect

+ (instancetype)sharedInstance
{
    static MRMemoryDetect *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MRMemoryDetect alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _memoryObjDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - Public Method

- (void)setEnable:(BOOL)enable
{
    _enable = enable;
    
    _containerVC = [[MRMemoryContainerVC alloc] init];
    
    _memoryDetectWindow = [[MRMemoryDetectWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _memoryDetectWindow.touchesDelegate = self;
    _memoryDetectWindow.rootViewController = [[MRMemoryNavigationController alloc] initWithRootViewController:_containerVC];
    _memoryDetectWindow.hidden = NO;
    
    /**
     *  本来以为自己能hook的，结果遇到 NSTaggedPointerStringCStringContainer retain的bug怎么也解决不了，最后google找到FBAllocationTracker能解决这个bug，发现这个其实就是做的和我想做的事情差不多，于是转而封装FBAllocationTracker
     */
//    [NSObject swizzleInitMethod];
    
    if (enable)
    {
        [[FBAllocationTrackerManager sharedManager] startTrackingAllocations];
        [[FBAllocationTrackerManager sharedManager] enableGenerations];
    }
    else
    {
        [[FBAllocationTrackerManager sharedManager] stopTrackingAllocations];
        [[FBAllocationTrackerManager sharedManager] disableGenerations];
    }
    
}


#pragma mark - Private Method

#pragma mark - MRMemoryDetectWindowTouchesHandling Delegate Method
- (BOOL)window:(UIWindow *)window shouldReceiveTouchAtPoint:(CGPoint)point
{
    return CGRectContainsPoint(_containerVC.containerView.bounds,
                               [_containerVC.containerView convertPoint:point
                                                               fromView:window]);
}

#pragma mark - Event Method


#pragma mark - Setters & Getters

- (NSArray *)lowPriorityPrefix
{

    return _lowPriorityPrefix ? _lowPriorityPrefix : @[@"CA",@"_",@"OS",@"CF"];
}

- (NSArray *)highPriorityPrefix
{
    return _highPriorityPrefix ? _highPriorityPrefix : @[@"NS",@"UI"];
}


@end
