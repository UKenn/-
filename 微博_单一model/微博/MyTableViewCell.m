//
//  MyTableViewCell.m
//  微博
//
//  Created by qianfeng on 15-6-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UIImage+animatedGIF.h"

@implementation MyTableViewCell
{
    UIImageView *headImage;
    UILabel *userNameLabel;
    UILabel *messageLabel;
    UIImageView *imageView;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self prepareView];
    }
    return self;
}

- (void)prepareView
{
    //头像
    headImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5,50, 50)];
    [self.contentView addSubview:headImage];
    
    //用户名
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 15, 140, 30)];
    [self.contentView addSubview:userNameLabel];
    
    //消息
    messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 60, 365, 0)];
    //因为高度要根据实际内容的多少来进行计算，那么有可能实际长度一行显示不下
    //那么就要设置一下多行显示
    messageLabel.numberOfLines = 0;
    //设置折行模式
    messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
    messageLabel.font = [UIFont systemFontOfSize:15];
    //因为有可能没有消息内容
    //所以先将消息控件隐藏，实际赋值后，如果有内容，那再显示出来
    messageLabel.hidden = YES;
    [self.contentView addSubview:messageLabel];
    
    _rowHeight = 60.0f;
    
}

- (void)setHeadImageName:(NSString *)headImageName
{
    _headImageName = headImageName;
    headImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpeg",_headImageName]];
}

- (void)setUserName:(NSString *)userName
{
    _userName = userName;
    userNameLabel.text = _userName;
}

- (void)setVip:(NSNumber *)vip
{
    int a = [vip intValue];
    if (a == 1) {
        userNameLabel.text = [NSString stringWithFormat:@"%@  👑",_userName];
    }else{
        userNameLabel.text = _userName;
    }
}

- (void)setMessage:(NSString *)message
{
    if (message.length == 0) {
        messageLabel.hidden =YES;
        _rowHeight = 60.0f;
        return;
    }
    _message = message;
    messageLabel.hidden = NO;
    CGSize size = [message boundingRectWithSize:CGSizeMake(365, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    //根据计算过后的消息所占的宽高，来调整messageLabel的frame
    messageLabel.frame = CGRectMake(5, 60, 365, size.height);
    
    messageLabel.text = _message;
    
    _rowHeight = CGRectGetMaxY(messageLabel.frame) + 5;
}

//
- (void)setImageName:(NSString *)imageName
{
    //将取出的视图，从单元格上移除
    [imageView removeFromSuperview];
    
    _imageName = imageName;
    if (imageName != nil){
    if ([_imageName containsString:@".gif"]) {
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, _rowHeight, 120, 120 )];
//        imageView.tag = 1000;
        
        NSString * filePath = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",_imageName] ofType:nil];
        NSURL * fileUrl = [NSURL fileURLWithPath:filePath];//这个方法用来进行本地地下的转换
        NSData * data = [[NSData alloc]initWithContentsOfURL:fileUrl];
        imageView.image = [UIImage animatedImageWithAnimatedGIFData:data];
        
    }else if ([_imageName containsString:@".jpg"]){
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, _rowHeight, 120, 120 )];
//        imageView.tag = 1000;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@.jpg",_imageName]];
        
    }else{
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, _rowHeight, 120, 120 )];
//        imageView.tag = 1000;
        imageView.image = [UIImage imageNamed:_imageName];
        
    }
        [self.contentView addSubview:imageView];
//        UIView * view = [self.contentView viewWithTag:1000];
        _rowHeight = CGRectGetMaxY(imageView.frame) + 5;
    }
}

@end
