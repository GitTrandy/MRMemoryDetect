//
//  NSObject+MRDealloc.h
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRDeallocExecutor.h"

@interface NSObject (MRDealloc)

+ (void)swizzleInitMethod;
+ (void)recoveryInitMethod;

- (instancetype)mr_init;

+ (void)swizzleInstanceSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;

+ (void)swizzleClassSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;

- (void)mr_deallocExecute:(MRDeallocBlock)block;

- (NSString *)mr_objDescription;

@end
