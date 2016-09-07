//
//  MRMemoryMainCell.m
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/7.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import "MRMemoryMainCell.h"

@implementation MRMemoryMainCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.switchBtn = [[UISwitch alloc] init];
        self.switchBtn.frame = CGRectMake(0.f, 0.f, 60.f, 40.f);
        self.switchBtn.center = CGPointMake([UIScreen mainScreen].bounds.size.width - 40.f, 44.f/2.f);
        [self.contentView addSubview:self.switchBtn];
    }
    return self;
}

@end
