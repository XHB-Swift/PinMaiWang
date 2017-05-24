//
//  PMDetailTitleViewCell.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMDetailTitleViewCell.h"

NSString *const PMDetailViewCellImageKey = @"PMDetailViewCellImageKey";
NSString *const PMDetailViewCellTitleKey = @"PMDetailViewCellTitleKey";
NSString *const PMDetailViewCellDescKey  = @"PMDetailViewCellDescKey";
NSString *const PMDetailViewCellPriceKey = @"PMDetailViewCellPriceKey";

const NSInteger PM_CELL_COUNTRY_TAG = 1000;
const NSInteger PM_CELL_GOODS_TAG   = PM_CELL_COUNTRY_TAG*2;
const NSInteger PM_CELL_DESC_TAG    = PM_CELL_COUNTRY_TAG*3;
const NSInteger PM_CELL_PRICE_TAG   = PM_CELL_COUNTRY_TAG*4;

@implementation PMDetailTitleViewCell

+ (UITableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withDictionary:(NSDictionary *)dict {
    
    PMDetailTitleViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PMDetailTitleViewCell cellIdentifier] forIndexPath: indexPath];
    
    [cell configureCellWithDictionary:dict];
    
    return cell;
}

+ (UITableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withAnyData:(id)anyData {
    
    PMDetailTitleViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PMDetailTitleViewCell cellIdentifier] forIndexPath:indexPath];
    
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
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UIImageView *countryFlag = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
    countryFlag.tag = PM_CELL_COUNTRY_TAG;
    
    UILabel *goodsNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(countryFlag.maxX, countryFlag.y, self.width-countryFlag.maxX*2, 30)];
    goodsNameLbl.textAlignment = NSTextAlignmentCenter;
    goodsNameLbl.font = XHBSystemFont(18.f);
    goodsNameLbl.tag = PM_CELL_GOODS_TAG;
    
    UILabel *descLbl = [[UILabel alloc] initWithFrame:CGRectMake(goodsNameLbl.x, goodsNameLbl.maxY, goodsNameLbl.width, goodsNameLbl.height)];
    descLbl.textAlignment = NSTextAlignmentCenter;
    descLbl.font = XHBSystemFont(15.f);
    descLbl.tag = PM_CELL_DESC_TAG;
    
    UILabel *priceLbl = [[UILabel alloc] initWithFrame:CGRectMake(descLbl.x, descLbl.maxY, descLbl.width, descLbl.height)];
    priceLbl.textAlignment = NSTextAlignmentCenter;
    priceLbl.font = XHBSystemFont(18.f);
    priceLbl.tag = PM_CELL_PRICE_TAG;
    
    UIView *seperator = [[UIView alloc] initWithFrame:CGRectMake(0, priceLbl.maxY, self.width, 2)];
    seperator.backgroundColor = PM_DETAIL_BRANCH_COLOR;
    
    [self.contentView addSubview:countryFlag];
    [self.contentView addSubview:goodsNameLbl];
    [self.contentView addSubview:descLbl];
    [self.contentView addSubview:priceLbl];
    [self.contentView addSubview:seperator];
}

- (void)configureCellWithAnyData:(id)anyData {
    
    [self configureCellWithDictionary:anyData];
}

- (void)configureCellWithDictionary:(NSDictionary *)dict {
    
    UIImageView *countryFlag = [self.contentView viewWithTag:PM_CELL_COUNTRY_TAG];
    UILabel *goodsNameLbl = [self.contentView viewWithTag:PM_CELL_GOODS_TAG];
    UILabel *descLbl = [self.contentView viewWithTag:PM_CELL_DESC_TAG];
    UILabel *priceLbl = [self.contentView viewWithTag:PM_CELL_PRICE_TAG];
    
    static NSDictionary *imgHandleMap = nil;
    
    if (!imgHandleMap) {
        
        NSString *strClass = NSStringFromClass([NSString class]);
        NSString *imgClass = NSStringFromClass([UIImage class]);
        
        UIImage *image = ({
            UIImage *img = [UIImage imageNamed:dict[PMDetailViewCellImageKey]];
            img ? img : [UIImage new];
        });
        
        imgHandleMap = @{strClass:image,imgClass:dict[PMDetailViewCellImageKey]};
        
    }
    
    id unknowObjClass = NSStringFromClass([dict[PMDetailViewCellImageKey] class]);
    countryFlag.image = imgHandleMap[unknowObjClass];
    goodsNameLbl.text = dict[PMDetailViewCellTitleKey];
    descLbl.text = dict[PMDetailViewCellDescKey];
    priceLbl.text = dict[PMDetailViewCellPriceKey];
    
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
