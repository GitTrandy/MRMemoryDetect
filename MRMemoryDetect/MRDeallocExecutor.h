//
//  MRDeallocExecutor.h
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MRDeallocBlock)(NSString* objDescription);

@interface MRDeallocExecutor : NSObject
{
    MRDeallocBlock _block;
}

@property (nonatomic, copy) NSString *objDescription;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithBlock:(MRDeallocBlock)deallocBlock obj:(id)obj NS_DESIGNATED_INITIALIZER;

@end
