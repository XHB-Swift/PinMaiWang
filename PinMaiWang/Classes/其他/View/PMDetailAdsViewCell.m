//
//  PMDetailAdsViewCell.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/20.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMDetailAdsViewCell.h"

@implementation PMDetailAdsViewCell

+ (UITableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withDictionary:(NSDictionary *)dict {
    
    PMDetailAdsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PMDetailAdsViewCell cellIdentifier] forIndexPath:indexPath];
    
    [cell configureCellWithDictionary:dict];
    
    return cell;
    
}

+ (UITableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withAnyData:(id)anyData {
    
    PMDetailAdsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PMDetailAdsViewCell cellIdentifier] forIndexPath:indexPath];
    
    [cell configureCellWithAnyData:anyData];
    
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initializeContentView];
    }
    
    return self;
}

- (void)initializeContentView {
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.contentView.width-20, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.tag = 1000;
    [self.contentView addSubview:label];
    
}

- (void)configureCellWithAnyData:(id)anyData {
    
    UILabel *label = [self.contentView viewWithTag:1000];
    label.text = anyData;
    
}

- (void)configureCellWithDictionary:(NSDictionary *)dict {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
