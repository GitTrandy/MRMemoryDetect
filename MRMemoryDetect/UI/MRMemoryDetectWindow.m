//
//  MRMemoryDetectWindow.m
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import "MRMemoryDetectWindow.h"

@interface MRMemoryDetectWindow()

@end

@implementation MRMemoryDetectWindow

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        /**
         Window level will determine how on top we want to appear in window hierarchy.
         We do not want to hide alerts, but we want to be pretty much above everything else.
         */
        self.windowLevel = UIWindowLevelStatusBar + 100;
    }
    
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if ([_touchesDelegate window:self shouldReceiveTouchAtPoint:point]) {
        return [super pointInside:point withEvent:event];
    }
    return YES;
}

@end
