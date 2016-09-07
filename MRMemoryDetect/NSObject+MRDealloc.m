//
//  NSObject+MRDealloc.m
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import "NSObject+MRDealloc.h"
#import <objc/runtime.h>
#import "MRMemoryDetect.h"

const void *MRDeallocBlockKey = &MRDeallocBlockKey;

@implementation NSObject (MRDealloc)

+ (void)swizzleInitMethod
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSEL:@selector(init) withSEL:@selector(mr_init) isInstanceMethod:YES];
    });
}

+ (void)recoveryInitMethod
{
    //TODO: to do
}

- (instancetype)mr_init
{
    id obj = [self mr_init];
    
    if (![self isKindOfClass:[MRDeallocExecutor class]])
    {
        [[MRMemoryDetect sharedInstance] addObject:obj];
        [obj mr_deallocExecute:^(NSString *objDescription) {
            [[MRMemoryDetect sharedInstance] removeObjectDescription:objDescription];
        }];
    }
    return obj;
}

+ (void)swizzleClassSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL
{
    [self swizzleSEL:originalSEL withSEL:swizzledSEL isInstanceMethod:NO];
}

+ (void)swizzleInstanceSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL
{
    [self swizzleSEL:originalSEL withSEL:swizzledSEL isInstanceMethod:YES];
}

+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL isInstanceMethod:(BOOL)isInstanceMethod
{
    Class class = [self class];
    
    Method originalMethod;
    Method swizzledMethod;
    if (isInstanceMethod)
    {
        originalMethod = class_getInstanceMethod(class, originalSEL);
        swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
    }
    else
    {
        originalMethod = class_getClassMethod(class, originalSEL);
        swizzledMethod = class_getClassMethod(class, swizzledSEL);
    }

    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)mr_deallocExecute:(MRDeallocBlock)block
{
    if (block) {
        MRDeallocExecutor *executor = [[MRDeallocExecutor alloc] initWithBlock:block obj:self];
        objc_setAssociatedObject(self,
                                 MRDeallocBlockKey,
                                 executor,
                                 OBJC_ASSOCIATION_RETAIN);
    }
}

- (NSString *)mr_objDescription
{
    return [NSString stringWithFormat:@"<%@: %p >",NSStringFromClass([self class]),self];
}

@end
