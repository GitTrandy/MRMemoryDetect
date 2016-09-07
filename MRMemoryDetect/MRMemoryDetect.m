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
    
    [NSObject swizzleInitMethod];
}

- (void)addObject:(id)obj
{
    if ([obj conformsToProtocol:NSProtocolFromString(@"NSObject")])
    {
        [self addObjectDescription:[obj mr_objDescription]];
    }
}

- (void)addObjectDescription:(NSString *)objDescription;
{
    if (objDescription && objDescription.length > 0)
    {
        self.memoryObjDic[objDescription] = objDescription;
    }
}

- (void)removeObject:(id)obj
{
    if ([obj conformsToProtocol:NSProtocolFromString(@"NSObject")])
    {
        [self removeObjectDescription:[obj mr_objDescription]];
    }
}

- (void)removeObjectDescription:(NSString *)objDescription
{
    if (objDescription && objDescription.length > 0)
    {
        self.memoryObjDic[objDescription] = nil;
    }
}

- (NSArray *)memoryObjArray
{
    return [self.memoryObjDic allKeys];
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


@end
