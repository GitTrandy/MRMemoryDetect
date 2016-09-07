//
//  MRMemoryMainVC.h
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MRMemroyCellType)
{
    MRMemroyCellSearch = 0,
    MRMemroyCellFilter,
    MRMemroyCellRecord,
    MRMemroyCellWhiteList,
    MRMemroyCellBlackList,
};

@interface MRMemoryMainVC : UIViewController

@end
