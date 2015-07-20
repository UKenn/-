//
//  BasicCell.m
//  微博
//
//  Created by qianfeng on 15-7-3.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "BasicCell.h"

@implementation BasicCell

+ (id)cellWithTableView :(UITableView *)tableView
{
    NSString *Identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:Identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:Identifier];
    return [tableView dequeueReusableCellWithIdentifier:Identifier];
}
@end
