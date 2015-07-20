//
//  myModel.h
//  微博
//
//  Created by qianfeng on 15-6-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MyFrameModel;

@interface MyModel : NSObject

@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *picture;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSNumber *vip;
@property (nonatomic,strong) MyFrameModel *frameModel;

+ (id)myModelWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;
@end

@interface MyFrameModel : NSObject



@end
