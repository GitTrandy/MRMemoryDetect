//
//  MRMemoryMainVC.m
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import "MRMemoryMainVC.h"
#import "MRMemorySearchVC.h"

@interface MRMemoryMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MRMemoryMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    
    self.title = @"MRMemoryDetect";
    self.view.backgroundColor = [UIColor grayColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.f, 64.f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64.f) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark - Public Method


#pragma mark - Private Method


#pragma mark - UITableView Delegate & DataSource Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"UITableViewCell"];
    }
    switch ((MRMemroyCellType)indexPath.row) {
        case MRMemroyCellSearch:
        {
            cell.detailTextLabel.text = @"搜索";
        }
            break;
        case MRMemroyCellFilter:
        {
            cell.detailTextLabel.text = @"筛选";
        }
            break;
        case MRMemroyCellRecord:
        {
            cell.detailTextLabel.text = @"开始记录";
        }
            break;
        case MRMemroyCellWhiteList:
        {
            cell.detailTextLabel.text = @"白名单";
        }
            break;
        case MRMemroyCellBlackList:
        {
            cell.detailTextLabel.text = @"黑名单";
        }
            break;
            
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch ((MRMemroyCellType)indexPath.row) {
        case MRMemroyCellSearch:
        {
            MRMemorySearchVC *searchVC = [[MRMemorySearchVC alloc] init];
            [self.navigationController pushViewController:searchVC animated:YES];
        }
            break;
        case MRMemroyCellFilter:
        {
            
        }
            break;
        case MRMemroyCellRecord:
        {
            
        }
            break;
        case MRMemroyCellWhiteList:
        {
            
        }
            break;
        case MRMemroyCellBlackList:
        {
            
        }
            break;
        default:
            break;
    }
}

#pragma mark - Event Method

- (void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Setters & Getters

@end
