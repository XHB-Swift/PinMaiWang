//
//  PMCategoryLeftViewCell.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMCategoryLeftViewCell.h"

#define LEFT_CELL_LABEL_TAG 1000
#define LEFT_CELL_SEPERATE_H 2.f

@implementation PMCategoryLeftViewCell

+ (UITableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withAnyData:(id)anyData {
    
    PMCategoryLeftViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PMCategoryLeftViewCell cellIdentifier] forIndexPath:indexPath];
    
    [cell configureCellWithAnyData:anyData];
    
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupContentView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UILabel *label = [self.contentView viewWithTag:LEFT_CELL_LABEL_TAG];
    if (CGRectEqualToRect(label.frame, CGRectZero)) {
        label.size = CGSizeMake(self.width, 30);
    }
}

- (void)setupContentView {
    
    self.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] init];
    label.textColor = PM_CATEGORY_NORMAL_COLOR;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = XHBSystemFont(13);
    label.tag = LEFT_CELL_LABEL_TAG;
    
    UIView *seperator = [[UIView alloc] initWithFrame:CGRectMake(0, label.maxY, label.width, LEFT_CELL_SEPERATE_H)];
    seperator.backgroundColor = PM_CATEGORY_BACKGROUND_COLOR;
    
    [self.contentView addSubview:label];
    [self.contentView addSubview:seperator];
    
}

- (void)configureCellWithAnyData:(id)anyData {
    
    if ([anyData isKindOfClass:[NSString class]]) {
        
        UILabel *label = [self.contentView viewWithTag:LEFT_CELL_LABEL_TAG];
        if (![label.text isEqualToString:anyData]) {
            label.text = anyData;
            [self setNeedsDisplay];
        }
    
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    UILabel *label = [self.contentView viewWithTag:LEFT_CELL_LABEL_TAG];
    self.backgroundColor = selected ? PM_CATEGORY_BACKGROUND_COLOR : [UIColor whiteColor];
    label.textColor = selected ? PM_CATEGORY_SELECT_COLOR : PM_CATEGORY_NORMAL_COLOR;
}

@end
