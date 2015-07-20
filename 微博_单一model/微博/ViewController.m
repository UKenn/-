//
//  ViewController.m
//  微博
//
//  Created by qianfeng on 15-6-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "myModel.h"
#import "MyTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataSource;
    MyTableViewCell *_cell;
}


@end

@implementation ViewController

- (void)prepareDataSource
{
    _dataSource = [[NSMutableArray alloc]init];
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:filePath];
    for (NSDictionary *dict in array) {
        myModel *model = [myModel myModelWithDict:dict];
        [_dataSource addObject:model];
    }
}

- (void)prepareTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareDataSource];
    [self prepareTableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    myModel *model = [_dataSource objectAtIndex:indexPath.row];
    
    //注册
    [tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"123"];
    //获得对象
    _cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    
//    if (!_cell) {
//        _cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
//    }
    
    _cell.headImageName = model.icon;
    _cell.userName = model.name;
    _cell.vip = model.vip;
    _cell.message = model.text;
    _cell.imageName = model.picture;
    
    NSLog(@"%p",_cell);
    return _cell.rowHeight;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
//    MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (!cell) {
//        cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
    
    //注册
    [tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:ID];
    //创建或者取出cell
   MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    
    //model
    myModel *model = [_dataSource objectAtIndex:indexPath.row];
    
    cell.headImageName = model.icon;
    cell.userName = model.name;
    cell.vip = model.vip;
    cell.message = model.text;
    cell.imageName = model.picture;
    
    NSLog(@"cell:%p",cell);
    return cell;
}


@end
