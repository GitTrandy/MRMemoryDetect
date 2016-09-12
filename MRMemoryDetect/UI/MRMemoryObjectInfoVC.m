//
//  MRMemoryObjectInfoVC.m
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/7.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import "MRMemoryObjectInfoVC.h"

@implementation MRMemoryObjectInfoVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = self.objectInfo.className;
    UITextView *textView = [[UITextView alloc] init];
    textView.editable = NO;
    textView.frame = CGRectMake(0.f, 64.f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64.f);
    textView.font = [UIFont systemFontOfSize:15.f];
    textView.textColor = [UIColor blackColor];
    [self.view addSubview:textView];
    
    if (self.objectInfo)
    {
        textView.text = [textView.text stringByAppendingString:[NSString stringWithFormat:@"self.aliveObjects: %ld\n\r",self.objectInfo.aliveObjects]];
        
        textView.text = [textView.text stringByAppendingString:[NSString stringWithFormat:@"self.instanceSize: %ld\n\r",self.objectInfo.instanceSize]];
    }
    
}

@end
