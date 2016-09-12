//
//  MRMemoryObjectInfoVC.h
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/7.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBAllocationTrackerSummary.h"

@interface MRMemoryObjectInfoVC : UIViewController

@property (nonatomic, strong) FBAllocationTrackerSummary *objectInfo;

@end
