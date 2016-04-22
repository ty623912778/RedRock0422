//
//  TYStatusCellViewController.m
//  0418
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TYStatusCellViewController.h"
#import "TYStatus.h"
#import "TYStatusTableViewCell.h"


@interface TYStatusCellViewController ()<UIAlertViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_status;
    NSMutableArray *_statusCells;
}

@end

@implementation TYStatusCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self initData];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
}

- (void)initData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"PropertyList" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    _status = [[NSMutableArray alloc]init];
    _statusCells = [[NSMutableArray alloc]init];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_status addObject:[TYStatus statusWithDictionary:obj]];
        
        TYStatusTableViewCell *cell = [[TYStatusTableViewCell alloc] init];
        [_statusCells addObject:cell];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _status.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    
    TYStatusTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[TYStatusTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    TYStatus *status = _status[indexPath.row];
    cell.status = status;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TYStatusTableViewCell *cell = _statusCells[indexPath.row];
    cell.status = _status[indexPath.row];
    return cell.height;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}




@end
