//
//  MRWhiteListVC.m
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/7.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import "MRWhiteListVC.h"
#import "MRMemoryDetect.h"

@implementation MRWhiteListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *prefixLabel = [[UILabel alloc] init];
    prefixLabel.frame = CGRectMake(10.f, 64.f + 10.f, 100.f, 30.f);
    prefixLabel.text = @"前缀(不区分大小写)";
    [self.view addSubview:prefixLabel];
    
    UITextField *prefixField = [[UITextField alloc] init];
    prefixField.placeholder = @"请使用 , 分割";
    prefixField.text = [MRMemoryDetect sharedInstance].whiteListPrefix;
    prefixField.frame = CGRectMake(10.f, 104.f + 10.f, [UIScreen mainScreen].bounds.size.width - 20.f, 30.f);
    prefixField.layer.borderColor = [UIColor grayColor].CGColor;
    prefixField.layer.borderWidth = 0.5f;
    prefixField.layer.cornerRadius = 3.f;
    [self.view addSubview:prefixField];
}

@end
