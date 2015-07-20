//
//  ViewController.m
//  微博
//
//  Created by qianfeng on 15-6-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//


#import "ViewController.h"
#import "MyModel.h"
#import "MyTableViewCell.h"
#import "MyFrameModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    MyTableViewCell *_cell;
}
/**
 *  用于存储模型的数组
 */
@property(nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        //加载plist文件
        NSArray *array = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil]];
        NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
        for (NSDictionary *dict in array) {
            MyModel *myModel = [MyModel myModelWithDict:dict];
//            model转frame
            MyFrameModel *myFrame = [[MyFrameModel alloc]init];
            myFrame.myModel = myModel;
            
            [mutableArray addObject:myFrame];
        }
        _dataSource = mutableArray;
    }
    return _dataSource;
}

- (void)prepareTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyFrameModel *myFrame = self.dataSource[indexPath.row];
    return myFrame.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  调用类方法，复用cell
     */
    MyTableViewCell *cell = [MyTableViewCell tableViewCellWithTableView:tableView];
    cell.myFrameModel = self.dataSource[indexPath.row];
    NSLog(@"%p",cell);
    return cell;
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
