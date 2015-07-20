//
//  ViewController.m
//  微博
//
//  Created by qianfeng on 15-6-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "MyModel.h"
#import "MyCell.h"
#import "PictureCell.h"
#import "BasicCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{

}
@property (nonatomic,strong)NSArray *dataSource;

@end

@implementation ViewController

- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc]init];
        
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil];
        NSArray *array = [[NSArray alloc]initWithContentsOfFile:filePath];
        NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
        for (NSDictionary *dict in array) {
            MyModel *model = [MyModel myModelWithDict:dict];
            [mutableArray addObject:model];
        }
        _dataSource = mutableArray;
//        NSLog(@"%@",_dataSource);
    }
    return _dataSource;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //model
    MyModel *model = [self.dataSource objectAtIndex:indexPath.row];
    UITableViewCell *cell = nil;
    if (model.picture == nil) {
        MyCell *cell = [MyCell myCellWithTableView:tableView];
        cell.model = model;
        return cell;
    }
    else{
        PictureCell * cell = [PictureCell pictureCellWithTableView:tableView];
        cell.model = model;
        return cell;
    }
    return cell;
}


@end
