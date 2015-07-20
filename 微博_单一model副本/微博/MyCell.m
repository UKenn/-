//
//  MyCell.m
//  微博
//
//  Created by qianfeng on 15-7-3.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyCell.h"
#import "MyModel.h"

@interface MyCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation MyCell

+ (id)myCellWithTableView :(UITableView *)tableView
{
    NSLog(@"mycell:%@",NSStringFromClass([self class]));
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
//    return [super cellWithTableView:tableView];
}

- (void)setModel:(MyModel *)model
{
    _model = model;
    
    NSLog(@"%@",model.name);
    NSLog(@"%@",model.icon);
    self.iconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpeg",model.icon]];
    self.telabel.text = model.text;
    self.nameLabel.text = model.name;
}

@end