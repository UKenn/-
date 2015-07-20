//
//  myFrameModel.m
//  微博
//
//  Created by qianfeng on 15-7-1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyFrameModel.h"
#import "MyModel.h"

@implementation MyFrameModel

/**
 *  计算文字尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *arrrs = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:arrrs context:nil].size;
}

- (void)setMyModel:(MyModel *)myModel
{
    _myModel = myModel;
    //间距
    CGFloat padding = 5;
    
    //头像frame
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    //用户名frame
    CGFloat nameX = iconW + padding * 2;
    CGFloat nameY = 15;
    CGFloat nameW = 150;
    CGFloat nameH = 30;
    _nameF = CGRectMake(nameX, nameY, nameW, nameH);
    
    //信息正文
    CGFloat textX = padding;
    CGFloat textY = CGRectGetMaxY(_iconF) + padding;
    CGSize textMaxSize =  CGSizeMake([UIScreen mainScreen].bounds.size.width,  MAXFLOAT);
    CGSize textSize = [self sizeWithText:myModel.text font:[UIFont systemFontOfSize:15] maxSize:textMaxSize];
    _textF = CGRectMake(textX, textY, textSize.width - padding, textSize.height);
    
    //图片frame
    CGFloat pictureX = padding;
    CGFloat pictureY = CGRectGetMaxY(_textF) +padding;
    CGFloat pictureW = 120;
    CGFloat pictureH = pictureW;
    _pictureF = CGRectMake(pictureX,pictureY ,pictureW, pictureH);
    
    //4、cell 的高度
    CGFloat textMaxY = CGRectGetMaxY(_textF);
    CGFloat pictureMaxY = CGRectGetMaxY(_pictureF);
    if (myModel.picture == nil) {
        if (myModel.text == nil) {
            _cellHeight = CGRectGetMaxY(_iconF) + padding;
        }
        _cellHeight = textMaxY + padding;
    }else{
        _cellHeight = pictureMaxY + padding;
    }
}
@end
