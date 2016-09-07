//
//  MRMemoryDetectWindow.h
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MRMemoryDetectWindowTouchesHandling<NSObject>

- (BOOL)window:(nullable UIWindow *)window shouldReceiveTouchAtPoint:(CGPoint)point;

@end

@interface MRMemoryDetectWindow : UIWindow

@property (nonatomic, weak, nullable) id<MRMemoryDetectWindowTouchesHandling> touchesDelegate;

@end
