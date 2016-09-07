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

+ (instancetype)sharedInstance;

- (void)addObject:(id)obj;
- (void)addObjectDescription:(NSString *)objDescription;

- (void)removeObject:(id)obj;
- (void)removeObjectDescription:(NSString *)objDescription;

- (NSArray *)memoryObjArray;

@end
