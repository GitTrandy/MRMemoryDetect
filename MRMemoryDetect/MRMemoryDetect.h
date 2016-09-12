//
//  MRMemoryDetect.h
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MRMemoryDetectWindow.h"

@interface MRMemoryDetect : NSObject<MRMemoryDetectWindowTouchesHandling>

@property (nonatomic, assign) BOOL enable;

@property (nonatomic, copy) NSString *whiteListPrefix;

@property (nonatomic, strong) NSArray *lowPriorityPrefix;
@property (nonatomic, strong) NSArray *highPriorityPrefix;

+ (instancetype)sharedInstance;

@end
