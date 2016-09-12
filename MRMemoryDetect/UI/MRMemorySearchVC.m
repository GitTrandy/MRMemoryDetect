//
//  MRMemorySearchVC.m
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#import "MRMemorySearchVC.h"
#import "MRMemoryDetect.h"
#import "MRMemoryObjectInfoVC.h"
#import "FBAllocationTrackerManager.h"
#import "FBAllocationTrackerSummary.h"
#import "MRMemoryDetect.h"

@interface MRMemorySearchVC ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray<FBAllocationTrackerSummary *> *originObjArray;
@property (nonatomic, copy) NSArray<FBAllocationTrackerSummary *> *objArray;

@end

@implementation MRMemorySearchVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0.f,64.f,[UIScreen mainScreen].bounds.size.width, 44.f)];
    searchBar.delegate = self;
    searchBar.returnKeyType = UIReturnKeyDone;
    [searchBar setPlaceholder:@"搜索"];
    [self.view addSubview:searchBar];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.f, 64.f + 44.f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64.f - 44.f) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollsToTop = YES;
    [self.view addSubview:self.tableView];
    
    NSArray<FBAllocationTrackerSummary *> *array = [FBAllocationTrackerManager sharedManager].currentAllocationSummary;
    
    self.originObjArray = [array sortedArrayUsingComparator:^NSComparisonResult(FBAllocationTrackerSummary* obj1, FBAllocationTrackerSummary* obj2) {
        
        for (NSString *key in [MRMemoryDetect sharedInstance].lowPriorityPrefix)
        {
            if ([obj1.className hasPrefix:key])
            {
                return NSOrderedDescending;
            }
        }
        
        for (NSString *key in [MRMemoryDetect sharedInstance].highPriorityPrefix)
        {
            if ([obj1.className hasPrefix:key])
            {
                return NSOrderedAscending;
            }
        }
        
        return NSOrderedSame;

    }];
    
    self.objArray = self.originObjArray;
    
    self.navigationItem.title = [NSString stringWithFormat:@"%ld个类",[self.objArray count]];
    self.view.backgroundColor = [UIColor grayColor];
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
}

#pragma mark - Public Method


#pragma mark - Private Method


#pragma mark - UITableView Delegate & DataSource Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.objArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"UITableViewCell"];
    }

    cell.detailTextLabel.text = self.objArray[indexPath.row].className;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MRMemoryObjectInfoVC *objectInfoVC = [[MRMemoryObjectInfoVC alloc] init];
    objectInfoVC.objectInfo = self.objArray[indexPath.row];
    [self.navigationController pushViewController:objectInfoVC animated:YES];
}

#pragma mark - UISearchBar Delegate & DataSource Method

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self.originObjArray enumerateObjectsUsingBlock:^(FBAllocationTrackerSummary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (searchBar.text.length == 0)
        {
            [array addObjectsFromArray:self.originObjArray];
            *stop = YES;
        }
        if ([[obj.className lowercaseString] containsString:[searchBar.text lowercaseString]])
        {
            [array addObject:obj];
        }
    }];
    self.objArray = [array copy];
    [self.tableView reloadData];
    self.navigationItem.title = [NSString stringWithFormat:@"%ld个类",[self.objArray count]];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.view endEditing:YES];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.view endEditing:YES];
}

#pragma mark - Event Method

- (void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Setters & Getters


@end
