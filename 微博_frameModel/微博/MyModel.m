//
//  myModel.m
//  微博
//
//  Created by qianfeng on 15-6-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

+ (instancetype)myModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        //kvc
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
