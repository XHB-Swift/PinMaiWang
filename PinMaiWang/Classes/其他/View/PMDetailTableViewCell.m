//
//  PMDetailTableViewCell.m
//  详情页
//
//  Created by 嚼华先森 on 2017/6/23.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMDetailTableViewCell.h"
#import "UILabel+LabelHeightAndWidth.h"
#import "NSString+AttributedString.h"

@interface PMDetailTableViewCell ()

// 商品名称
@property (nonatomic,strong) UILabel * title;
// 描述
@property (nonatomic,strong) UILabel * tips;

// 单价
@property (nonatomic,strong) UILabel * price;
// 总价
@property (nonatomic,strong) UILabel * totals;


@end


@implementation PMDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.bounds.size.width-20, 30)];
        [self addSubview:self.title];
        
        self.tips = [[UILabel alloc]init];
        self.tips.numberOfLines = 0;
        [self addSubview:self.tips];
        
        self.price = [[UILabel alloc]init];
        self.price.font = [UIFont systemFontOfSize:13.0];
        self.price.textColor = [UIColor redColor];
        [self addSubview:self.price];
        
        self.totals = [[UILabel alloc]init];
        self.totals.textAlignment = NSTextAlignmentCenter;
        self.totals.textColor = [UIColor redColor];
        self.totals.font = [UIFont systemFontOfSize:13.0];
        [self addSubview:self.totals];

    }
    return self;
    
}

-(void)setModel:(PMDeatilModel *)model{
    
    _model = model;
    self.title.text = model.name;
    self.tips.attributedText = [model.tips stringWithLineSpeace:0 WithTextColor:[UIColor redColor] AndWithTextFont:[UIFont systemFontOfSize:10.0]];
    CGFloat tipsHeight = [model.tips HeightWithLineSpeace:0 WithFont:[UIFont systemFontOfSize:10.0] AndWidth:self.bounds.size.width];
    self.tips.frame = CGRectMake(10, self.title.maxY+5, self.bounds.size.width-20, tipsHeight);
    
    NSMutableAttributedString *attText = [[NSMutableAttributedString alloc]initWithString:model.price];
    [attText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20.0] range:NSMakeRange(1, 6)];
    self.price.attributedText = attText;
    self.price.frame = CGRectMake(10, self.tips.maxY , self.bounds.size.width/2-20, 30);
    
    NSMutableAttributedString *attTotals = [[NSMutableAttributedString alloc]initWithString:model.allPrices];
    [attTotals addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20.0] range:NSMakeRange(1, 7)];
    self.totals.attributedText = attTotals;
    self.textLabel.text = model.title;
    self.detailTextLabel.text = model.date;
    self.totals.frame = CGRectMake(self.price.maxX, self.tips.maxY, self.bounds.size.width/2-10, 30);

}



@end
