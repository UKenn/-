//
//  MyTableViewCell.h
//  微博
//
//  Created by qianfeng on 15-6-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyFrameModel;

@interface MyTableViewCell : UITableViewCell

@property(nonatomic,copy) NSString * headImageName;//头像文件名
@property(nonatomic,copy) NSString * userName;//用户名
@property (nonatomic,assign)NSNumber * vip;//用户vip标识
@property(nonatomic,copy) NSString * message;//消息
@property(nonatomic,copy) NSString * imageName;//消息图片名
@property(nonatomic,assign,readonly) CGFloat rowHeight;//行高

+ (id)tableViewCellWithTableView :(UITableView *)tableView;

@property (nonatomic,strong)MyFrameModel *myFrameModel;

@end
