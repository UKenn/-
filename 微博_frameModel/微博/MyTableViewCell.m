//
//  MyTableViewCell.m
//  微博
//
//  Created by qianfeng on 15-6-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UIImage+animatedGIF.h"
#import "MyFrameModel.h"
#import "MyModel.h"

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
        //准备布局视图
        [self prepareView];
    }
    return self;
}

+ (id)tableViewCellWithTableView:(UITableView *)tableView
{
    NSString * Identifier = NSStringFromClass([self class]);
    [tableView registerClass:[self class] forCellReuseIdentifier:Identifier];
    //如果有则返回,如果没有则创建
    return [tableView dequeueReusableCellWithIdentifier:Identifier];
}

- (void)prepareView
{
    //1、头像
    headImage = [[UIImageView alloc]init];
    [self.contentView addSubview:headImage];
    
    //2、用户名
    userNameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:userNameLabel];
    
    //3、消息
    messageLabel = [[UILabel alloc]init];
    //因为高度要根据实际内容的多少来进行计算，那么有可能实际长度一行显示不下
    //那么就要设置一下多行显示
    messageLabel.numberOfLines = 0;
    //设置折行模式
    messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
    messageLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:messageLabel];
    //4、图片
    imageView = [[UIImageView alloc]init];
    [self.contentView addSubview:imageView];
    
}

- (void)setMyFrameModel:(MyFrameModel *)myFrameModel
{
    _myFrameModel = myFrameModel;
    MyModel *myModel =myFrameModel.myModel;
    //1、头像
    headImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpeg",myModel.icon]];
    headImage.frame = myFrameModel.iconF;
    
    //2、用户名
    userNameLabel.text = myModel.name;
    userNameLabel.frame = myFrameModel.nameF;
    
    //VIP标识
    int a = [myModel.vip intValue];
    if (a == 1) {
        userNameLabel.text = [NSString stringWithFormat:@"%@  👑",myModel.name];
    }else{
        userNameLabel.text = myModel.name;
    }
    
    //3、信息文本
    messageLabel.text = myModel.text;
    messageLabel.frame = myFrameModel.textF;
    
    //4、图片
    if ([myModel.picture containsString:@".gif"]) {
        NSLog(@"%@",myModel.picture);
        NSString * filePath = [[NSBundle mainBundle]pathForResource:myModel.picture ofType:nil];
        NSURL * fileUrl = [NSURL fileURLWithPath:filePath];//这个方法用来进行本地地下的转换
        NSData * data = [[NSData alloc]initWithContentsOfURL:fileUrl];
        imageView.image = [UIImage animatedImageWithAnimatedGIFData:data];
        
    }else{
        imageView.image = [UIImage imageNamed:myModel.picture];
    }
    imageView.frame = myFrameModel.pictureF;
}

/*
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
        UIView * view = [self.contentView viewWithTag:1000];
        //将取出的视图，从单元格上移除
        [view removeFromSuperview];
    
    _imageName = imageName;
    if (imageName != nil){
    if ([_imageName containsString:@".gif"]) {
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, _rowHeight, 120, 120 )];
        imageView.tag = 1000;
        
        NSString * filePath = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",_imageName] ofType:@"gif"];
        NSURL * fileUrl = [NSURL fileURLWithPath:filePath];//这个方法用来进行本地地下的转换
        NSData * data = [[NSData alloc]initWithContentsOfURL:fileUrl];
        imageView.image = [UIImage animatedImageWithAnimatedGIFData:data];
        
    }else if ([_imageName containsString:@".jpg"]){
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, _rowHeight, 120, 120 )];
        imageView.tag = 1000;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@.jpg",_imageName]];
        
    }else{
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, _rowHeight, 120, 120 )];
        imageView.tag = 1000;
        imageView.image = [UIImage imageNamed:_imageName];
        
    }
        [self.contentView addSubview:imageView];
//        UIView * view = [self.contentView viewWithTag:1000];
        _rowHeight = CGRectGetMaxY(imageView.frame) + 5;
    }
}
 */

@end
