//
//  UITableViewCell+Identifier.m
//  jianhun
//
//  Created by 谢鸿标 on 2017/3/3.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import "UITableViewCell+Identifier.h"

@implementation UITableViewCell (Identifier)

+ (NSString *)cellIdentifier {
    
    return NSStringFromClass([self class]);
}

+ (UITableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withDictionary:(NSDictionary *)dict{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifier] forIndexPath:indexPath];
    
    [cell configureCellWithDictionary:dict];
    
    return cell;
}

+ (UITableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withAnyData:(id)anyData {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifier] forIndexPath:indexPath];
    
    [cell configureCellWithAnyData:anyData];
    
    return cell;
}

- (void)configureCellWithDictionary:(NSDictionary *)dict {
    
}

- (void)configureCellWithAnyData:(id)anyData {
    
}

@end
