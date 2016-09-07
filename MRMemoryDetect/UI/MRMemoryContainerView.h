//
//  MRMemoryContainerView.h
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MRMemoryTouchBlock) (NSSet<UITouch *> *touches,UIEvent *event);

@interface MRMemoryContainerView : UIView

- (void)mr_touchBlock:(MRMemoryTouchBlock)block;

@end
