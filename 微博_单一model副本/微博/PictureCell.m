//
//  PictureCell.m
//  微博
//
//  Created by qianfeng on 15-7-3.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PictureCell.h"
#import "MyModel.h"
@interface PictureCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIButton *titleButton;
@property (weak, nonatomic) IBOutlet UILabel *ttLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;


@end

@implementation PictureCell

+ (id)pictureCellWithTableView :(UITableView *)tableView
{
    NSLog(@"picture:%@",NSStringFromClass([self class]));
    //取xib文件 ，复用cell
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
}

- (void)setModel:(MyModel *)model
{
    _model = model;
    self.iconView.image = [UIImage imageNamed:model.icon];
    [self.titleButton setTitle:[NSString stringWithFormat:@"%@    🐟",model.name] forState:UIControlStateNormal];
//    self.textLabel.text = model.text;
    self.pictureView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",model.picture]];
}
@end
