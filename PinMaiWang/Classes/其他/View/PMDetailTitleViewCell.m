//
//  PMDetailTitleViewCell.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMDetailTitleViewCell.h"

typedef NSInteger PMDetailTitleViewCellTag;

const PMDetailTitleViewCellTag PMDetailCountryViewTag = 1000;
const PMDetailTitleViewCellTag PMDetailContentViewTag = PMDetailCountryViewTag * 2;

@implementation PMDetailTitleViewCell

+ (UITableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withDictionary:(NSDictionary *)dict {
    
    PMDetailTitleViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PMDetailTitleViewCell cellIdentifier] forIndexPath: indexPath];
    
    [cell configureCellWithDictionary:dict];
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initializeContentView];
    }
    
    return self;
}

- (void)initializeContentView {
    
    UIImageView *countryFlag = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
    countryFlag.tag = PMDetailCountryViewTag;
    
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(countryFlag.maxX, countryFlag.y, self.width-countryFlag.maxX*2, 75)];
    titleLbl.numberOfLines = 3;
    titleLbl.tag = PMDetailContentViewTag;
    
    [self.contentView addSubview:countryFlag];
    
}

- (void)configureCellWithDictionary:(NSDictionary *)dict {
    
    UIImageView *countryFlag = [self.contentView viewWithTag:PMDetailCountryViewTag];
    UILabel *titleLbl = [self.contentView viewWithTag:PMDetailContentViewTag];
    
    if ([dict[PMDetailTitleCountryKey] isKindOfClass:[NSString class]]) {
        countryFlag.image = [UIImage imageNamed:dict[PMDetailTitleCountryKey]];
    }
    
    if ([dict[PMDetailTitleCountryKey] isKindOfClass:[UIImage class]]) {
        countryFlag.image = dict[PMDetailTitleCountryKey];
    }
    
    titleLbl.attributedText = dict[PMDetailTitleContentKey];
    
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
