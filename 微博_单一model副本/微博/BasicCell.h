//
//  BasicCell.h
//  微博
//
//  Created by qianfeng on 15-7-3.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"
@interface BasicCell : UITableViewCell
{
    @protected
    MyModel *_model;
}
+ (id)cellWithTableView :(UITableView *)tableView;
@property (nonatomic,strong)MyModel *model;

@end
