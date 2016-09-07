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
    self.title = self.objectInfo;
    UITextView *textView = [[UITextView alloc] init];
    textView.editable = NO;
    textView.frame = CGRectMake(0.f, 64.f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64.f);
    textView.font = [UIFont systemFontOfSize:15.f];
    textView.textColor = [UIColor blackColor];
    [self.view addSubview:textView];
    
    if (self.objectInfo)
    {
        NSArray<NSString *> *array = [self.objectInfo componentsSeparatedByString:@" "];
        NSLog(@"array = %@",array);
        if ([array count] == 3)
        {
            NSString *className = [array[0] stringByReplacingOccurrencesOfString:@"<" withString:@""];
            className = [className stringByReplacingOccurrencesOfString:@":" withString:@""];
            
            NSString *str = array[1];
            //字符串转16进制数字 也就是指针地址
            unsigned long objAddress = strtoul([str UTF8String],0,16);
            @try {
                //指针地址转指针
                
                id obj = (__bridge id)((void *)objAddress);
                Class cls = NSClassFromString(className);
                if (cls)
                {
                    if ([cls isSubclassOfClass:[UIView class]])
                    {
                        //print superview,subviews,
                        UIView *viewObj = obj;
                        textView.text = [textView.text stringByAppendingString:[NSString stringWithFormat:@"self.description: %@\n\r",viewObj.description]];
                        textView.text = [textView.text stringByAppendingString:[NSString stringWithFormat:@"self.superview: %@\n\r",viewObj.superview]];
                        textView.text = [textView.text stringByAppendingString:[NSString stringWithFormat:@"self.subviews: %@\n\r",viewObj.subviews]];
                        
                    }
                    else if([cls isSubclassOfClass:[UIViewController class]])
                    {
                        //print self.navigationController,parentController,self.navigationController.viewControllers
                        UIViewController *vcObj = obj;
                        textView.text = [textView.text stringByAppendingString:[NSString stringWithFormat:@"self.description: %@\n\r",vcObj.description]];
                        textView.text = [textView.text stringByAppendingString:[NSString stringWithFormat:@"self.navigationController: %@\n\r",vcObj.navigationController]];
                        textView.text = [textView.text stringByAppendingString:[NSString stringWithFormat:@"self.parentViewController: %@\n\r",vcObj.parentViewController]];
                        textView.text = [textView.text stringByAppendingString:[NSString stringWithFormat:@"self.navigationController.viewControllers: %@\n\r",vcObj.navigationController.viewControllers]];
                    }
                    else if([obj conformsToProtocol:NSProtocolFromString(@"NSObject")])
                    {
                        if ([obj respondsToSelector:@selector(description)])
                        {
                            textView.text = [textView.text stringByAppendingString:[NSString stringWithFormat:@"self.description: %@\n\r",[obj description]]];
                        }
                        else
                        {
                            textView.text = @"self.description 不可用";
                        }
                        
                    }
                    else
                    {
                        textView.text = @"这可能不是NSObject对象";
                    }
                }
            } @catch (NSException *exception) {
                NSLog(@"exception = %@",exception);
            } @finally {
                
            }
            
        }
    }
    
}

@end
