//
//  myModel.h
//  微博
//
//  Created by qianfeng on 15-6-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject

@property (nonatomic,copy) NSString *text;//文本
@property (nonatomic,copy) NSString *icon;//图标
@property (nonatomic,copy) NSString *picture;//图片
@property (nonatomic,copy) NSString *name;//昵称
@property (nonatomic,assign) NSNumber *vip;//标识👑

+ (instancetype)myModelWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
