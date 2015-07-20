//
//  myFrameModel.h
//  微博
//
//  Created by qianfeng on 15-7-1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MyModel;
@interface MyFrameModel : NSObject

@property (nonatomic,strong) MyModel *myModel;

/**
 *  头像frame
 */
@property (nonatomic,assign,readonly)CGRect iconF;
/**
 *  昵称frame
 */
@property (nonatomic,assign,readonly) CGRect nameF;
/**
 *  正文frame
 */
@property (nonatomic,assign,readonly) CGRect textF;
/**
 *  图片frame
 */
@property (nonatomic,assign,readonly) CGRect pictureF;
/**
 *  cell的高度
 */
@property (nonatomic,assign,readonly) CGFloat cellHeight;

@end
