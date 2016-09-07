//
//  MRMemoryContainerView.m
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import "MRMemoryContainerView.h"

@interface MRMemoryContainerView()

@property (nonatomic, copy) MRMemoryTouchBlock block;
@property (nonatomic, assign) BOOL touchMoved;

@end

@implementation MRMemoryContainerView

- (void)mr_touchBlock:(MRMemoryTouchBlock)block
{
    self.block = block;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!self.touchMoved)
    {
        self.block(touches, event);
    }
    self.touchMoved = NO;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    CGPoint superLocation =[self convertPoint:location toView:self.superview];
    self.center = superLocation;
    self.touchMoved = YES;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.touchMoved = NO;
}

@end
