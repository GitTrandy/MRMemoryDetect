//
//  MRDeallocExecutor.m
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import "MRDeallocExecutor.h"
#import "NSObject+MRDealloc.h"

@implementation MRDeallocExecutor

- (instancetype)initWithBlock:(MRDeallocBlock)deallocBlock obj:(id)obj
{
    self = [super init];
    
    if (self) {
        _block = [deallocBlock copy];
        _objDescription = [obj mr_objDescription];
    }
    
    return self;
}

- (void)dealloc
{
    _block ? _block(_objDescription) : nil;
}

@end
